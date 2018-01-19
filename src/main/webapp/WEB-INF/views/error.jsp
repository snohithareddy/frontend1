 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html lang="en">

<head>

<meta name="viewport" content="width=device-width,initial-scale=1">

<meta charset="utf-8">



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>



<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">



</head>

<body>



<jsp:include page="header.jsp"></jsp:include>

<div class="container">

<h1>Authentication Error!!</h1>

<h3>Go Back To Home or<a href="${pageContext.request.contextPath}/reLogin">Login</a>page</h3>

</div>

</body>

</html> 