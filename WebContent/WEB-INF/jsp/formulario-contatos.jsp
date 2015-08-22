<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="caelum" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
	<link rel="stylesheet" href="<c:url value="/css/jquery-ui.css" />" />
	<script type="text/javascript" src="<c:url value="/js/jquery.js" />"></script>
	<script type="text/javascript" src="<c:url value="/js/jquery-ui.js" />"></script>
	
<title>Insert title here</title>
</head>
<body>
	<c:import url="/WEB-INF/jsp/cabecalho.jsp" />	
	
	
	
	<form action="mvc">
		<input type="hidden" name="logica" value="SalvaContatoLogic" />
		<input type="hidden" name="id" value="${contato.id}" />
		
		Nome: <input type="text" name="nome" value="${contato.nome}" /><br />
		E-mail: <input type="text" name="email" value="${contato.email}" /><br />
		Endereco: <input type="text" name="endereco" value="${contato.endereco}" /><br />
		
		Data de Nascimento: 
		
		<fmt:formatDate value="${contato.dataNascimento.time}" pattern="dd/MM/yyyy" var="dataFormatada"/>		
		<caelum:campoData id="dataNascimento" value="${dataFormatada}" />
			
		<br />
		<input type="submit" value="salvar" />
	</form>
	
	
	
	<c:import url="/WEB-INF/jsp/rodape.jsp" />
</body>
</html>