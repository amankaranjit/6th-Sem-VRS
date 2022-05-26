package com.backendServlet;

import JDBCConnection.JDBCConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String form_email = request.getParameter("email");
            String form_pass = request.getParameter("password");

            if (form_email.isEmpty() || form_pass.isEmpty()) {
                request.setAttribute("error", "Field is Empty");
                RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
                rd.include(request, response);
            } else {
                Connection cn = JDBCConnection.getConnection();
                Statement stmt = cn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM admin where email = '" + form_email + "' ");
                if (rs.next()) {
                    String a_email = rs.getString("email");
                    String a_pass = rs.getString("password");
                    String admin_session_name = rs.getString("name");

                    int secret_key = 5;
                    String admin_password = getDecryptedValue(a_pass, secret_key);
                    

                    if ((form_email.equals(a_email)) && (form_pass.equals(admin_password))) {
                        response.sendRedirect("admin.jsp");
                        HttpSession session = request.getSession();
                        session.setAttribute("s_name", admin_session_name);
                    } else {
                        out.println("Error");
                    }

                } else {
                    out.println("Error");
                }
            }

        } catch (Exception e) {
        }
    }

    private String getDecryptedValue(String pass, int secret_key) {
        String decrypted = "";
        for (int i = 0; i < pass.length(); i++) {
            char ch = pass.charAt(i);
            ch -= secret_key;
            decrypted = decrypted + ch;
        }
        return decrypted;
    }
}