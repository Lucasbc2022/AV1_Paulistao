<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="./css/styles.css">
<title>Lista de Jogos</title>
</head>
<body>
     <div>
          <jsp:include page="menu.jsp"/>
     </div>
     <div align="center">
          <form action="jogos" method="post">
               <table class="z">
                 <tr>
                 <br />
                 <td><input type="submit" id="botao" name="botao" value="Listar"><td>
                 
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
		<c:if test="${not empty jogos }">
			<table class="z"border="1">
				<thead>
					<tr>
						<th>Nome do Time A</th>
					
						<th>Nome do Time B</th>
					
						<th>Data</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${jogos }" var="j">
						<tr>
							<td><c:out value="${j.nometimeA }"></c:out></td>
							
							<td><c:out value="${j.nometimeB }"></c:out></td>
							
							<td><c:out value="${j.data }"></c:out></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>	
	</div>
</body>
</html>