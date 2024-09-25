<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>Login</h2>
    <form action="LoginServlet" method="post">
        <label for="restaurant-id">Restaurant ID:</label>
        <input type="text" id="restaurant-id" name="restaurant-id" required><br><br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>
        <input type="submit" value="Login">
    </form>
   
        <p>Don't have an account? <a href="registration.jsp">Register here</a></p>
   

</body>
</html>