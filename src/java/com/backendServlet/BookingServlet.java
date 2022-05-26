 package com.backendServlet;

import JDBCConnection.JDBCConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BookingServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Connection cn = JDBCConnection.getConnection();
        String u_id = request.getParameter("user_id");
        int user_id = Integer.parseInt(u_id);
        String sedan_id = request.getParameter("s_id");
        int s_id = Integer.parseInt(sedan_id);
        String pickup_date = request.getParameter("pickup_date");
        String drop_date = request.getParameter("drop_date");
        String price = request.getParameter("s_price");
        int s_price = Integer.parseInt(price);

//        
        LocalDate p_date = LocalDate.parse(pickup_date);
        LocalDate d_date = LocalDate.parse(drop_date);

//        Calculating no of days
        long difference = ChronoUnit.DAYS.between(p_date, d_date) + 1;
        int total_price = (int) (difference * s_price);

        String insertQuery = "insert into booking(s_id,u_id,pickup_date,drop_date,no_of_days,b_total_price) values(?,?,?,?,?,?)";
        PreparedStatement stmt;
        try {
            stmt = cn.prepareStatement(insertQuery);
            stmt.setInt(1, s_id);
            stmt.setInt(2, user_id);
            stmt.setString(3, pickup_date);
            stmt.setString(4, drop_date);
            stmt.setLong(5, difference);
            stmt.setInt(6, total_price);
            stmt.execute();
            response.sendRedirect("CartPage.jsp");
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }
}
