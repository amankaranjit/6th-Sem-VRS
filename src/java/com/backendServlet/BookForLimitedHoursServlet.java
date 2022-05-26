package com.backendServlet;

import JDBCConnection.JDBCConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BookForLimitedHoursServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Connection cn = JDBCConnection.getConnection();

        String s_id = request.getParameter("s_id");
        int sedan_id = Integer.parseInt(s_id);

        String user_id = request.getParameter("user_id");
        int u_id = Integer.parseInt(user_id);

        String price = request.getParameter("s_price");
        int s_price = Integer.parseInt(price);

        String s_name = request.getParameter("s_name");

        String pickup_date = request.getParameter("pickup_date");
        String pickup_time = request.getParameter("pickup_time");
        String drop_time = request.getParameter("drop_time");

        String address = request.getParameter("address");

        /*Time calculation start*/
        SimpleDateFormat format = new SimpleDateFormat("HH:mm");
        Date date1;

        String insertQuery = "insert into booking(s_id,u_id,pickup_date,drop_date,no_of_days,b_total_price) values(?,?,?,?,?,?)";
        PreparedStatement stmt;
        try {
            date1 = format.parse(pickup_time);
            Date date2 = format.parse(drop_time);
            long difference = date2.getTime() - date1.getTime();
            long differenceHours = difference / (60 * 60 * 1000) % 24;
            /*Time calculation ends*/
            stmt = cn.prepareStatement(insertQuery);
            stmt.setInt(1, sedan_id);
            stmt.setInt(2, u_id);
            stmt.setString(3, pickup_date);
            stmt.setString(4, pickup_date);
            stmt.setLong(5, 0);
            stmt.setLong(6, (s_price / 12) * differenceHours);
            stmt.execute();
            response.sendRedirect("cartPageforhrs.jsp");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
//        out.println("user id" +u_id);
//        out.println("s_price"+s_price);
//        out.println("s_id"+sedan_id);
//        out.println("pickup date"+pickup_date);
//        out.println("pickup time"+pickup_time);
//        out.println("drop time"+drop_time);
//        out.println("address"+address);

    }
}
