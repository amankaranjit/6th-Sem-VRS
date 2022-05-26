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
            <div class="col-9 mt-2" style="margin-left: 100px;">
                <div class="row-2">
                    <!-- FORM Panel -->
                    <div class="col forms ">
                        <form action="AddVehicle"  method="post" onSubmit="validationForm();" enctype="multipart/form-data">
                            <div class="card">
                                <div class="card-header">
                                    Add Vehicle
                                </div>
                                <div class="card-body">
                                    <input type="hidden" name="id">
                                    <div class="form-group">
                                        <label class="control-label">Vehicle Name</label>
                                        <input type="text" class="form-control" name="s_name">
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">Vehicle Company</label>
                                        <input type="text" class="form-control" name="s_company">
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">Vehicle Category</label>

                                        <select class="custom-select browser-default" name="s_category">
                                            <!-- <option value="0">Single</option>-->
                                            <%
                                                Connection cn = JDBCConnection.getConnection();
                                                String query = "select * from category";
                                                PreparedStatement stmt = cn.prepareStatement(query);
                                                ResultSet rs = stmt.executeQuery(query);
                                                while (rs.next()) {
                                            %>
                                            <option value="<%=rs.getInt("id")%>"> <%=rs.getString("name")%> </option>

                                            <%}%>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">Vehicle Option</label>
                                        <input type="text" class="form-control" name="s_option">
                                    </div>
<!--                                    <div class="form-group">
                                        <label class="control-label">Vehicle Status</label>
                                        <input type="text" class="form-control" name="s_status">
                                    </div>-->

                                    <div class="form-group">
                                        <label class="control-label">Vehicle Price</label>
                                        <input type="text" class="form-control" name="s_price">
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">Vehicle Image</label>
                                        <input type="file" class="form-control" name="s_image">
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">Vehicle Logo</label>
                                        <input type="file" class="form-control" name="s_logo">
                                    </div>
                                </div>                                       

                                <div class="card-footer">
                                    <div class="row">
                                        <div class="col-md-10">
                                            <button class="btn btn-sm btn-primary col-sm-5 offset" type="submit"> Add</button>                                          
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
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