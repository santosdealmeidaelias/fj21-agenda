package br.com.caelum.agenda.mvc.logica;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.caelum.agenda.dao.ContatoDao;
import br.com.caelum.agenda.modelo.Contato;

public class AlteraContatoLogic implements Logica{

	@Override
	public String executa(HttpServletRequest request, HttpServletResponse response) throws Exception {
		long id = Long.parseLong(request.getParameter("id"));
		
		Connection connection = (Connection)request.getAttribute("connection");
		Contato contato = new ContatoDao(connection).pesquisa(id);
		request.setAttribute("contato", contato);
		
		
		return "WEB-INF/jsp/formulario-contatos.jsp";
	}

}
