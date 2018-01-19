<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>



<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<head>

  <title>BeautiProduct</title>

  <meta charset="utf-8">

  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body>

<nav class="navbar navbar-inverse">

  <div class="container-fluid">

    <div class="navbar-header">

      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">

        <span class="icon-bar"></span>

        <span class="icon-bar"></span>

        <span class="icon-bar"></span>                        

      </button>

      <a class="navbar-brand" href="#">BeautiProduct</a>

    </div>

    <div class="collapse navbar-collapse" id="myNavbar">

      <ul class="nav navbar-nav">

        <li><a href="index">Home</a></li>

       <li><a href="contact"><i class="fa fa-adress-book" aria-hidden="true"></i></a>

            

  <ul class="nav navbar-nav navbar-right">

     

     <c:if test="${pageContext.request.userPrincipal.name==null}">

        <li><a href="${pageContext.request.contextPath}/goToregister"><span class="glyphicon glyphicon-user"></span> SignUp</a></li>

        <li><a href="${pageContext.request.contextPath}/goToLogin"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>

        </c:if>

        

        

        

        

        <c:if test="${pageContext.request.userPrincipal.name !=null}">



                <li><a>Welcome: ${pageContext.request.userPrincipal.name}</a></li>

              <li><a href="<c:url value="/j_spring_security_logout"/>">Logout</a></li>

       </c:if>

                 

        <c:if test="${pageContext.request.userPrincipal.name == 'snohithareddy@gmail.com'}"> 

        

      <li><a href="${pageContext.request.contextPath}/admin/adding">Admin</a></li>

         

      

 <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="${pageContext.request.contextPath}/admin">Admin List<span class="caret"></span></a>

        <ul class="dropdown-menu">

        

       

       <li><a href="${pageContext.request.contextPath}/admin/productList">Product</a></li>

         

         

           

     

        <li><a href="${pageContext.request.contextPath}/admin/supplierList">Supplier</a></li>

      

    

        

        <li><a href="${pageContext.request.contextPath}/admin/categoryList">Category</a></li>

       

        

        

        </ul>

        </li>

      

        </c:if>  

           

    

   

             </ul>

						

						<li><a href="viewcart"> <span

								class="glyphicon glyphicon-shopping-cart">

									${CartPrice}${cartsize}</span>

						</a></li>

						<li><a href="showinvoice"> Invoice</a></li>

					

        <i class="fa fa-cart-plus" aria-hidden="true"></i></a></li>

      </ul>

      <c:choose>

		<c:when test="${IfViewCartClicked}">

			<c:import url="/WEB-INF/views/cart.jsp"></c:import>

		</c:when>

	</c:choose>

      	

    <ul class="nav navbar-nav navbar-right">



						<li class="dropdown"><a href="index.html"

						class="dropdown-toggle" data-toggle="dropdown" role="button"

						aria-haspopup="true" aria-expanded="false"> <span

							class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>

							Category <span class="caret"></span></a>

						<ul class="dropdown-menu">

							<c:forEach items="${catList}" var="category">



								<li><a class="alink" href=" nav/<c:out value="${category.cid}" />"> <c:out value="${category.cname}" />

								</a></li>



							</c:forEach>

						</ul></li>

     

      </ul>

      

    </div>

  </div>

</nav>

  



</head>

<body>



</body>

</html>