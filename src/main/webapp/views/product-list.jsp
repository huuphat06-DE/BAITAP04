<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head><title>Products</title></head>
<body>
    <h1>Tất cả sản phẩm</h1>
    <a href="${pageContext.request.contextPath}/home">Về trang chủ</a>
    <hr>
    <div style="display: flex; flex-wrap: wrap;">
        <c:forEach items="${products}" var="p">
            <div style="border: 1px solid #ccc; margin: 10px; padding: 10px; width: 200px; text-align: center;">
                <a href="${pageContext.request.contextPath}/product/detail?id=${p.id}">
                    <img height="100" src="${pageContext.request.contextPath}/image?fname=${p.image}" /><br>
                    <b>${p.name}</b><br>
                    Giá: ${p.price}
                </a>
            </div>
        </c:forEach>
    </div>
    <hr>
    <div>
        <c:if test="${totalPage > 0}">
            <c:forEach begin="0" end="${totalPage - 1}" var="i">
                <c:if test="${i == currentPage}">
                    <b>[${i + 1}]</b>
                </c:if>
                <c:if test="${i != currentPage}">
                    <a href="${pageContext.request.contextPath}/product?page=${i}">[${i + 1}]</a>
                </c:if>
            </c:forEach>
        </c:if>
    </div>
</body>
</html>
