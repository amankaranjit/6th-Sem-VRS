package com.backendServlet;

import JDBCConnection.JDBCConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        Connection cn = JDBCConnection.getConnection();
        String u_id = request.getParameter("id");
        int id = Integer.parseInt(u_id);
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String contact = request.getParameter("contact");
        String address = request.getParameter("address");
        String query = "update users set name = ?, email = ?,contact = ?, address = ? where id = '" + id + "'";
        PreparedStatement preparedStmt;
        try {
            preparedStmt = cn.prepareStatement(query);
            preparedStmt.setString(1, name);
            preparedStmt.setString(2, email);
            preparedStmt.setString(3, contact);
            preparedStmt.setString(4, address);
            preparedStmt.executeUpdate();

            response.sendRedirect("manageUsers.jsp");
        } catch (SQLException ex) {
        }

    }
}
