<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="./css/styles.css">
<title>Sorteio de Times</title>
</head>
<body>
     <div>
          <jsp:include page="menu.jsp"/>
     </div>
          <div align="center">
          <form action="grupos" method="post">
               <table class="z">
                 <tr>
                 <br> 
                 <td><input type="submit" id="botao" name="botao" value="Sortear"><td>           
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
		<c:if test="${not empty grupos }">
			<table class="z" border="1">
				<thead>
					<tr>
						<th>Grupo</th>
						<th>Nome do Time</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${grupos }" var="g">
						<tr>
							<td><c:out value="${g.nometime }"></c:out></td>
							<td><c:out value="${g.grupo }"></c:out></td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>	
	</div>
</body>

</body>
</html>