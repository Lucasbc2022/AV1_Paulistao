<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="./css/styles.css">
<title>Tabela de Jogos</title>
</head>
<body>
     <div>
          <jsp:include page="menu.jsp"/>
     </div>
     <div align="center">
          <form action="tabelas" method="post">
               <table class="z">
                 <tr>
                 <br />
                 
                 <td><input type="date" id="data" name="data"><td>
                 <td><input type="submit" id="botao" name="botao" value="Buscar"><td>
                 
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

	   <c:choose>
		<c:when test="${not empty tabelasjogos }">
			<table class="z" border="1">
				<thead>
					<tr>
						<th>Nome do Time A</th>
						
						<th>Nome do Time B</th>
						
						<th>Data</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${tabelasjogos }" var="tj">
						<tr>
							<td><c:out value="${tj.nometimeA }"></c:out></td>
							
							<td><c:out value="${tj.nometimeB }"></c:out></td>
							
							<td><c:out value="${tj.data }"></c:out></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:when>
      
		<c:otherwise>
			<div class="z">
                  <p>Não a jogos nessa data</p>
			</div>
		</c:otherwise>		
	 </c:choose>		
	</div>
</body>
</html>