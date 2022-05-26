/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.backendServlet;

import JDBCConnection.JDBCConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Aman Karanjit
 */
public class AddGuideServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            Connection cn = JDBCConnection.getConnection();
            String g_name = request.getParameter("g_name");
            String g_experience = request.getParameter("g_experience");

            String insertQuery = "INSERT INTO guide_table(g_name, g_experience) values(?,?)";
            PreparedStatement stmt = cn.prepareStatement(insertQuery);

            stmt.setString(1, g_name);
            stmt.setString(2, g_experience);
            stmt.executeUpdate();

            response.sendRedirect("AddGuide.jsp");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
