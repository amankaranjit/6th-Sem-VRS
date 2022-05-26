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


                            <form action="VehiclesUpdate"  method="post" onSubmit="validationForm();">
                                <%
                                    String userid = request.getParameter("s_id");
                                    int s_id = Integer.parseInt(userid);
                                    System.out.println(s_id);
                                    Connection conn = JDBCConnection.getConnection();
                                    String squery = "select * from sedan where s_id = '" + s_id + "'";
                                    PreparedStatement stmtt = conn.prepareStatement(squery);
                                    ResultSet rs = stmtt.executeQuery(squery);
                                    while (rs.next()) {
                                %>

                                <%
                                    String s_name = rs.getString("s_name");
                                    String s_company = rs.getString("s_company");
                                    String s_category = rs.getString("s_category");
                                    String s_option = rs.getString("s_option");
                                    String s_status = rs.getString("s_status");
                                    String s_price = rs.getString("s_price");


                                %>
                                <div class="card-body text-light">

                                    <input type="hidden" name="id" value="<%= s_id%>">
                                    <div class="form-group">

                                        <label class="control-label">Vehicle Name</label>
                                        <input type="text" class="form-control" name="s_name"  required value="<%=s_name%>">
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">Vehicle Company</label>
                                        <input type="text" class="form-control" name="s_company" required value="<%=s_company%>">
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">Vehicle Type</label>
                                        <input type="text" class="form-control" name="s_category" required value="<%= s_category%>">
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">Vehicle Option</label>
                                        <input type="text" class="form-control" name="s_option" required value="<%= s_option%>">
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">Vehicle Status</label>
                                        <input type="text" class="form-control" name="s_status" required value="<%= s_status%>">
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">Vehicle Price</label>
                                        <input type="text" class="form-control" name="s_price" required value=" Rs.<%= s_price%>">
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">Vehicle Image</label>
                                        <input type="file" class="form-control" name="s_image"  >
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">Vehicle Logo</label>
                                        <input type="file" class="form-control" name="s_logo"  >
                                    </div>

                                </div>
                                <div class="card-footer">
                                    <div class="row">
                                        <div class="col-md-10">
                                            <button class="btn btn-sm btn-primary col-sm-5 offset" type="submit"> Update</button>                                          
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