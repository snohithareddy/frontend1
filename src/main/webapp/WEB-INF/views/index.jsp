<!DOCTYPE html>

<html lang="en">

<head>

  <title>boutique1</title>

  <meta charset="utf-8">

  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>

  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>

  <style>

  /* Make the image fully responsive */

  .carousel-inner img {

      width: 100%;

      height: 100%;

  }

  </style>

</head>

<jsp:include page="header.jsp"></jsp:include>

<body>



<div id="demo" class="carousel slide" data-ride="carousel">



  <!-- Indicators -->

  <ul class="carousel-indicators">

    <li data-target="#demo" data-slide-to="0" class="active"></li>

    <li data-target="#demo" data-slide-to="1"></li>

    <li data-target="#demo" data-slide-to="2"></li>

  </ul>

  

  <!-- The slideshow -->

  <div class="carousel-inner">

    <div class="carousel-item active">

      <img src="E:\downloads\images\boutique1.jpg" alt="1" width="1100" height="500">

    </div>

    <div class="carousel-item">

      <img src="E:\downloads\images\boutique2.jpg" alt="2" width="1100" height="500">

    </div>

    <div class="carousel-item">

      <img src="E:\downloads\images\boutique4.jpg" alt="3" width="1100" height="500">

    </div>

  </div>

  

  <!-- Left and right controls -->

  <a class="carousel-control-prev" href="#demo" data-slide="prev">

    <span class="carousel-control-prev-icon"></span>

  </a>

  <a class="carousel-control-next" href="#demo" data-slide="next">

    <span class="carousel-control-next-icon"></span>

  </a>

</div>



</body>

</html>