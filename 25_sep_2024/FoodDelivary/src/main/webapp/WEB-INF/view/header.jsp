<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2> header</h2> 
<h3> Restuarant Name: ${resList}</h3> 
<c:forEach var="res" items="${resList}"> 
	<li>${res.resName}</li> 
	<c:forEach var="cus" items="${res.cusinsList}"> 
		<li>${cus}</li> 
	</c:forEach> 
</c:forEach>

</body>
</html>