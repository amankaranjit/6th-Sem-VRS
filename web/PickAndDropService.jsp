<%@page import="java.util.Base64"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.Statement"%>
<%@page import="JDBCConnection.JDBCConnection"%>
<!doctype html>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<html lang="en">
    <head>
        <link href="assets/stylesheet/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--<img src="image/logo.jpg" alt=""/>-->
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <style>

        </style>
    </head>  
    <body>
        <main role="main">
            <div class="album py-5 ">
                <div class="container">
                    <h2 class="text-center p-3 text-secondary">Want vehicle for certain time period only?</h2>
                    <h5  class="text-center p-3 text-secondary">Here you can book vehicle for certain hours only.</h5>

                    <div class="row">   
                        <%
                            String dbs_type = "sedan";
                            Connection cn = JDBCConnection.getConnection();
                            Statement stmtt = cn.createStatement();
                            ResultSet rs = stmtt.executeQuery("select * from sedan join category where sedan.c_id = category.id");
                            while (rs.next()) {
                                Blob image = rs.getBlob("sedan.s_image");
                                byte imgData[] = image.getBytes(1, (int) image.length());
                                String encodedImage = Base64.getEncoder().encodeToString(imgData);
                                String Simage = "data:image/jpg;base64," + encodedImage;
                        %>
                        <div class="col-md-4 " height="400px;">
                            <div class="card mb-4  text-secondary  ">
                                <!--<img src="" alt=""/>-->
                                <img class="card-img-top"  src="<%= Simage%>" height="220px" width="220px" alt="Card image cap">
                                <div class="card-body px-3 py-3">


                                    <%
                                        int s_id = rs.getInt("s_id");
                                        String s_name = rs.getString("s_name");
                                        String s_company = rs.getString("s_company");
                                        String s_category = rs.getString("category.name");
                                        String s_option = rs.getString("s_option");
                                        int s_status = rs.getInt("s_status");
                                        String s_price = rs.getString("s_price");
                                        String s_image = rs.getString("s_image");
                                        String s_logo = rs.getString("s_logo");

                                    %>
                                    Vehicle Name: <%= s_name%><br>
                                    Vehicle Company: <%= s_company%><br>
                                    Vehicle Category: <%= s_category%><br>
                                    Vehicle Option: <%= s_option%><br>                                    
                                     <% if(s_status == 0) {%>
                                    Vehicle Status: Avaliable<br>
                                    <%} else {%>
                                    Vehicle Status: Unavaliable<br> <%}%> 
                                    Price Per Day: Rs.<%= s_price%>    
                                    <% if (s_status == 0) {%>
                                    <%
                                        Object name = session.getAttribute("s_name");
                                        if (name == null) {%>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-sm btn-outline-secondary mt-2"><a style="font-size:15px;" href="login.jsp" class="text-decoration-none text-dark">Rent Now</a></button>
                                        </div>
                                    </div>
                                    <%} else {%>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-sm btn-outline-primary mt-2"><a style="font-size:15px;" href="BookForLimitedHours.jsp?id=<%= s_id%>" class="text-decoration-none text-secondary">Rent Now</a></button>
                                        </div>
                                    </div>
                                    <%}%>
                                    <%} else {%>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group">
                                            <button type="" class="btn btn-sm btn-outline-secondary mt-2"><a style="font-size:15px;" class="text-decoration-none text-secondary">Already Rented</a></button>
                                        </div>
                                    </div>
                                    <% } %>
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


        <!-- Optional JavaScript; choose one of the two! -->

        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

        <!-- Option 2: Separate Popper and Bootstrap JS -->
        <!--
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
        -->
    </body>
</html>