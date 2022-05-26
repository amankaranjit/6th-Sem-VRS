package com.backendServlet;

import JDBCConnection.JDBCConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CategoryServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Connection cn = JDBCConnection.getConnection();
            String c_name = request.getParameter("c_name");
            System.out.println(c_name);
            String insertQuery = "INSERT INTO category(name) values(?)";
            PreparedStatement stmt = cn.prepareStatement(insertQuery);

            stmt.setString(1, c_name);
            stmt.execute();
            RequestDispatcher rd = request.getRequestDispatcher("ResponseAddCategory.jsp");            
            rd.include(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
