<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head><title>Hồ sơ cá nhân</title></head>
<body>
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow-sm border-0">
                <div class="card-header bg-primary text-white">
                    <h4 class="mb-0">Hồ sơ cá nhân</h4>
                </div>
                <div class="card-body">
                    <c:if test="${not empty msg}">
                        <div class="alert alert-success">${msg}</div>
                    </c:if>
                    <form action="${pageContext.request.contextPath}/profile" method="post" enctype="multipart/form-data" class="needs-validation" novalidate>
                        <div class="text-center mb-4">
                            <c:if test="${not empty sessionScope.account.images}">
                                <img src="${pageContext.request.contextPath}/image?fname=${sessionScope.account.images}" class="rounded-circle img-thumbnail shadow-sm" style="width: 150px; height: 150px; object-fit: cover;">
                            </c:if>
                            <c:if test="${empty sessionScope.account.images}">
                                <div class="bg-secondary text-white rounded-circle d-flex align-items-center justify-content-center mx-auto shadow-sm" style="width: 150px; height: 150px; font-size: 48px;">
                                    ${sessionScope.account.username.substring(0,1).toUpperCase()}
                                </div>
                            </c:if>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Tài khoản</label>
                            <input type="text" class="form-control" value="${sessionScope.account.username}" readonly>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Email</label>
                            <input type="email" class="form-control" value="${sessionScope.account.email}" readonly>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Họ và tên</label>
                            <input type="text" class="form-control" name="fullname" value="${sessionScope.account.fullname}" required>
                            <div class="invalid-feedback">Vui lòng nhập họ tên.</div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Số điện thoại</label>
                            <input type="text" class="form-control" name="phone" value="${sessionScope.account.phone}" pattern="[0-9]{10}" required>
                            <div class="invalid-feedback">Vui lòng nhập đúng 10 số điện thoại.</div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Ảnh đại diện</label>
                            <input type="file" class="form-control" name="imageFile" accept="image/*">
                        </div>
                        <button type="submit" class="btn btn-primary w-100 fw-bold">Cập nhật Profile</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>\n