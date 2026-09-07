<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head><title>Thêm Sản Phẩm</title></head>
<body>
    <h2>Thêm Sản Phẩm</h2>
    <form action="${pageContext.request.contextPath}/admin/product/insert" method="post" enctype="multipart/form-data">
        Tên: <input type="text" name="name" required><br>
        Giá: <input type="number" step="0.01" name="price" required><br>
        Mô tả: <textarea name="description"></textarea><br>
        Danh mục: 
        <select name="categoryId">
            <c:forEach items="${categories}" var="c">
                <option value="${c.categoryId}">${c.categoryname}</option>
            </c:forEach>
        </select><br>
        Ảnh: <input type="file" name="imageFile"><br>
        <button type="submit">Lưu</button>
    </form>
</body>
</html>
