<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head><title>Đăng ký</title></head>
<body>
    <div class="row justify-content-center">
        <div class="col-md-5">
            <div class="card shadow-sm border-0 mt-5">
                <div class="card-body p-4">
                    <h3 class="text-center mb-4 fw-bold">Đăng ký</h3>
                    <p class="text-danger text-center fw-bold">${error}</p>
                    <form action="${pageContext.request.contextPath}/register" method="post" class="needs-validation" novalidate>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Username</label>
                            <input type="text" class="form-control" name="username" minlength="4" required>
                            <div class="invalid-feedback">Username phải có ít nhất 4 ký tự.</div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Email</label>
                            <input type="email" class="form-control" name="email" required>
                            <div class="invalid-feedback">Email không hợp lệ.</div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Password</label>
                            <input type="password" class="form-control" name="password" minlength="6" required>
                            <div class="invalid-feedback">Mật khẩu phải có ít nhất 6 ký tự.</div>
                        </div>
                        <button type="submit" class="btn btn-primary w-100 mb-3 fw-bold">Đăng ký</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>\n