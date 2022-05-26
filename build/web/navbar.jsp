<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="assets/stylesheet/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <style>
            .navbar{
                background-color: rgb(21, 172, 231);
                height: 70px;
            }
            .aa{
                margin-left: 250px;
            }
            .imagee{
                width: 150px;
                height: 150px;
            }
            a{
                font-size: 20px;
                color: white;
            }
            .mid{
                padding-left: 400px;
            }
        </style>
    </head>
    <body>
        <%
            Object name = session.getAttribute("s_name");
            if (name == null) {
        %>
        <nav class="navbar navbar-expand-lg navbar-light ">
            <img class="imagee" src="assets/img/logo.png" alt=""/>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">

                <form class="form-inline ">
                    <a class="nav-link mid" style="padding-left: 100px" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                    <a class="nav-link" href="aboutus.jsp">About Us <span class="sr-only">(current)</span></a>
                    <a class="nav-link" href="vehicles.jsp">Vehicles <span class="sr-only">(current)</span></a>
                    <a class="nav-link aa" href="login.jsp">Login <span class="sr-only">(current)</span></a>
                    <a class="nav-link" href="signup.jsp">Sign Up <span class="sr-only">(current)</span></a>
                </form>
            </div>
        </nav><%} else {%>
        <nav class="navbar navbar-expand-lg navbar-light ">
            <img class="imagee" src="assets/img/logo.png" alt=""/>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">

                <form class="form-inline my-2 my-lg-0">
                    <a class="nav-link mid" style="padding-left: 100px" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                    <a class="nav-link" href="aboutus.jsp">About Us <span class="sr-only">(current)</span></a>
                    <a class="nav-link" href="vehicles.jsp">Vehicles <span class="sr-only">(current)</span></a>
                    <a class="nav-link aaa" href="Profile.jsp" style="padding-left: 290px;"><%= name%></a>
<!--                    <a class="nav-link aa" > <span class="sr-only">(current)</span></a>-->
                    <a class="nav-link" href="Logout.jsp">Logout <span class="sr-only">(current)</span></a>
                </form>
            </div>
        </nav><%}%>
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>