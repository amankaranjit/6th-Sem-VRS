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
            <div class="container ">

                <div class="row ">
                    <div class="col">

                        <div class="card bg-light mb-2">
                            <h2 class="text-center p-3 text-dark">Check Out Page</h2>
                            <div class="card-body mb-2">                                
                                <form action="BookingServlet" method="post">
                                    <%
                                        Connection cn = JDBCConnection.getConnection();
//                                        System.out.println(id);
                                        Statement stmt = cn.createStatement();
                                        ResultSet rss = stmt.executeQuery("select * from booking join users where booking.u_id = users.id and u_id = '" + u_id + "' order by b_id desc limit 1");
                                        while (rss.next()) {
                                            String s_price = rss.getString("b_total_price");
                                            String pickup_date = rss.getString("pickup_date");
                                            String drop_date = rss.getString("drop_date");
                                            int no_of_days = rss.getInt("no_of_days");
                                            int price = Integer.parseInt(s_price);
                                            String uname = rss.getString("users.name");
                                    %>

                                    <div class="row m-2  ">
                                        <div class="col">
                                            <h5 class="text-left ">
                                                <p class="py-4">Dear. <%= uname%>, your pick up date is <%= pickup_date%>,
                                                    and your total cost is Rs.<%= price%> only.</p>
                                            </h5>
                                            <h5 >Do you want a guide?  <a href="GuidePage.jsp" class="text-dark">Yes</a> ||  <a href="checkoutpageforhrs.jsp" class="text-dark" >No</a></h5>
                                            <script src="https://www.paypal.com/sdk/js?client-id=AaGPDbS6gpI5fF2ANVrhk3s3mNxbFhFNlhPwwiq9gidXEQ0fJog__UNAvFKtIYbSGKVYQN6GN5gnkNQP&currency=USD&disable-funding=credit,card"></script>                  
                                        
                                        </div>
                                        <div id="paypal-payement-button">
                                            <h4>Pay with Paypal:</h4>
                                        </div>
                                        <%}%>
                                    </div>                                                                     
                                </form>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>


        <div class=" text-light" style=" position:absolute;
             bottom:3"> 
            <jsp:include page="footer.jsp"/>
        </div>

        <script src="assets/js/paypal.js" type="text/javascript"></script>
    </body>
</html>