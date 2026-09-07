<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head><title>Sửa Sản Phẩm</title></head>
<body>
    <h2>Sửa Sản Phẩm</h2>
    <form action="${pageContext.request.contextPath}/admin/product/update" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${prod.id}">
        Tên: <input type="text" name="name" value="${prod.name}" required><br>
        Giá: <input type="number" step="0.01" name="price" value="${prod.price}" required><br>
        Mô tả: <textarea name="description">${prod.description}</textarea><br>
        Danh mục: 
        <select name="categoryId">
            <c:forEach items="${categories}" var="c">
                <option value="${c.categoryId}" ${prod.category.categoryId == c.categoryId ? 'selected' : ''}>${c.categoryname}</option>
            </c:forEach>
        </select><br>
        Ảnh: <img height="50" src="${pageContext.request.contextPath}/image?fname=${prod.image}" /><br>
        <input type="file" name="imageFile"><br>
        <button type="submit">Lưu</button>
    </form>
</body>
</html>
