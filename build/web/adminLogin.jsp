

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
                background-color:black;
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


        </style>
        <%--<jsp:include page="navbar.jsp" />--%>  
        <div class="container" style="margin-top: 50px; margin-left: 10;">
            <div class="d-flex justify-content-center text-light">
                <div class="col-md-5 mt-4 mb-3 p-3 shadow-lg bg-secondary">
                    
                    <form action="AdminLoginServlet" method="post" class="form-signin">
                        <center>
                            <img class="mb-4" src="assets/img/logo.png" alt="" width="30%" height="10%">
                        </center>
                        <h5 class=""> Admin Login Form</h5>
                        <div class="col-12 mb-3">
                            <label for="email">Email</label>
                            <input type="email" name="email" id="email" placeholder="example@gmail.com" class="form-control" required>
                        </div>
                        <div class="col-12 mb-3">
                            <label for="password">Password</label>
                            <input type="password" name="password" id="password" placeholder="*********" class="form-control" required>
                        </div>

                        <div class="col-12 mb-3 button">
                            <button class="btn btn-dark form-control">Login</button>
                        </div>
                        <div class="col-4 offset-md-8">
                            <!--<a href="#" class="text-decoration-none text-secondary">Forget Password?</a>-->
                        </div>

                    </form>
                </div>
            </div>
        </div>
        <%--<jsp:include page="footer.jsp" />--%>  
    </body>
</html>
