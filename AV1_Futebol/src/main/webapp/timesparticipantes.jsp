<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="./css/styles.css">
<title>Times Participantes</title>
</head>
<body>
     <div>
          <jsp:include page="menu.jsp"/>
     </div>
     <div align="center">
          <form action="times" method="post">
			<table class="z"> 
			<br />
			<tr>
			    <td><input type="submit" id="botao" name="botao" value="Listar"></td>
			</tr>
		    </table>
		  </form>
     </div>
     <br />
     <div align="center">
		<c:if test="${not empty erro }">
			<H2><c:out value="${erro }" /></H2>
		</c:if>
		<c:if test="${not empty saida }">
			<H2><c:out value="${saida }" /></H2>
		</c:if>
	</div>
	<div align="center">
		<c:if test="${not empty times }">
			<table class="z" border="1">
				<thead>
					<tr>
						<th>Codigo do Time</th>
						<th>Nome do Time</th>
						<th>Cidade</th>
						<th>Estadio</th>
						<th>Material Exportivo</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${times }" var="t">
						<tr>
							<td><c:out value="${t.codigotime }"></c:out></td>
							<td><c:out value="${t.nometime }"></c:out></td>
							<td><c:out value="${t.cidade }"></c:out></td>
							<td><c:out value="${t.estadio }"></c:out></td>
							<td><c:out value="${t.exportivo }"></c:out></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>	
	</div>
</body>
</html>