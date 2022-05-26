<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Blob"%>
<!doctype html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="JDBCConnection.JDBCConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Connection conn = JDBCConnection.getConnection();
    Statement st = conn.createStatement();
    ResultSet rs = null;
%>
<html>
    <head>
        <link href="assets/stylesheet/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Now</title>
        <link rel="icon" href="assets/img/logo.png" type="image/icon type">
        <!--Bootstrap Css-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <style>
            body {

                background-repeat: no-repeat;
                background-size: cover;
            }
            .box-shadow {
                box-shadow: 0 .25rem .75rem rgba(0, 0, 0, .05);
            }
            .album{
                margin-top: 30px;
                margin-left: 380px;
                width: 700px;
            }
            .btn{
                margin-left: 150px;
            }
        </style>
    </head>
    <body>
        <%
            Object u_id = session.getAttribute("s_id");
        %>
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
        <jsp:include page="navbar.jsp"/>
        <div class="album ">
            <div class="container">

                <div class="row ">
                    <div class="col">

                        <div class="card bg-light">
                            <h2 class="text-center p-2 text-dark">Booking Form</h2>
                            <div class="card-body ">                                
                                <form action="BookingServlet" method="post">
                                    <%
                                        String s_id = request.getParameter("id");
                                        int id = Integer.parseInt(s_id);
                                        Connection cn = JDBCConnection.getConnection();
//                                        System.out.println(id);
                                        Statement stmt = cn.createStatement();
                                        ResultSet rss = stmt.executeQuery("select * from sedan where s_id = '" + id + "'");
                                        while (rss.next()) {
                                            String s_name = rss.getString("s_name");
                                            String s_option = rss.getString("s_option");
                                            String s_price = rss.getString("s_price");
                                            int price = Integer.parseInt(s_price);
                                    %>
                                    <input type="hidden" value="<%= u_id%>" name="user_id"/>
                                    <input type="hidden" value="<%= id%>" name="s_id"/>
                                    <input type="hidden" value="<%= price%>" name="s_price"/>

                                    <%
                                        System.out.println("User" + u_id);
                                        System.out.println("Sedan" + id);

                                    %>
                                    <div class="row m-4 ">
                                        <div class="col">
                                            <label class="p-2">Vehicle Name:</label>
                                            <input type="text" class="form-control bg-light" placeholder="<%= s_name%>" name="s_name" readonly>
                                        </div>
                                        <div class="col">
                                            <label class="p-2">Vehicle Option:</label>
                                            <input type="text" class="form-control bg-light" placeholder="<%= s_option%>" name="s_option" readonly>
                                        </div>
                                        <%}%>
                                    </div>
                                    <div class="row m-4">

                                        <div class="col">
                                            <label class="p-2">Pick Up Date:</label>
                                            <input type="date" class="form-control date_picker" placeholder="" name="pickup_date" minDate =" 0 "  required>
                                        </div>
                                        <div class="col">
                                            <label class="p-2">Drop Date:</label>
                                            <input type="date" class="form-control date_picker" placeholder="" name="drop_date" minDate =" 0 " required>
                                        </div>

                                    </div>
                                    <div style="margin-left:40px; border-radius: 5px;" >
                                        <input type="submit" class="bg-secondary text-light p-2 px-3" value="Book">
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <div class="mt-4 text-light">
        <jsp:include page="footer.jsp"/>
    </div>
     <!--jquery cdn-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.7.2.min.js"></script>
    <!--previous date disable jquery-->
    <script>
        let today = new Date();
        let dd = String(today.getDate()).padStart(2, '0');
        let mm = String(today.getMonth() + 1).padStart(2, '0');
        let yyyy = today.getFullYear();

        today = yyyy + '-' + mm + '-' + dd;
        $('.date_picker').attr('min',today);
    </script>
</body>
</html>