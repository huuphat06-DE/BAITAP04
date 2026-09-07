<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<html>
<head><title>Quản lý Sản Phẩm</title></head>
<body>
    <h2>Quản lý Sản Phẩm</h2>
    <a href="${pageContext.request.contextPath}/admin/product/add">Thêm Sản phẩm</a> | 
    <a href="${pageContext.request.contextPath}/admin/categories">Quản lý Danh mục</a>
    <table border="1" width="100%">
        <tr>
            <th>ID</th>
            <th>Ảnh</th>
            <th>Tên SP</th>
            <th>Giá</th>
            <th>Danh mục</th>
            <th>Action</th>
        </tr>
        <c:forEach items="${listprod}" var="p">
            <tr>
                <td>${p.id}</td>
                <td>
                    <c:choose>
                        <c:when test="${not empty p.image and fn:startsWith(p.image, 'http')}">
                            <c:set var="imgUrl" value="${p.image}" />
                        </c:when>
                        <c:otherwise>
                            <c:set var="imgUrl" value="${pageContext.request.contextPath}/image?fname=${p.image}" />
                        </c:otherwise>
                    </c:choose>
                    <img height="50" src="${imgUrl}" />
                </td>
                <td>${p.name}</td>
                <td><fmt:formatNumber value="${p.price}" pattern="#,###"/> đ</td>
                <td>${p.category.categoryname}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/admin/product/edit?id=${p.id}">Sửa</a> |
                    <a href="${pageContext.request.contextPath}/admin/product/delete?id=${p.id}">Xóa</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
