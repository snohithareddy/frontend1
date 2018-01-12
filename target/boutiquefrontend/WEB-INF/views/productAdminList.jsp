<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>

<head>

<title>BOUTIQUE</title>

<meta name="viewport" content="width=device-width,initial-scale=1">

<meta charset="utf-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

</head>

<body>

<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

<div class="container">

<h2>Product List For Admin</h2>

<table class="table table-hover" id="apl" class="display" border="2" width="80" align="center">

<tr>

<th>Sl No</th>

<th>PID</th>

<th>Product Name</th>

<th>Product Supplier</th>

<th>Product Category</th>

<th>Description</th>

<th>Stock</th>

<th>Price</th>

<th>Image</th>



<th class="span2">ACTION</th>

</tr>

<c:if test="${empty prodList}">

<tr>

<td colspan="10" align="center">No record exists!!</td>

</tr>

</c:if>

<c:forEach var="p" varStatus="st" items="${prodList}">

<tr>

<td><c:out value="${st.count}"></c:out></td>

<td><c:out value="${p.pid}"></c:out></td>

<td><c:out value="${p.pname}"></c:out></td>

<td><c:out value="${p.supplier.sname}"></c:out></td>

<td><c:out value="${p.category.cname}"></c:out></td>

<td class="span3"><c:out value="${p.pdescription}"></c:out></td>

<td><c:out value="${p.price}"></c:out></td>

<td><c:out value="${p.pstock}"></c:out></td>

<td><img src="${pageContext.request.contextPath}/resources/${p.imagName}" height="50px" width="50px"></td>



<td><c:set var="contexRoot" value="${pageContext.request.contextPath}"></c:set>

<a class="btn btn-info" role="button" href="${contextRoot}/updateProd?pid=<c:out value="${p.pid}"></c:out>"/>Edit</a>

<a class="btn btn-danger" role="button" href="<c:url value="/deleteProd/${p.pid}"/>">Delete</a>



<tr>

</c:forEach>

</table>







</body>

</html>