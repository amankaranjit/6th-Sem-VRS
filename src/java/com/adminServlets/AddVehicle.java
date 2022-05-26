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
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/uploadImage")
@MultipartConfig(maxFileSize = 16177216)
public class AddVehicle extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         PrintWriter out = response.getWriter();
        try {

            Connection cn = JDBCConnection.getConnection();
            String s_name = request.getParameter("s_name");
            String s_company = request.getParameter("s_company");
            String s_category = request.getParameter("s_category");
            int c_id = Integer.parseInt(s_category);
            String s_option = request.getParameter("s_option");
            String s_price = request.getParameter("s_price");

            System.out.println(s_name);
            Part s_image = request.getPart("s_image");
            Part s_logo = request.getPart("s_logo");

            String insertQuery = "INSERT INTO sedan(s_name,s_company,c_id,s_option,s_status,s_price,s_image,s_logo) values(?,?,?,?,?,?,?,?)";
            PreparedStatement stmt = cn.prepareStatement(insertQuery);

            InputStream image = s_image.getInputStream();
            InputStream logo = s_logo.getInputStream();
            stmt.setString(1, s_name);
            stmt.setString(2, s_company);
            stmt.setInt(3, c_id);
            stmt.setString(4, s_option);
            stmt.setInt(5, 0);
            stmt.setString(6, s_price);
            stmt.setBlob(7, image);
            stmt.setBlob(8, logo);            
            stmt.execute();

            response.sendRedirect("AddVehicles.jsp");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
