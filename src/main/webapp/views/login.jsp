<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head><title>Đăng nhập</title></head>
<body>
    <div class="row justify-content-center">
        <div class="col-md-5">
            <div class="card shadow-sm border-0 mt-5">
                <div class="card-body p-4">
                    <h3 class="text-center mb-4 fw-bold">Đăng nhập</h3>
                    <p class="text-danger text-center fw-bold">${error}</p>
                    <form action="${pageContext.request.contextPath}/login" method="post" class="needs-validation" novalidate>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Username</label>
                            <input type="text" class="form-control" name="username" required>
                            <div class="invalid-feedback">Vui lòng nhập Username.</div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Password</label>
                            <input type="password" class="form-control" name="password" required>
                            <div class="invalid-feedback">Vui lòng nhập Password.</div>
                        </div>
                        <button type="submit" class="btn btn-primary w-100 mb-3 fw-bold">Đăng nhập</button>
                        <div class="d-flex justify-content-between">
                            <a href="${pageContext.request.contextPath}/register" class="text-decoration-none">Đăng ký tài khoản</a>
                            <a href="${pageContext.request.contextPath}/forgot-password" class="text-decoration-none">Quên mật khẩu?</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>\n