<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Category List</title>
</head>
<body>
    <a href="<c:url value='/admin/category/add'/>">Add Category</a><br>
    <hr>
    <table border="1" width="100%">
        <tr>
            <th>STT</th>
            <th>Images</th>
            <th>Category name</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        <c:forEach items="${listcate}" var="cate" varStatus="STT">
            <tr>
                <td>${STT.index+1}</td>
                <td>
                    <c:choose>
                        <c:when test="${cate.images != null && fn:startsWith(cate.images, 'https')}">
                            <c:url value="${cate.images}" var="imgUrl"></c:url>
                        </c:when>
                        <c:otherwise>
                            <c:url value="/image?fname=${cate.images}" var="imgUrl"></c:url>
                        </c:otherwise>
                    </c:choose>
                    <img height="150" width="200" src="${imgUrl}" />
                </td>
                <td>${cate.categoryname}</td>
                <td>
                    <c:if test="${cate.status==1}">Hoạt động</c:if>
                    <c:if test="${cate.status!=1}">Khóa</c:if>
                </td>
                <td>
                    <a href="<c:url value='/admin/category/edit?id=${cate.categoryId}'/>">Sửa</a> |
                    <a href="<c:url value='/admin/category/delete?id=${cate.categoryId}'/>">Xóa</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
