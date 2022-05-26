package com.backend.EmailSender;

import JDBCConnection.JDBCConnection;
import com.helper.EmailSender;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MailSenderServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            Connection conn = JDBCConnection.getConnection();

            String userid = request.getParameter("id");
            int id = Integer.parseInt(userid);

            Statement stmt;

            try {
                stmt = conn.createStatement();
                String query = "select * from booking join users on booking.u_id = users.id join sedan on booking.s_id = sedan.s_id join category on sedan.c_id = category.id where booking.b_id = '" + id + "'";
                PreparedStatement preparedstmt;
                preparedstmt = conn.prepareStatement(query);
                ResultSet rs = stmt.executeQuery(query);
                while (rs.next()) {
                    int sedan_id = rs.getInt("booking.s_id");
                    String email = rs.getString("users.email");
                    String fullName = rs.getString("users.name");                    
                    int totalPrice = rs.getInt("booking.b_total_price");
                    int totalDays = rs.getInt("booking.no_of_days");
                    String datein = rs.getString("booking.pickup_date");
                    String dateout = rs.getString("booking.drop_date");
                    String category = rs.getString("category.name");
                    final String emailSubject = "Booking accepted!!!";
                    final String emailMessage = "<p>Hi <b>" + fullName + "</b>,</p><br/>Your vehicle <b>"+"</b>("+category+") have been successfully booked for <b>" + totalDays + "</b> days at <b>Rs." + totalPrice + "</b>. Your Check in date is <b>" + datein + "</b> after 12PM and Check out date is <b>" + dateout + "</b> before 11:30 AM. ";
                    boolean status;
                    status = EmailSender.sendMail(email, emailSubject, emailMessage);
                    if (status == true) {
                        stmt.executeUpdate("update booking, sedan set booking.b_status = 1, sedan.s_status = 1 where booking.s_id = sedan.s_id  and booking.b_id= '" + id + "'");
                        response.sendRedirect("Pending.jsp");
                    }

                }

            } catch (SQLException ex) {
                Logger.getLogger(MailSenderServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
    }

}