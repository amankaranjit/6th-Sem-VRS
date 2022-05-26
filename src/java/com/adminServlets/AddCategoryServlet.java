package com.adminServlets;

import JDBCConnection.JDBCConnection;
import java.io.IOException;
import java.nio.file.Paths;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

public class AddCategoryServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();
        try {

            Connection cn = JDBCConnection.getConnection();
            String name = request.getParameter("name");

            String insertQuery = "INSERT INTO category(name) values(?)";
            PreparedStatement stmt = cn.prepareStatement(insertQuery);

            stmt.setString(1, name);
            stmt.execute();

            response.sendRedirect("AddCategory.jsp");
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

}
