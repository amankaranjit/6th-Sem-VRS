<%-- 
    Document   : Profile.jsp
    Created on : May 23, 2022, 10:45:12 AM
    Author     : Aman Karanjit
--%>
<%@page import="java.sql.Statement"%>
<%@page import="JDBCConnection.JDBCConnection"%>
<!doctype html>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <link href="assets/stylesheet/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile Page</title>

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
    </head>
<body>
    <div><%@include file="navbar.jsp" %></div>
    <%
        Object user_id = session.getAttribute("s_id");
    %>
    <%
        Connection cn = JDBCConnection.getConnection();
    %>


    <div class="album ">
        <div class="container ">


            <div class="row " style="width:390px; float: left; margin-top: 50px;">
                <div class="col">
                    <div class="card bg-light mb-2">
                        <%
                            Statement stmt = cn.createStatement();
                            ResultSet rs = stmt.executeQuery("select * from users where id = '" + user_id + "'");
                            while (rs.next()) {
                                String user_name = rs.getString("name");
                                String contact = rs.getString("contact");
                                String email = rs.getString("email");
                        %>
                        <form action="UpdateProfileServlet" method="post" onsubmit="return validateForm()">
                            <div class="row m-3">
                                <div class="col">
                                    <label>Full Name</label>
                                    <input type="text" class="form-control" placeholder="" name="full_name" value="<%= user_name%>" required>
                                </div>
                                <div class="col">
                                    <label>Contact</label>
                                    <input type="text" class="form-control" placeholder="" name="contact" value="<%= contact%>" required>
                                </div>
                            </div>
                            <div class="row m-3">

                                <div class="col">
                                    <label>Email</label>
                                    <input type="text" class="form-control" name="email" value="<%= email%>"  required readonly/>

                                </div>
                            </div>
                            <div class="">
                                <div class="btn-group px-6 mb-2">

                                    <button type="submit" class="btn px-3 btn-secondary" style="margin-left: 35px;">Update</button>
                                </div>
                            </div>

                        </form>
                        <% }%>

                    </div>
                </div>

            </div><!-- profile div ends -->

            <div class="row " style="width:740px; float: right; margin-top: 50px;">
                <div class="col">
                    <div class="card bg-light mb-2">
                        <h3 class="font-weight-bold text-center">Recent Booking</h3>
                        <table class="table">
                            <thead class="thead-dark">
                                <tr align="center" >
                                    <th scope="col">Check In Date</th>
                                    <th scope="col">Check Out Date</th>
                                    <th scope="col">Total Price</th>
                                    <th scope="col">Total Days</th>
                                    <th scope="col">Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    String query = "select * from booking join users on booking.u_id = users.id join sedan on booking.s_id = sedan.s_id where users.id = '" + user_id + "'";
                                    PreparedStatement pstmt = cn.prepareStatement(query);
                                    ResultSet rss = pstmt.executeQuery(query);
                                    while (rss.next()) {
//                                            String room_number = rss.getString("rooms.room_number");
                                        String price = rss.getString("booking.b_total_price");
                                        String datein = rss.getString("booking.pickup_date");
                                        String dateout = rss.getString("booking.drop_date");
                                        String total_days = rss.getString("booking.no_of_days");
                                        int status = rss.getInt("booking.b_status");

                                %>
                                <tr>
                                    <!--<td class="text-center"></td>-->
                                    <td class="text-center"><b><%= datein%></td>
                                    <td class="text-center"><b><%= dateout%></td>
                                    <td class="text-center"><b><%= price%></td>
                                    <td class="text-center"><b><%= total_days%></td>
                                    <td class="text-center">
                                        <% if (status == 0) {%>
                                        <span class="badge badge-danger bg-secondary">Pending</span>
                                        <% } else if (status == 1) {%>
                                        <span class="badge badge-primary bg-gradient">Accepted</span>

                                        <%} else  {%>
                                        <span class="badge badge-success">Queued</span>
                                     
                                        <% } %>
                                    </td>
                                </tr>

                                <% }%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </div>




</body>
</html>


