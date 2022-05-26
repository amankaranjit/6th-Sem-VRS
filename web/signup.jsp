
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="../assets/style/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="../assets/img/logo.PNG" type="image/icon type">
        <title>Sign Up Page</title>
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
                margin-left: 250px;
            }
            .hidden{
                display: none;
            }


        </style>
        <jsp:include page="navbar.jsp" />  
        <div class="container">
            <div class="d-flex justify-content-center">
                <div class="col-md-5 mt-4 mb-3 p-3 shadow-lg">
                    <form action="../SignupServlet" method="post">
                        <div class="col-12 mb-3">
                            <label for="name">Full Name</label>
                            <input type="text" name="name" id="fullName" placeholder="Full Name" class="form-control fname" required 
                                   onkeyup ="fullNameValidate()">
                            <span id="fullNameMsg"></span>
                        </div>                        
                        <div class="col-12 mb-3">
                            <label for="email">Email</label>
                            <input type="email" name="email" id="email" placeholder="example@gmail.com" class="form-control"required
                                   onkeyup="emailValidate()">
                            <span id="emailMsg"></span>
                        </div>
                        <div class="col-12 mb-3">
                            <label for="contact">Contact No.</label>
                            <input type="text" name="contact" id="phone" onkeypress="return isNumberKey(event)"   placeholder="9812345678" maxlength="10" minlength="10" class="form-control"required
                                   onkeyup="phoneValidate()">
                            <span id="phoneMsg"></span>
                        </div>
                        <div class="col-12 mb-3">
                            <label for="address">Address</label>
                            <input type="text" name="address"  placeholder="Kathmandu" id="address" class="form-control"required
                                   onkeyup="addressValidate()">
                            <span id="addressMsg"></span>
                        </div>
                        <div class="col-12 mb-3">
                            <label for="password">Password</label>
                            <input type="password" name="password" placeholder="*********" maxlength="10" id="pass" class="form-control"required
                                   onkeyup="passValidate()">
                            <span id="passMsg"></span>
                        </div>
                        <div class="col-12 mb-3">
                            <label for="cpassword">Confirm Password</label>
                            <input type="password" name="cpassword"  placeholder="*********" maxlength="10" id="pass2" class="form-control"required
                                   onkeyup="pass2Validate()">
                            <span id="pass2Msg"></span>
                        </div>
                        <div class="col-12">
                            <input type="submit" id="btn" class="btn text-light  form-control" style="background-color: rgb(21, 172, 231);" value="Sign Up"
                                   >
                        </div>
                    </form>
                    <script>
                        function isNumberKey(evt)
                        {
                            var charCode = (evt.which) ? evt.which : event.keyCode
                            if (charCode > 31 && (charCode < 48 || charCode > 57))
                                return false;

                            return true;
                        }


                    </script>
                    <script>
//                        document.getElementById("btn").disabled = true;
                    </script>

                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp" />  
        <script src="formValidation.js" type="text/javascript"></script>
    </body>
</html>
