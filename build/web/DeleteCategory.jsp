<%-- 
    Document   : delete
    Created on : Mar 9, 2022, 7:31:50 PM
    Author     : khatr
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
            String userid = request.getParameter("id");
            int id = Integer.parseInt(userid);
            Connection conn = JDBCConnection.getConnection();
            Statement stmt = conn.createStatement();
            stmt.executeUpdate("delete from category where id= '" + id + "'");

            response.sendRedirect("AddCategory.jsp");

        %>
    </body>
</html>