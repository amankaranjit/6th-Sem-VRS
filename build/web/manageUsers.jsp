<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="JDBCConnection.JDBCConnection"%>
<html lang="en">
    <head>
        <link rel="icon" href="assets/img/logo.png" type=".image/icon type">
        <link href="assets/stylesheet/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>Admin Panel</title>
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
            <div class="col-3">
                <%@include file="adminSidebar.jsp" %>
            </div>
            <div class="col-9 mt-2">
                <div class="row">
                    <!-- Table Panel -->
                    <div class="col-md-9 pr-2">
                        <div class="card ">
                            <div class="card-body">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                        <tr>                                           
                                            <th class="text-center">Name</th>                                            
                                            <th class="text-center">Email</th>
                                            <th class="text-center">Contact</th>
                                            <th class="text-center">Address</th>
                                            <th class="text-center">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            Connection cn = JDBCConnection.getConnection();
                                            String query = "select * from users";
                                            PreparedStatement stmt = cn.prepareStatement(query);
                                            ResultSet rs = stmt.executeQuery(query);
                                            while (rs.next()) {
                                        %>

                                        <%
                                            String u_name = rs.getString("name");
                                            String email = rs.getString("email");
                                            String contact = rs.getString("contact");
                                            String address = rs.getString("address");
                                        %>


                                        <tr>                            
                                            <td class="text-center">
                                                <p class="text-capitalize"><b><%= u_name%></b></p>
                                            </td>

                                            <td class="text-center">
                                                <p class=""><b><%= email%></b></p>
                                            </td>

                                            <td class="text-center">
                                                <p class="text-capitalize"><b><%= contact%></b></p>
                                            </td>
                                            <td class="text-center">
                                                <p class="text-capitalize"><b><%= address%></b></p>
                                            </td>
                                            <td class="text-center">
                                                <a href="DeleteUsers.jsp?id=<%=rs.getString("id")%>" class="btn btn-danger m-1">Delete</a>
                                                <a href="Users.jsp?id=<%=rs.getString("id")%>" class="btn btn-primary">Edit</a>
                                            </td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- Table Panel -->
                </div>


            </div>
        </div>



        <script type="text/javascript">
            function validationForm() {
                let a = document.forms['myForm']["name"].value;
                let c = document.forms['myForm']["price"].value;
                let d = document.forms['myForm']["image"].value;


                if (a === "" || c === "" || d === "") {
                    alert("Fields must be filled out");
                    return false;
                }

            }
        </script>
    </body>
</html>