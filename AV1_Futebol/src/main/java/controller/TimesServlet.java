package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Times;
import persistence.GenericDAO;
import persistence.TimesDAO;


@WebServlet("/times")
public class TimesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public TimesServlet() {
        super();
     
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	String botao = request.getParameter("botao");	
		
    GenericDAO gDao = new GenericDAO();
    TimesDAO tDao = new TimesDAO(gDao);
    
    List<Times> times = new ArrayList<>();
    String erro = "";
    String saida = "";
    
    try {
    	if(botao.equalsIgnoreCase("listar")) {
    		times = tDao.listar();
    	}
    } catch (SQLException | ClassNotFoundException e) {
    	erro = e.getMessage();
    } finally {
    	request.setAttribute("saida", saida);
    	request.setAttribute("erro", erro);
    	request.setAttribute("times", times);
    	
    	RequestDispatcher dispatcher = request.getRequestDispatcher("timesparticipantes.jsp");
    	dispatcher.forward(request, response);
    }
    
	}

}
