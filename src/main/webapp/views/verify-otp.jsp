<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head><title>Verify OTP</title></head>
<body>
    <h2>Xác thực OTP</h2>
    <p>Một mã OTP đã được gửi đến email của bạn.</p>
    <p style="color:red">${error}</p>
    <form action="${pageContext.request.contextPath}/verify" method="post">
        Nhập OTP: <input type="text" name="otp" required><br>
        <button type="submit">Xác nhận</button>
    </form>
</body>
</html>
