<%-- 
    Document   : slider
    Created on : Mar 5, 2022, 10:51:35 AM
    Author     : Aman Karanjit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="assets/stylesheet/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <style>
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
        </style>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>
    <body>
    <head>
        <meta charset="UTF-8">
        <title>Example of Twitter Bootstrap 3 Carousel</title>
        <link href='https://fonts.googleapis.com/css?family=PT+Sans+Narrow' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css">
        <script type="text/javascript" src="https://code.jquery.com/jquery.min.js"></script>
        <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    </head>

</head>
<body>
<!--    <div class="carousel slide" id="myCarousel" data-ride="carousel">
        <ol  class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
            <li data-target="#myCarousel" data-slide-to="3"></li>
            <li data-target="#myCarousel" data-slide-to="4"></li>
            <li data-target="#myCarousel" data-slide-to="5"></li>
        </ol>
        <div class="carousel-inner">

            <div class="item active">
                <img src="assets/img/new.jpg" alt=""/>
                <div class="centered">Bottom Left</div>
            </div>

            <div class="item">
                <img src="assets/img/new.jpg" alt=""/>
                <div class="centered">Bottom Left</div>

            </div>

            <div class="item">
                <img src="assets/img/new.jpg" alt=""/>
                <div class="centered">Bottom Left</div>

            </div>
            <div class="item">
                <img src="assets/img/new.jpg" alt=""/>
                <div class="centered">Bottom Left</div>

            </div>
            <div class="item">
                <img src="assets/img/new.jpg" alt=""/>
                <div class="centered">Bottom Left</div>

            </div>
            <div class="item">
                <img src="assets/img/new.jpg" alt=""/>
                <div class="centered">Bottom Left</div>

            </div>
            <div class="item">
                <img src="assets/img/new.jpg" alt=""/>
                <div class="centered">Bottom Left</div>

            </div>
        </div>
         Carousel nav 
        <a class="carousel-control left" href="#myCarousel" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
        </a>
        <a class="carousel-control right" href="#myCarousel" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
        </a>
    </div>

    <script>
        $(document).ready(function () {
            $(".carousel").carousel({

            });

        });



    </script>-->

<div class="container-fluid mb-4">
    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
          <div class="carousel-item active">
              <img src="https://media.istockphoto.com/photos/fast-transport-picture-id517742348?k=20&m=517742348&s=612x612&w=0&h=an6maoO_hwXW5fn0OKBraY5dQjTGNip94Lx62GATId8=" class="d-block w-100" height="500px" alt="...">
          </div>
          <div class="carousel-item">
              <img src="https://thumbs.dreamstime.com/b/car-drives-fast-highway-highlands-black-148886931.jpg" class="d-block w-100" height="500px" alt="...">
          </div>
          <div class="carousel-item">
              <img src="https://cdn-cf.cms.flixbus.com/drupal-assets/2021-10/mobile-flix-hero-q4-2021.jpg" class="d-block w-100" height="500px" alt="...">
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>

</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>

