<%-- 
    Document   : delete
    Created on : Mar 9, 2022, 7:31:50 PM
    
--%>

<%@page import="JDBCConnection.JDBCConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
                <link rel="icon" href="../assets/img/logo.png" type=".image/icon type">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            String s_id = request.getParameter("s_id");
            int id = Integer.parseInt(s_id);
            Connection conn = JDBCConnection.getConnection();
            Statement stmt = conn.createStatement();
            stmt.executeUpdate("delete from sedan where s_id= '" + id + "'");
            
            response.sendRedirect("ViewVehicles.jsp");
            
        %>
    </body>
</html>