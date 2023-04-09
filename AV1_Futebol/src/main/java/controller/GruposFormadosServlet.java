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


@WebServlet("/gruposformados")
public class GruposFormadosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public GruposFormadosServlet() {
        super();
       
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String botao = request.getParameter("botao");
		
		GenericDAO gDao = new GenericDAO();
		GruposDAO gruDao = new GruposDAO(gDao);
		

		List<Grupos> gruposA = new ArrayList<>();
		
		
		List<Grupos> gruposB = new ArrayList<>();
		

		List<Grupos> gruposC = new ArrayList<>();
		

		List<Grupos> gruposD = new ArrayList<>();
		
		String erro = "";
		String saida = "";
		
		try {
			if (botao.equalsIgnoreCase("exibir")) {
				gruposA = gruDao.vergrupoA();
				gruposB = gruDao.vergrupoB();
				gruposC = gruDao.vergrupoC();
				gruposD = gruDao.vergrupoD();
			}
			
			
		} catch (SQLException | ClassNotFoundException e) {
			erro = e.getMessage();
		}finally {
			request.setAttribute("saida", saida);
	        request.setAttribute("erro", erro);     
	   
	        request.setAttribute("gruposA", gruposA);
	        
    
	       
	        request.setAttribute("gruposB", gruposB);
	        
	   
	        request.setAttribute("gruposC", gruposC);
	        
	    
	        request.setAttribute("gruposD", gruposD);
	        
	        RequestDispatcher dispatcher = request.getRequestDispatcher("gruposformados.jsp");
			dispatcher.forward(request, response);
			}
		}
	}


