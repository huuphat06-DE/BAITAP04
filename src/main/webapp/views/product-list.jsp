<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head><title>Sản Phẩm</title></head>
<body>
    <div class="d-flex justify-content-between align-items-center mb-4 mt-3">
        <h2 class="fw-bold">Tất cả sản phẩm</h2>
        <a href="${pageContext.request.contextPath}/home" class="btn btn-outline-secondary">Về trang chủ</a>
    </div>
    
    <div class="row row-cols-1 row-cols-md-3 row-cols-lg-4 g-4 mb-4">
        <c:forEach items="${products}" var="p">
            <div class="col">
                <div class="card h-100 shadow-sm border-0">
                    <a href="${pageContext.request.contextPath}/product/detail?id=${p.id}" class="text-decoration-none text-dark">
                        <img src="${pageContext.request.contextPath}/image?fname=${p.image}" class="card-img-top" style="height: 250px; object-fit: cover;" alt="${p.name}">
                        <div class="card-body text-center">
                            <h6 class="card-title text-truncate fw-bold">${p.name}</h6>
                            <p class="card-text text-danger fw-bold">${p.price} đ</p>
                        </div>
                    </a>
                </div>
            </div>
        </c:forEach>
    </div>
    
    <nav>
        <ul class="pagination justify-content-center">
            <c:if test="${totalPage > 0}">
                <c:forEach begin="0" end="${totalPage - 1}" var="i">
                    <li class="page-item ${i == currentPage ? 'active' : ''}">
                        <a class="page-link" href="${pageContext.request.contextPath}/product?page=${i}">${i + 1}</a>
                    </li>
                </c:forEach>
            </c:if>
        </ul>
    </nav>
</body>
</html>\n