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

import model.Grupos;
import persistence.GenericDAO;
import persistence.GruposDAO;


@WebServlet("/grupos")
public class SorteioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SorteioServlet() {
        super();
        
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
           String botao = request.getParameter("botao");
           
           GenericDAO gDao = new GenericDAO();
           GruposDAO grupoDAO = new GruposDAO(gDao);
           
           
           List<Grupos> grupos = new ArrayList<>();
           String erro = "";
           String saida = "";
           
           try {
        	   if(botao.equalsIgnoreCase("sortear")) {
        		   grupos = grupoDAO.sorteio();
        	   }
        	   
           } catch (SQLException | ClassNotFoundException e) {
        	   erro = e.getMessage();
           } finally {
        	   request.setAttribute("saida", saida);
        	   request.setAttribute("erro", erro);
        	   
        	   request.setAttribute("grupos", grupos);
        	   
        	   RequestDispatcher dispatcher = request.getRequestDispatcher("sorteio.jsp");
        	   dispatcher.forward(request, response);
           }
           	   
	}

}
