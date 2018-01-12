<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>



<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Login Page</title>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  

    <link rel="stylesheet" href="<c:url value="resources/assets/css/Pretty-Registration-Form.css"/>">

    <link rel="stylesheet" href="<c:url value="resources/assets/css/Google-Style-Login.css"/>">

</head>

  

</head>



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

                    <li><a href="http://localhost:8081/BOUTIQUE/">HOME</a></li>

                    <li><a href="goToregister"><span class="glyphicon glyphicon-user"></span> register</a></li>

                  

                </ul>

                 </div>

    </nav>

</div>



</body>

<c:if test="${not empty msg}">

           <div class="msg">${msg}</div>

       </c:if>

<form  name="Loginform" action="<c:url value="/j_spring_security_check"/>"  method="post" class="form-horizontal" >



<h1 align="center">LOGIN</h1>

	<div class="form-group">

		<label for="username" class="col-xs-4 control-label">Email</label>

		<div class="col-xs-4">

			<input name="username" type="email" id="username" placeholder=" User Email" class="form-control" />

		</div>

	</div>



	<div class="form-group">

		<label for="password" class="col-xs-4 control-label">Password</label>

		<div class="col-xs-4">

			<input name="password"  type="password" placeholder="User Password" id="password" class="form-control" />

		</div>

	</div>

            

            <div class="form-group">

	<label for="code" class="col-xs-4 control-label"></label>

		

		<div class="col-xs-4">	

		<input type="submit" value="Login" id="btn-add" class="btn btn-primary" >

		</div>

	</div> 

            

       <input type = "hidden" name= "${_csrf.parameterName}" value="${_csrf.token}"/>

       </form>

        

        



	



 

</body>



</html>