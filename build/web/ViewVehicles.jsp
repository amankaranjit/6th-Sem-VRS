<%@page import="java.util.Base64"%>
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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="icon" href="assets/img/logo.png" type=".image/icon type">
        <link href="assets/stylesheet/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <style>
            .forms{
                margin-top: 20px;
                margin-left: 50px;
            }
            .formm{
                margin-left: 40px;
                margin-top: 20px;
                /*width: 200px;*/
            }
            .control-label{
                color:black;
            }
            .form-group > input{
                width: 90%;
            }
            table{
                width:90%;
            }
            .card-body{
                width: 90%;
            }
        </style>
    </head>
    <body>
        <div><!<!-- navbartop start -->
            <%@include file="adminnavbar.jsp" %>
        </div><!-- navbartop ends -->

        <div class="row" >
            <div class="col-2 ">
                <%@include file="adminSidebar.jsp" %>
            </div>


            <!-- FORM Panel -->

            <div class="col-9 formm bg-light " >
                <div class=" ">
                    <div class="">
                        <table class=" text-dark table table-bordered">
                            <thead>
                                <tr>                                           
                                    <th class="text-center">Vehicle Name</th>                                            
                                    <th class="text-center">Vehicle Company</th> 
                                    <th class="text-center">Vehicle Category</th>
                                    <th class="text-center">Vehicle Option</th>  
                                    <th class="text-center">Vehicle Status</th> 
                                    <th class="text-center">Vehicle Price</th> 
                                    <th class="text-center">Vehicle Image</th>  
                                    <th class="text-center">Vehicle Logo</th>  
                                    <th class="text-center">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    Connection conn = JDBCConnection.getConnection();
                                    String squery = "select * from sedan join category where sedan.c_id = category.id";
                                    PreparedStatement stmtt = conn.prepareStatement(squery);
                                    ResultSet rs = stmtt.executeQuery(squery);
                                    while (rs.next()) {
                                %>

                                <%
                                    String s_name = rs.getString("sedan.s_name");
                                    String s_company = rs.getString("sedan.s_company");
                                    String s_category = rs.getString("category.name");
                                    String s_option = rs.getString("sedan.s_option");
                                    String s_status = rs.getString("sedan.s_status");
                                    int status = Integer.parseInt(s_status);
                                    String s_price = rs.getString("sedan.s_price");

                                    Blob image = rs.getBlob("sedan.s_image");
                                    byte imgData[] = image.getBytes(1, (int) image.length());
                                    String encodedImage = Base64.getEncoder().encodeToString(imgData);
                                    String Simage = "data:image/jpg;base64," + encodedImage;

                                    Blob logo = rs.getBlob("sedan.s_logo");
                                    byte logoData[] = logo.getBytes(1, (int) logo.length());
                                    String logoImage = Base64.getEncoder().encodeToString(logoData);
                                    String Slogo = "data:image/jpg;base64," + logoImage;

                                %>


                                <tr>                            
                                    <td class="text-center">
                                        <p class="text-capitalize"> <b><%= s_name%></b></p>
                                    </td>
                                    <td class="text-center">
                                        <p class="text-capitalize"> <b><%= s_company%></b></p>
                                    </td>
                                    <td class="text-center">
                                        <p class="text-capitalize"> <b><%= s_category%></b></p>
                                    </td>
                                    <td class="text-center">

                                        <p class="text-capitalize"> <b><%= s_option%></b></p>
                                    </td>
                                    <td class="text-center">
                                        <% if (status == 0) {%>
                                        <p class="text-capitalize"> <b>Available</b></p>
                                        <%} else {%>
                                        <p class="text-capitalize"> <b>Unavailable</b></p>
                                        <%}%>
                                    </td>                                           
                                    <td class="text-center">
                                        <p class="text-capitalize"> <b>Rs.<%= s_price%></b></p>
                                    </td>
                                    <td class="text-center">
                                        <img src="<%= Simage%>" width="180" height="120">
                                    </td>
                                    <td class="text-center">
                                        <img src="<%= Slogo%>" width="180" height="120">
                                    </td>
                                    <td class="text-center">
                                        <a href="DeleteVehicles.jsp?s_id=<%=rs.getInt("s_id")%>" class="btn btn-danger mt-4">Delete</a>
                                           <!--<a href="UpdateVehicle.jsp?s_id=<%=rs.getInt("s_id")%>" class="btn btn-primary m-1">Update</a>-->                                            
                                    </td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
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