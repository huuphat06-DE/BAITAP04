<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head><title>Register</title></head>
<body>
    <h2>Đăng ký</h2>
    <p style="color:red">${error}</p>
    <form action="${pageContext.request.contextPath}/register" method="post">
        Username: <input type="text" name="username" required><br>
        Email: <input type="email" name="email" required><br>
        Password: <input type="password" name="password" required><br>
        <button type="submit">Đăng ký</button>
    </form>
</body>
</html>
