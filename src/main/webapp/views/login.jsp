<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head><title>Login</title></head>
<body>
    <h2>Đăng nhập</h2>
    <p style="color:red">${error}</p>
    <form action="${pageContext.request.contextPath}/login" method="post">
        Username: <input type="text" name="username" required><br>
        Password: <input type="password" name="password" required><br>
        <button type="submit">Đăng nhập</button>
    </form>
    <a href="${pageContext.request.contextPath}/register">Đăng ký</a> | 
    <a href="${pageContext.request.contextPath}/forgot-password">Quên mật khẩu</a>
</body>
</html>
