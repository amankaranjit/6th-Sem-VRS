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
                    <!-- FORM Panel -->
                    <div class="col-md-4 ">
                        <form action="AddCategoryServlet"  method="post" onSubmit="validationForm();">
                            <div class="card">
                                <div class="card-header">
                                    Add Category
                                </div>
                                <div class="card-body">
                                    <input type="hidden" name="id">
                                    <div class="form-group">
                                        <label class="control-label">Category Name</label>
                                        <input type="text" class="form-control" name="name">
                                    </div>
                                    <div class="form-group">
                                        <img src="" alt="" id="cimg">
                                    </div>
                                </div>

                                <div class="card-footer">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <button class="btn btn-sm btn-primary col-sm-3 offset" type="submit"> Add</button>                                          
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <!-- FORM Panel -->

                    <!-- Table Panel -->
                    <div class="col-md-7 pr-2">
                        <div class="card ">
                            <div class="card-body">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                        <tr>                                           
                                            <th class="text-center">Category</th>                                            
                                            <th class="text-center">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            Connection cn = JDBCConnection.getConnection();
                                            String query = "select * from category";
                                            PreparedStatement stmt = cn.prepareStatement(query);
                                            ResultSet rs = stmt.executeQuery(query);
                                            while (rs.next()) {
                                        %>

                                        <%
                                            String c_name = rs.getString("name");
//                                            Blob img = rs.getBlob("cover_img");

                                        %>


                                        <tr>                            
                                            <td class="text-center">
                                                <p class="text-capitalize">Category Name : <b><%= c_name%></b></p>
                                            </td>
                                            <td class="text-center">
                                               <a href="DeleteCategory.jsp?id=<%=rs.getString("id")%>" class="btn btn-danger">Delete</a>
                                               <!--<a href="UpdateVehicle.jsp?id=<%=rs.getString("id")%>" class="btn btn-primary">Edit</a>-->                                           
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