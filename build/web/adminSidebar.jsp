<%-- 
    Document   : adminSidebar
    Created on : Mar 5, 2022, 3:57:20 PM
    Author     : Aman Karanjit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="assets/stylesheet/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="icon" href="assets/img/logo.png" type="image/icon type">
        <!--<title>JSP Page</title>-->
        <style>
            .pos{
                /*                position: fixed;*/
                /*                left: 0;*/
            }
        </style>
    </head>
    <body class="bg-dark">


        <div class="d-flex pos flex-column flex-shrink-0 p-2 text-white bg-dark " style="width: 179px; height:auto; ">

            <hr>
            <ul class="nav nav-pills flex-column mb-auto listed">

                <li>
                    <a href="AddCategory.jsp" class="nav-link text-white">                      
                        Categories
                    </a>
                </li>
                    
                <li>
                    <a href="AddVehicles.jsp" class="nav-link text-light">                      
                        Add Vehicles
                    </a>
                </li>
                <li>
                    <a href="ViewVehicles.jsp" class="nav-link text-light">                      
                        View Vehicles
                    </a>
                </li>
                <li>
                    <a href="Pending.jsp" class="nav-link text-white">                       
                        Booking
                    </a>
                </li> 
                 <li>
                    <a href="booked.jsp" class="nav-link text-white">                       
                        Booked
                    </a>
                </li>
                <li>
                    <a href="bookingHistory.jsp" class="nav-link text-white">                       
                        Booking History
                    </a>
                </li>
                <li>
                    <a href="manageUsers.jsp" class="nav-link text-white">                       
                        Users
                    </a>
                </li>
            </ul>
            <hr>

        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>