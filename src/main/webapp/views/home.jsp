<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<html>
<head><title>Trang Chủ</title></head>
<body>
    <div class="d-flex justify-content-between align-items-center mb-4 mt-3">
        <h2 class="fw-bold">10 Sản phẩm mới nhất</h2>
        <a href="${pageContext.request.contextPath}/product" class="btn btn-outline-primary">Xem tất cả</a>
    </div>
    
    <div class="row row-cols-1 row-cols-md-3 row-cols-lg-5 g-4">
        <c:forEach items="${top10}" var="p">
            <div class="col">
                <div class="card h-100 shadow-sm border-0">
                    <a href="${pageContext.request.contextPath}/product/detail?id=${p.id}" class="text-decoration-none text-dark">
                        <c:choose>
                            <c:when test="${not empty p.image and fn:startsWith(p.image, 'http')}">
                                <c:set var="imgUrl" value="${p.image}" />
                            </c:when>
                            <c:otherwise>
                                <c:set var="imgUrl" value="${pageContext.request.contextPath}/image?fname=${p.image}" />
                            </c:otherwise>
                        </c:choose>
                        <img src="${imgUrl}" class="card-img-top" style="height: 200px; object-fit: cover;" alt="${p.name}">
                        <div class="card-body text-center">
                            <h6 class="card-title text-truncate fw-bold">${p.name}</h6>
                            <p class="card-text text-danger fw-bold"><fmt:formatNumber value="${p.price}" pattern="#,###"/> đ</p>
                        </div>
                    </a>
                </div>
            </div>
        </c:forEach>
    </div>
</body>
</html>\n