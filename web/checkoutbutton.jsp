<%-- 
    Document   : checkoutbutton
    Created on : Mar 17, 2022, 6:54:06 PM
    Author     : Aman Karanjit
--%>
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
        <title>Check Out Page</title>
    </head>
    <body>
        <%
            String userid = request.getParameter("id");
            int id = Integer.parseInt(userid);
            Connection conn = JDBCConnection.getConnection();
            Statement stmt = conn.createStatement();
            stmt.executeUpdate("update booking, sedan set booking.b_status   = 3, sedan.s_status = 0 where booking.s_id = sedan.s_id  and booking.b_id= '" + id + "'");

            response.sendRedirect("booked.jsp");

        %>
    </body>
</html>
