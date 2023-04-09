package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Jogos;
import persistence.GenericDAO;
import persistence.JogosDAO;


@WebServlet("/tabelas")
public class TabelasJogosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public TabelasJogosServlet() {
        super();
     
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String botao = request.getParameter("botao");
		
		GenericDAO gDao = new GenericDAO();
		JogosDAO jDao = new JogosDAO(gDao);
		
		List<Jogos> tabelasjogos = new ArrayList<>();
		String erro = "";
		String saida = "";
		
		try {
			
			LocalDate data = (LocalDate.parse(request.getParameter("data")));
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy", Locale.US);
			String data_string = data.format(dtf);
			if(botao.equalsIgnoreCase("buscar")) {
                
				tabelasjogos = jDao.buscarJogos(data_string);
				
			}
			
		} catch (SQLException | ClassNotFoundException e) {
			erro = e.getMessage();
		}finally {
			
        request.setAttribute("saida", saida);
        request.setAttribute("erro", erro);     
        
        request.setAttribute("tabelasjogos", tabelasjogos);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("tabelas.jsp");
		dispatcher.forward(request, response);
		}
	}

		
	}


