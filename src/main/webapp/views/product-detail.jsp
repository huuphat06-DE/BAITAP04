<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head><title>${product.name}</title></head>
<body>
    <div class="card shadow-sm border-0 mt-4">
        <div class="row g-0">
            <div class="col-md-5">
                <img src="${pageContext.request.contextPath}/image?fname=${product.image}" class="img-fluid rounded-start h-100" style="object-fit: cover;" alt="${product.name}">
            </div>
            <div class="col-md-7">
                <div class="card-body p-5">
                    <h2 class="card-title fw-bold mb-3">${product.name}</h2>
                    <h4 class="text-danger fw-bold mb-4">${product.price} đ</h4>
                    <p class="card-text"><strong>Danh mục:</strong> <span class="badge bg-secondary">${product.category.categoryname}</span></p>
                    <p class="card-text"><strong>Mô tả:</strong> <br> ${product.description}</p>
                    <div class="mt-5">
                        <a href="${pageContext.request.contextPath}/home" class="btn btn-outline-secondary me-2">Về trang chủ</a>
                        <a href="${pageContext.request.contextPath}/product" class="btn btn-outline-primary">Xem tất cả sản phẩm</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>\n