<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1" isELIgnored="false"%>

 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>Acknowledgement</title>

</head>



<body style = "background : url(http://s1.picswalls.com/wallpapers/2016/06/06/eiffel-tower-desktop-background_094749463_307.jpg); background-size:100% ;">

<div class="bs-example">

    <nav id="myNavbar" class="navbar navbar-inverse" role="navigation">

        <!-- Brand and toggle get grouped for better mobile display -->

        <div class="container">

            <div class="navbar-header">

                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">

                    <span class="sr-only">Toggle navigation</span>

                    <span class="icon-bar"></span>

                    <span class="icon-bar"></span>

                    <span class="icon-bar"></span>

                </button>

                <a class="navbar-brand" href="#"></a>

            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

                <ul class="nav navbar-nav">

<li class="active"><a href="http://localhost:9999/FrontEcom/"><span

							class="glyphicon glyphicon-home" aria-hidden="true"></span> HOME</a></li>

                                        

                </ul>

               

            </div>

        </div>

    </nav>

</div>

<div id="wrap">

<div id="main" class="container clear-top">



<h4><font color="red">Your order has been placed successfully. Thank you for shopping with us.</font> </h4>



<div class="row">

	 <div class="col-sm-12 col-md-10 col-md-offset-1">

	

	<table class="table table-hover table-condensed">

	

	`<c:if test="${not empty error}">

	    	<h4> <font color="red">${error} </font></h4>

	</c:if>

	

		<thead>

			<tr>

			<th>Product</th>

			<th>Expected Delivery</th>

			<th>Quantity</th>

			<th class="text-center">Price</th>

			<th class="text-center">Total</th>

			

			</tr>	

		</thead>

		<tbody>

			<c:forEach items="${orderList}" var ="order">

			<tr>

			 <td class="col-sm-8 col-md-6">

			<div class="media">

			 <a class="thumbnail pull-left" href="">

					<img class="img-responsive"  width="72px" height="72px" src="${pageContext.request.contextPath}/resources/${order.imagName}"></a>

			<div class="media-body">

			<c:forEach items="${productList}" var="product">	

				<c:if test="${product.pid == order.productId}">

			<h4 class="media-heading"><a href="">${product.pname}</a></h4>

                                <h5 class="media-heading"></h5>

                                <span>Status: </span><span class="text-success"><strong>In Stock</strong></span>

                            </div>

                        </div></td>

                 </c:if>

              </c:forEach>

             <td class="col-sm-1 col-md-1">

             With in 7 working days

 			 </td>

			 <td class="col-sm-1 col-md-1" style="text-align: center">

			

			${order.productQuantity}

			

			</td>

			 <td class="col-sm-1 col-md-1 text-center"><strong><span class="fa fa-inr"></span> ${order.price}</strong></td>

			<c:set var="subtot" value="${order.price * order.productQuantity}"></c:set>

			 <td class="col-sm-1 col-md-1 text-center"><strong><span class="fa fa-inr"></span> ${subtot}</strong></td>

			

				

		</tr>

		

		<c:set var="gtot" value="${gtot + order.price * order.productQuantity}"></c:set>

		</c:forEach>

		<tr>

			<td>  </td>

			<td>  </td>

			<td>  </td>

			<td><h5>SubTotal</h5></td>

			<td class="text-right"><h5><strong><span class="fa fa-inr"></span> ${gtot}</strong></h5></td>

		</tr>

		<tr>

             <td>   </td>

             <td>   </td>

             <td>   </td>

             <td><h5>Estimated shipping</h5></td>

             <td class="text-right"><h5><strong><span class="fa fa-inr"></span> 50.0</strong></h5></td>

         </tr>

         <c:set var="grosstotal" value="${gtot+50}"></c:set>

          <tr>

              <td>   </td>

              <td>   </td>

              <td><h3>Total</h3></td>

              <td colspan="2" class="text-right"><h3><strong><span class="fa fa-inr"></span>${grosstotal}</strong></h3></td>

          </tr>

		

		</tbody>

		

	</table>

	

		</div>

	</div>





</div>

</div>

</body>

</html>