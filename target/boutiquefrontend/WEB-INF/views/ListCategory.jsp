<%-- <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%> --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

	pageEncoding="ISO-8859-1" isELIgnored="false"%>



<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>

<body><script type="text/javascript">

$(document).ready(function(){

    $("#mycategory").click(function(){

        $("#myproduct").hide();

    });

});

 </script>



</head>

<body style="padding-top: 60px">

		<div class="container">

		<c:forEach items="${ListProduct}" var="product">

		

		<div class="col-md-4">

		<!-- 

			<div class="col-xs-3 w3-animate-zoom">

		 -->		<div class="thumbnail">

					<img class="img-responsive" style="padding-top: 5px" src="<c:url value="/resources/images/${product.pid}.jpg" ></c:url>">

				 <div class="caption">

                  <h4 class="pull-right">${product.price}</h4>

                  <h4><a href=  "#">${product.name}</a></h4>

                  <p>${product.description}.</p>

                								<form action="addToCart/${product.pid}">

										<input type="submit" value="Add to Cart" class="btn btn-primary" >



									</form>

						

					</div>

				</div>

			</div>

		</c:forEach>

	</div>

		<c:choose>

		<c:when test="${UserClickedCart}">

			<c:import url="/WEB-INF/views/Cart.jsp"></c:import>

		</c:when>

	</c:choose>

	









</body>

</html>