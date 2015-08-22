<%@page import="java.sql.Connection"%>
<%@page import="br.com.caelum.jdbc.ConnectionFactory"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page import="java.util.*, 
	br.com.caelum.agenda.dao.*, 
	br.com.caelum.agenda.modelo.*" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listagem Contatos Scriptlet</title>
</head>
<body>
	<table border="1">
	<thead>
		<td>Nome</td>
		<td>Email</td>
		<td>Endereço</td>
		<td>Data de Nascimento</td>
	</thead>
	<%
		Connection c = new ConnectionFactory().getConnection();
		ContatoDao dao = new ContatoDao(c);
		List<Contato> contatos = dao.getLista();
		
		for(Contato contato : contatos){
	%>	
		<tr>
			<td><%=contato.getNome() %></td>
			<td><%=contato.getEmail() %></td>
			<td><%=contato.getEndereco() %></td>
			<td><%= new SimpleDateFormat("dd/MM/yyyy").format(contato.getDataNascimento().getTime())  %></td>
		</tr>
	<% }
		c.close();
	%>	
	</table>
	
</body>
</html>