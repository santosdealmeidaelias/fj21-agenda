<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista Contatos Agenda</title>
</head>
<body>
	<c:import url="/WEB-INF/jsp/cabecalho.jsp" />
	
	<br /><br />
	
	<a href="mvc?logica=AdicionaContatoLogic">Adicionar contato</a>
	<br /><br />
	
	<table border="1">
		<thead>
			<tr>
				<th>Nome</th>
				<th>Email IF</th>
				<th>Email SWINCH</th>
				<th>Endereco</th>
				<th>Data de Nascimento</th>
				<th>Remover</th>
				<th>Alterar</th>
			</tr>
		</thead>
		<!-- percorre contatos montando as linhas da tabela -->
		<c:forEach var="contato" items="${contatos}" varStatus="id">
			<tr bgcolor="#${id.count % 2 == 0 ? 'aaee88' : 'ffffff'}">
				<td>${contato.nome}</td>
				<td>
					<c:if test="${not empty contato.email}">
						<a href="mailto:${contato.email}">${contato.email }</a>
					</c:if>
					<c:if test="${empty contato.email}">
						E-mail não informado.
					</c:if>
				</td>
				<td>
					<c:choose>
						<c:when test="${not empty contato.email}">
							<a href="mailto:${contato.email}">${contato.email }</a>
						</c:when>
						<c:otherwise>
							E-mail não informado.
						</c:otherwise>
					</c:choose>
				</td>
				<td>${contato.endereco}</td>
				<td>
					<fmt:formatDate value="${contato.dataNascimento.time}" pattern="dd/MM/yyyy"/>
					
				</td>
				<td>
					<a href="mvc?logica=RemoveContatoLogic&id=${contato.id}">Remover</a>
				</td>
				<td>
					<a href="mvc?logica=AlteraContatoLogic&id=${contato.id}">Alterar</a>
				</td>
			</tr>			
		</c:forEach>
	</table>
	
	<c:import url="/WEB-INF/jsp/rodape.jsp" />
</body>
</html>