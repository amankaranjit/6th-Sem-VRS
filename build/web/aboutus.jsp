<%-- 
    Document   : aboutus
    Created on : Mar 5, 2022, 9:57:50 AM
    Author     : Aman Karanjit
--%>
<%@page import="java.sql.Blob"%>
<%@page import="java.util.Base64"%>
<%@page import="java.sql.Statement"%>
<%@page import="JDBCConnection.JDBCConnection"%>
<!doctype html>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="assets/stylesheet/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About Us</title>
        <link href="assets/stylesheet/main.css" rel="stylesheet" type="text/css"/>
        <link rel="icon" href="assets/img/logo.png" type="image/icon type">
        <!--Bootstrap Css-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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


        </style>
        <jsp:include page="navbar.jsp" />  

        <main role="main">

            <section class="jumbotron text-center pt-3">
                <div class="container">
                    <h1 class="jumbotron-heading " >ABOUT US</h1>

                    <img class="rounded-circle" alt="100x100" src="assets/img/logo.png" height="220px;"
                         data-holder-rendered="true">

                    <p class="lead text-secondary m-5">Something short and leading about the collection below—its contents, the creator, etc. Make it short and sweet, but not too short so folks don't simply skip over it entirely.</p>

                </div>

            </section>
            <main role="main">
                <div class="album py-5 ">
                    <div class="container">
                        <h2 class="text-center p-3 text-secondary">Vehicle Company We Have</h2>

                        <div class="row text-center">   
                            <%
                                String sql = "SELECT * FROM sedan join category where sedan.c_id = category.id GROUP BY s_company ";
                                Connection cn = JDBCConnection.getConnection();
                                Statement stmt = cn.createStatement();
                                ResultSet rs = stmt.executeQuery(sql);
                                while (rs.next()) {
                                    Blob image = rs.getBlob("sedan.s_logo");
                                    byte imgData[] = image.getBytes(1, (int) image.length());
                                    String encodedImage = Base64.getEncoder().encodeToString(imgData);
                                    String Simage = "data:image/jpg;base64," + encodedImage;

                            %>
                            <div class="col-md-4 ">
                                <div class="card mb-4  text-secondary  ">
                                    <!--<img src="" alt=""/>-->
                                    <img class="card-img-top"  src="<%= Simage%>" height="200px;" width="200px;" alt="Card image cap">
                                    <div class="card-body px-3 py-3">


                                        <%                                           
                                            String s_company = rs.getString("s_company");

                                        %>
                                        <%= s_company%><br>                                                                 

                                    </div>
                                </div>

                            </div>
                            <%
                                }
                            %>
                        </div>

                    </div>
                </div>

            </main>
        </main>

        <jsp:include page="footer.jsp" />  
    </body>
</html>
