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

<h2>Supplier List For Admin</h2>

<table class="table table-hover" id="apl" class="display" border="2" width="80" align="center">

<tr>

<th>Sl No</th>

<th>Supplier ID</th>

<th>Supplier Name</th>





<th class="span2">Action</th>

</tr>

<c:if test="${empty satList}">

<tr>

<td colspan="10" align="center">No record exists!!</td>

</tr>

</c:if>

<c:forEach var="p" varStatus="st" items="${satList}">

<tr>

<td><c:out value="${st.count}"></c:out></td>

<td><c:out value="${p.sid }"></c:out></td>

<td><c:out value="${p.sname}"></c:out></td>







<td><c:set var="contextRoot" value="${pageContext.request.contextPath}"></c:set>

<a class="btn btn-info" role="button" href="${contextRoot}/Edit">Edit</a>

<a class="btn btn-danger" role="button" href="${contextRoot}/Delete">Delete</a>





<tr>

</c:forEach>

</table>







</body>

</html>