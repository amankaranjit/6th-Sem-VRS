//package com.adminServlets;
//import JDBCConnection.JDBCConnection;
//import java.io.IOException;
//import java.io.InputStream;
//import java.io.PrintWriter;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.MultipartConfig;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
////import javax.servlet.http.Part;
//
//@WebServlet("/uploadImage")
//@MultipartConfig(maxFileSize = 16177216)
//public class VehiclesUpdate extends HttpServlet {
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//
//        PrintWriter out = response.getWriter();
////        try {
//
//            Connection cn = JDBCConnection.getConnection();
//            String s_name = request.getParameter("s_name");
//            String sid = request.getParameter("id");
//            int s_id = Integer.parseInt(sid);
//            String s_company = request.getParameter("s_company");
//            String s_category = request.getParameter("s_category");
//            String s_option = request.getParameter("s_option");
//            String s_status = request.getParameter("s_status");
//            String s_price = request.getParameter("s_price");
//
//            out.println(s_name);
////            Part s_image = request.getPart("s_image");
////            Part s_logo = request.getPart("s_logo");
////
////            String insertQuery = "UPDATE sedan set s_name = ?,s_company = ?,s_category = ?,s_option = ?,s_status = ?,s_price = ?,s_image = ?,s_logo = ? where s_id = id";
////            PreparedStatement stmt = cn.prepareStatement(insertQuery);
////
////            InputStream image = s_image.getInputStream();
////            InputStream logo = s_logo.getInputStream();
////            stmt.setString(1, s_name);
////            stmt.setString(2, s_company);
////            stmt.setString(3, s_category);
////            stmt.setString(4, s_option);
////            stmt.setString(5, s_status);
////            stmt.setString(6, s_price);
////            stmt.setBlob(7, image);
////            stmt.setBlob(8, logo);            
////            stmt.executeUpdate();
////
////            response.sendRedirect("ViewVehicles.jsp");
////        } catch (Exception ex) {
////            ex.printStackTrace();
////        }
//
//    }
//
//}
