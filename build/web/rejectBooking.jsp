<%-- 
    Document   : rejectBooking
    Created on : Mar 17, 2022, 11:58:57 AM
    Author     : Aman Karanjit
--%>
<%@page import="JDBCConnection.JDBCConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String userid = request.getParameter("id");
            int id = Integer.parseInt(userid);
            Connection conn = JDBCConnection.getConnection();
            Statement stmt = conn.createStatement();
            stmt.executeUpdate("update booking set b_status =4 where b_id= '" + id + "'");
            response.sendRedirect("Pending.jsp");

        %>
    </body>
</html>