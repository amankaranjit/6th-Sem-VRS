<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="JDBCConnection.JDBCConnection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
         <link rel="icon" href="assets/img/logo.png" type="image/icon type">
        <style>
            .control-label{
                color:black;
            }
            .form-group > input{
                width: 100%;
            }
        </style>
    </head>
    <body>
        <div><!<!-- navbartop start -->
            <%@include file="adminnavbar.jsp" %>
        </div><!-- navbartop ends -->

        <div class="row">
            <div class="col-2">
                <%@include file="adminSidebar.jsp" %>
            </div>
            <div class="col-9 mt-2 ">
                <div class="row">
                    <!-- Table Panel -->
                    <div class="col-12 ">
                        <div class="card ">
                            <div class="card-body">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th scope="col">Name</th>
                                            <th scope="col">Email</th>
                                            <th scope="col">Pick Up Date</th>
                                            <th scope="col">Drop Date</th>
                                            <th scope="col">Vehicle Name</th>
                                            <th scope="col"> Total Price</th>
                                            <th scope="col">Status</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%                                  
                                            Connection cn = JDBCConnection.getConnection();
                                            String query = "select * from booking join users on booking.u_id = users.id join sedan on booking.s_id = sedan.s_id and  booking.b_status = 2";
                                            PreparedStatement stmt = cn.prepareStatement(query);
                                            ResultSet rs = stmt.executeQuery(query);

                                            while (rs.next()) {
                                                int id = rs.getInt("booking.b_id");
                                                String u_name = rs.getString("users.name");
                                                String email = rs.getString("users.email");
                                                String pickup_date = rs.getString("booking.pickup_date");
                                                String drop_date = rs.getString("booking.drop_date");
                                                String s_name = rs.getString("sedan.s_name");
                                                int status = rs.getInt("booking.b_status");
                                                int b_total_price = rs.getInt("booking.b_total_price");
                                            
                                        %>

                                        <tr>
                                            <td><%= u_name%></td>
                                            <td><%= email%></td>
                                            <td><%= pickup_date%></td>
                                            <td><%= drop_date%></td>
                                            <td><%= s_name%></td>
                                            <td>Rs.<%= b_total_price%></td>
                                            <%if (status == 0) {%>
                                            <td><span class="badge badge-warning">Pending</span></td>
                                          
                                            <%} else if (status == 1) {%>
                                            <td><span class="badge badge-primary">Accepted</span></td>

                                            <%} else if (status == 2) {%>
                                            <td><span class="badge badge-danger">Checkout</span></td>
                                            <%} else {%>
                                            <td><span class="badge badge-danger">Rejected</span></td>
                                            <% } %>

                                        </tr>

                                        <%}%>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
