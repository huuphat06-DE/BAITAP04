<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head><title>Home</title></head>
<body>
    <div style="float: right;">
        <c:if test="${not empty sessionScope.account}">
            Xin chào, ${sessionScope.account.username} | <a href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
        </c:if>
        <c:if test="${empty sessionScope.account}">
            <a href="${pageContext.request.contextPath}/login">Đăng nhập</a>
        </c:if>
    </div>
    <h1>Trang Chủ - 10 Sản phẩm mới nhất</h1>
    <a href="${pageContext.request.contextPath}/product">Xem tất cả sản phẩm</a>
    <hr>
    <div style="display: flex; flex-wrap: wrap;">
        <c:forEach items="${top10}" var="p">
            <div style="border: 1px solid #ccc; margin: 10px; padding: 10px; width: 200px; text-align: center;">
                <a href="${pageContext.request.contextPath}/product/detail?id=${p.id}">
                    <img height="100" src="${pageContext.request.contextPath}/image?fname=${p.image}" /><br>
                    <b>${p.name}</b><br>
                    Giá: ${p.price}
                </a>
            </div>
        </c:forEach>
    </div>
</body>
</html>
