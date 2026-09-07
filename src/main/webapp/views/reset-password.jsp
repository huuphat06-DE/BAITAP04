<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head><title>Reset Password</title></head>
<body>
    <h2>Đổi mật khẩu mới</h2>
    <p style="color:red">${error}</p>
    <form action="${pageContext.request.contextPath}/reset-password" method="post">
        Mật khẩu mới: <input type="password" name="password" required><br>
        <button type="submit">Cập nhật</button>
    </form>
</body>
</html>
