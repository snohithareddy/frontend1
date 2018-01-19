<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1" isELIgnored="false"%>

 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>   

  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>Shipping Address</title>



</head>



<body>

<div class="bs-example">

    <nav id="myNavbar" class="navbar navbar-inverse" role="navigation">

        <!-- Brand and toggle get grouped for better mobile display -->

        <div class="container">

            <div class="navbar-header">

              <!--   <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> -->

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

                    <li><a href="continue_shopping">HOME</a></li>

                    <li class="">

                        <a href="#" data-toggle="" class="dropdown-toggle"> <b class="caret"></b></a>

                        <ul class="dropdown-menu">

                            <li><a href="category"></a></li>

                            <li><a href="#"></a></li>

                            <li><a href="#"></a></li>

                            <li class="divider"></li>

                            <li><a href="#"></a></li>

                        </ul>

                    </li>

                </ul>

                 </div>

    </nav>

</div>





<div id="wrap">

<div class="container clear-top">

<c:if test="${not empty addressList}">

	<form  action="selectShippingAddress" method="post">

			<h3>Select a delivery Address:</h3>

			<hr>

			<div class="row">

			<c:forEach var="address" items="${addressList}" varStatus="loopCounter">

			<div class="col-md-4 col-xs-4">

						<c:choose>	

						<c:when test="${loopCounter.index==0}">

								<div class="radio">

								<input type="radio" name="shipaddress" value="${address.id}" checked> <p> ${address.name}<br/>

					      		${address.address1}

					      		<br/>${address.address2}

					      		<br/>${address.landmark}

					      		 <p>${address.city} &nbsp; ${address.state}

					      		 <br/> Pincode : ${address.pincode}	

					      		 <br/> Mobile: <c:choose>

					      		<c:when test="${address.phone eq 0}">${sessionScope.user.phone}</c:when>

					      		<c:when test="${not empty address.phone}">${address.phone}</c:when>

					      		</c:choose>

					      		 </p>

					      		 </div>	

					      </c:when>

					      <c:otherwise>

					      	<div class="radio">

								<input type="radio" name="shipaddress" value="${address.id}"> <p> ${address.name}<br/>

					      		${address.address1}

					      		<br/>${address.address2}

					      		<br/>${address.landmark}

					      		 <p>${address.city} &nbsp; ${address.state}

					      		 <br/> Pincode : ${address.pincode}	

					      		 <br/> Mobile: <c:choose>

					      		<c:when test="${address.phone eq 0}">${sessionScope.user.phone}</c:when>

					      		<c:when test="${not empty address.phone}">${address.phone}</c:when>

					      		</c:choose>

					      		 </p>

					      		 </div>	

					      </c:otherwise>

			    		</c:choose>

      		 </div>	

      		 </c:forEach>

			</div>

			<br><br>

			<div class="text-center"> 

			 <button type="submit" class="btn btn-warning">Deliver to Selected Address</button>

			 </div>

	</form>

	</c:if>

</div>

<div class="container">

<h3>Add a new Address :</h3>

<div class="row jumbotron">

	<form:form commandName="address" action="saveShippingAddress" method="post">

		<div class="form-group row">

		<div class= "col-xs-6">

		<label for="name"> Full Name: </label>

		<form:input class="form-control" name="name" path ="name" required="required"/>

		</div>

		</div>

		

		 <div class="form-group row">

			<div class="col-xs-6">

		    <label for="address1"> Flat / House No. / Floor / Building:  </label>

		    <form:input  class="form-control" name="address1"  path = "address1" required="required"/>

		    </div>

		 </div>

		 

		 <div class="form-group row">

			<div class="col-xs-6">

		    <label for="address2"> Colony / Street / Locality:   </label>

		    <form:input  class="form-control" name="address2"  path = "address2" required="required"/>

		    </div>

		 </div>

		 

		 <div class="form-group row">

			<div class="col-xs-6">

		    <label for="landmark"> Landmark: 

									(optional)   </label>

		    <form:input  class="form-control" name="landmark"  path = "landmark" />

		    </div>

		 </div>

		 

		  <div class="form-group row">

			<div class="col-xs-6">

		    <label for="city"> Town / City: </label>

		    <form:input  class="form-control" name="city"  path = "city" required="required"/>

		    </div>

		 </div>

		 

		 

		  <div class="form-group row">

			<div class="col-xs-6">

		    <label for="state"> State:   </label>

		    <form:input  class="form-control" name="state"  path = "state" required="required"/>

		    </div>

		 </div>

		 

		  <div class="form-group row">

			<div class="col-xs-6">

		    <label for="pincode"> Pincode:   </label>

		    <form:input  class="form-control" name="pincode"  path = "pincode" placeholder="Enter pincode" required="required"/>

		    </div>

		 </div>

		 

		 <div class="form-group row">

			<div class="col-xs-6">

		    <label for="phone"> Alternate Mobile: 

									(optional)   </label>

		    <form:input  class="form-control" name="phone"  path = "phone" placeholder="Enter Mobile No"/>

		    </div>

		 </div>

		 

		 <div class="form-group row">

			<div class="col-xs-6">

		    <label for="email"> Alternate Email: 

									(optional)   </label>

		    <form:input type="email" class="form-control" name="email"  path = "email" />

		    </div>

		 </div>

		 

		 <div class="form-group row">

			<div class="col-xs-6">

		    <label for="addressType"> Address Type:   </label>

		   				<form:select path="addressType" class="form-control" required="true">

						 <form:option class="form-control"  value="0">---Select---</form:option>	

						 <form:option class="form-control"  value="HOME">Home (All day Delivery)</form:option>			 	 

						 <form:option class="form-control"  value="OFFICE">Office (Delivery between 10 AM and 5 PM )</form:option>

						</form:select>

		    </div>

		 </div>

		 <br>

		 <div class="form-group row">

			<div class="col-xs-6">

		    <div class="clearfix">

		      <button type="submit" class="btn btn-success">Save And Deliver Here</button>

		      <button type="reset"  class="btn btn-danger">Cancel</button>		     

		    </div>

		    </div>

		 </div>

		 

	</form:form>

	</div>

</div>

</div>

</body>

</html>