<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head><title>${product.name}</title></head>
<body>
    <a href="${pageContext.request.contextPath}/home">Về trang chủ</a> | 
    <a href="${pageContext.request.contextPath}/product">Về danh sách</a>
    <hr>
    <h1>${product.name}</h1>
    <img height="300" src="${pageContext.request.contextPath}/image?fname=${product.image}" />
    <p><b>Danh mục:</b> ${product.category.categoryname}</p>
    <p><b>Giá:</b> ${product.price}</p>
    <p><b>Mô tả:</b> ${product.description}</p>
</body>
</html>
