<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="utf-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Index Page</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">

	.bs-example{

    	margin: 20px;

    }

</style>





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

               

                <a class="navbar-brand" href="#"></a>

            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

                <ul class="nav navbar-nav">

                   

                    

                        </ul>

                    

                

                 </div>

    </nav>

</div>



</body>



<c:url var="actionUrl" value="saveUser" />





<form  commandName="user" method="post" action="${actionUrl }" class="form-horizontal" >

	<div class="form-group">

		<label for="FirstName" class="col-xs-4 control-label">FirstName</label>

		<div class="col-xs-4">

			<input name="username" path="firstname" placeholder="Enter First Name" class="form-control" />

		<td><errors path="username" cssClass="error"/></td>

		</div>

	</div> 

	

	

	 <div class="form-group">

		<label for="LastName" class="col-xs-4 control-label">LastName</label>

		<div class="col-xs-4">

			<input name="username" path="lastname" placeholder="Enter Last Name" class="form-control" />

		</div>

	</div> 

	

	

	<div class="form-group">

		<label for="Email" class="col-xs-4 control-label">Email</label>

		<div class="col-xs-4">

			<input name="email" path="email" placeholder="Enter Email" class="form-control" />

		<td><errors path="email" cssClass="error"/></td>  

		</div>

	</div>



	<div class="form-group">

		<label for="Password" class="col-xs-4 control-label">Password</label>

		<div class="col-xs-4">

			<input name="password"  path="password" placeholder="Enter Password" class="form-control" />

			<td><errors path="password" cssClass="error"/></td>  

		</div>

	</div>



	<div class="form-group">

		<label for="Phone Number" class="col-xs-4 control-label">Phone Number</label>

		<div class="col-xs-4">

			<input name="contact"  path="contact" placeholder="contact" class="form-control" />

			<td><errors path="contact" cssClass="error"/></td>  

		</div>

	</div>



	<div class="form-group">

	<label for="code" class="col-xs-4 control-label"></label>

		

		<div class="col-xs-4">

			

		<input type="submit" value="Register" id="btn-add" class="btn btn-primary" >

	

	</div>

	</div>







<br/>

<br/>

<br/>

<br/>

<br/>

<br/>

<br/>

<br/>

<br/>

<br/>

<br/>

</body>



</html>