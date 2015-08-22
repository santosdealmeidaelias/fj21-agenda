package br.com.caelum.agenda.mvc.logica;

import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.caelum.agenda.dao.ContatoDao;
import br.com.caelum.agenda.modelo.Contato;

public class SalvaContatoLogic implements Logica{

	@Override
	public String executa(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		// recupera paratros do contato
		String nome = request.getParameter("nome");
		String email = request.getParameter("email");
		String endereco = request.getParameter("endereco");
		
		// monta a data
		String dataEmTexto = request.getParameter("dataNascimento");
		Date date = new SimpleDateFormat("dd/MM/yyyy").parse(dataEmTexto);		
		Calendar dataDeNascimento = Calendar.getInstance();
		dataDeNascimento.setTime(date);
		
		
		
		Contato contato = new Contato();		
		String id = request.getParameter("id");
		if(! (id.equals("") ||id.trim().equals("")))
			contato.setId(Long.parseLong(request.getParameter("id")));
		
		contato.setNome(nome);
		contato.setEmail(email);
		contato.setEndereco(endereco);
		contato.setDataNascimento(dataDeNascimento);
		
		// Verifica se é para adicionar um novo contato ou atualizar um existente
		Connection connection = (Connection)request.getAttribute("connection");
		ContatoDao dao = new ContatoDao(connection);		
		if(contato.getId() != null){
			dao.altera(contato);
		}else {
			dao.adiciona(contato);
		}
		
		return "mvc?logica=ListaContatosLogic";
	}

}
