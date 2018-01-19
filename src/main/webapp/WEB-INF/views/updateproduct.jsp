<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Insert title here</title>

</head>

<body>





<c:url value="/productUpdate" var="pru"></c:url>

<form  method="post" action="productUpdate" enctype="multipart/form-data">

<span id="reauth-email" class="reauth-email"></span>



<input type="hidden" name="pid" value="${prod.pid}">



<h4 class="input-title">Product Name</h4><br>

<input value="${prod.pname}" type="text" name="pname" required/><br>



<h4 class="input-title">Product Description</h4><br>

<input value="${prod.pdescription}" type="text" name="pdescription" required/>



<h4 class="input-title">Product Price</h4><br>

<input value="${prod.price}" type="text" name="price" required/>



<h4 class="input-title">Product Stock</h4><br>

<input value="${prod.pstock}" type="number" name="pstock" required/>



<div class="form-group">

<table>

<tr>

<td>Select Supplier</td>

<tb>

<select class="from-control" name="pSupplier" required>

<option value="">------Select Supplier---</option>

<c:forEach items="${satList}" var="sat">

<option value="${sat.sid}">${sat.supplierName}</option>

</c:forEach>

</select>

</tb>

</tr>

</table>

</div><div class="fileinputfileinput-new" dataprovieds="fileinput">

<td>Product Image</td>

<td><input classs="form-control" type="file" name="file" acept="image/*"></td>

</div>

<br><br>

<button class="btn btn-lg btn-primary" type="submit">Save</button>

<button class="btn btn-lg btn-primary" type="reset">Cancel</button>

</form>



</body>

</html>