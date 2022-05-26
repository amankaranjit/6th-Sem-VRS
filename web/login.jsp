

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="assets/stylesheet/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="icon" href="assets/img/logo.png" type="image/icon type">
        <style>
            button{
                background-color: rgb(21, 172, 231);
            }
        </style>
    </head>
    <body>
        <style>
            .navbar{
                background-color: rgb(21, 172, 231);
                height: 70px;

            }
            .navbar a{
                color: white;
            }
            .navbar .mid{
                margin-left: 330px;
            }
            .imageClass{
                 background-color: rgb(21, 172, 231);
            }

        </style>
        <jsp:include page="navbar.jsp" />  
        <div class="container mt-2 mb-2">
            <div class="d-flex justify-content-center">
                <div class="col-md-5 mt-4 mb-3 p-3 shadow-lg">

                    <form action="LoginServlet" method="post" class="form-signin">
                        <center>
                            <div class="imageClass" style="width:170px; height:120px; "> 
                                <img class="mb-4" src="assets/img/logo.png" alt="" width="100%" height="100%">
                            </div>
                        </center>
                        <h5 class="px-3">Login Form</h5>
                        <div class="col-12 mb-3">
                            <label for="email">Email</label>
                            <input type="email" name="email" id="email" placeholder="example@gmail.com" class="form-control" required>
                        </div>
                        <div class="col-12 mb-3">
                            <label for="password">Password</label>
                            <input type="password" name="password" id="password" placeholder="*********" class="form-control" required>
                        </div>

                        <div class="col-12 mb-3 button">
                            <button class="btn btn-primary form-control">Login</button>
                        </div>
                        <div class="col-4 offset-md-8">

                        </div>

                    </form>
                    <p ><a class=" p-3 text-dark" href="adminLogin.jsp" style="font-size: 18px;" > Login As  Admin</a><p>
                </div>

            </div>
        </div>
        <jsp:include page="footer.jsp" />  
    </body>
</html>
