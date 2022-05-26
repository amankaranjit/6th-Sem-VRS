<%@page import="java.sql.Blob"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="JDBCConnection.JDBCConnection"%>
<html lang="en">
    <head>
        <title>Admin Panel</title>
        <link rel="icon" href="assets/img/logo.png" type=".image/icon type">
        <link href="assets/stylesheet/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <style>
            .forms{
                margin-top: 20px;
                margin-left: 50px;
            }
            .formm{
                margin-left: 50px;
                margin-top: 20px;
                /*background-color: red;*/
                /*width: 200px;*/
            }
            .control-label{
                color:black;
            }
            .form-group > input{
                width: 100%;
            }
            table{
                width: 100%;
            }
            .card-body{
                width: 100%;
            }
        </style>
    </head>
    <body>
        <div><!<!-- navbartop start -->
            <%@include file="adminnavbar.jsp" %>
        </div><!-- navbartop ends -->

        <div class="row">
            <div class="col-1">
                <%@include file="adminSidebar.jsp" %>
            </div>
            <div class="col-7 mt-3 mb-4" style="margin-left: 230px;">
                <div class="row-2">
                    <!-- FORM Panel -->
                    <div class="col forms ">

                        <div class="card">
                            <div class="card-header">
                                Edit Vehicles
                            </div>


                            <form action="UserServlet"  method="post" onSubmit="validationForm();">
                                <%
                                    String userid = request.getParameter("id");
                                    int id = Integer.parseInt(userid);
                                    System.out.println(id);
                                    Connection conn = JDBCConnection.getConnection();
                                    String squery = "select * from users where id = '" + id + "'";
                                    PreparedStatement stmtt = conn.prepareStatement(squery);
                                    ResultSet rs = stmtt.executeQuery(squery);
                                    while (rs.next()) {
                                %>

                                <%
                                    String u_name = rs.getString("name");
                                    String email = rs.getString("email");
                                    String contact = rs.getString("contact");
                                    String address = rs.getString("address");
                                  
                                %>
                                <div class="card-body text-light">

                                    <input type="hidden" name="id" value="<%= id%>">
                                    <div class="form-group">

                                        <label class="control-label">Vehicle Name</label>
                                        <input type="text" class="form-control" name="name"  required value="<%=u_name%>">
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">Vehicle Company</label>
                                        <input type="text" class="form-control" name="email" required value="<%=email%>">
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">Vehicle Type</label>
                                        <input type="text" class="form-control" name="contact" required value="<%= contact%>">
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">Vehicle Option</label>
                                        <input type="text" class="form-control" name="address" required value="<%= address%>">
                                    </div>
                             
                                </div>
                                <div class="card-footer">
                                    <div class="row">
                                        <div class="col-md-10">
                                            <button class="btn btn-sm btn-primary col-sm-5 offset" type="submit"> Edit</button>                                          
                                        </div>
                                    </div>
                                </div>
                                <%     }
                                %>
                            </form>

                        </div>


                    </div>

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