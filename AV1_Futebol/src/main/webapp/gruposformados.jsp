<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="./css/styles.css">
<title>Grupos</title>
</head>
<body>
     <div>
          <jsp:include page="menu.jsp"/>
     </div>
          <div align="center">
          <form action="gruposformados" method="post">
               <table>
                 <tr>
                 <br> 
                 <td><input type="submit" id="botao" 
                 name="botao" value="Exibir"><td>
                 </tr>
               </table>
               

          </form>
     </div>
     
 <br>
     <div class="wrapper" align="center">
     
     <div >
		<c:if test="${not empty erro }">
			<H2><c:out value="${erro }" /></H2>
		</c:if>
		<c:if test="${not empty saida }">
			<H2><c:out value="${saida }" /></H2>
		</c:if>
	</div>
	<div class="tabela">
		<c:if test="${not empty gruposA }">
		
		
			<table class="tableA" border="1">
				<thead>
					<tr>
						<th>Nome do Time</th>
						<th>Grupo</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${gruposA }" var="ga">
						<tr align="center">
							<td><c:out value="${ga.nometime }"></c:out></td>
							<td><c:out value="${ga.grupo }"></c:out></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</c:if>	
		</div>
		
	<div class="tabela">
		<c:if test="${not empty erro }">
			<H2><c:out value="${erro }" /></H2>
		</c:if>
		<c:if test="${not empty saida }">
			<H2><c:out value="${saida }" /></H2>
		</c:if>
	</div>
	<div class="tabela">
		<c:if test="${not empty gruposB }">
		
		
			<table class="tableB" border="1">
				<thead>
					<tr>
						<th>Nome do Time</th>
						<th>Grupo</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${gruposB }" var="gb">
						<tr align="center">
							<td><c:out value="${gb.nometime }"></c:out></td>
							<td><c:out value="${gb.grupo }"></c:out></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</c:if>	
		
		</div>
		
		<div class="tabela">
		<c:if test="${not empty erro }">
			<H2><c:out value="${erro }" /></H2>
		</c:if>
		<c:if test="${not empty saida }">
			<H2><c:out value="${saida }" /></H2>
		</c:if>
	</div>
	
	
	<div class="tabela">
		<c:if test="${not empty gruposC }">
		
		
			<table class="tableC" border="1">
				<thead>
					<tr>
						<th>Nome do Time</th>
						<th>Grupo</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${gruposC }" var="gc">
						<tr align="center">
							<td><c:out value="${gc.nometime }"></c:out></td>
							<td><c:out value="${gc.grupo }"></c:out></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</c:if>	
		
	</div>
	  
	  
	  
	  <div>
		<c:if test="${not empty erro }">
			<H2><c:out value="${erro }" /></H2>
		</c:if>
		<c:if test="${not empty saida }">
			<H2><c:out value="${saida }" /></H2>
		</c:if>
	</div>
	<div class="tabela">
		<c:if test="${not empty gruposD }">
		
		
			<table class="tableD" border="1">
				<thead>
					<tr>
						<th>Nome do Time</th>
						<th>Grupo</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${gruposD }" var="gd">
						<tr align="center">
							<td><c:out value="${gd.nometime }"></c:out></td>
							<td><c:out value="${gd.grupo }"></c:out></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</c:if>	
	</div>
	</div>
</body>
</html>