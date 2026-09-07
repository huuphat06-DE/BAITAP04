<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head><title>Forgot Password</title></head>
<body>
    <h2>Quên mật khẩu</h2>
    <p style="color:red">${error}</p>
    <form action="${pageContext.request.contextPath}/forgot-password" method="post">
        Email: <input type="email" name="email" required><br>
        <button type="submit">Gửi OTP</button>
    </form>
</body>
</html>
