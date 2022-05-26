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

/**
 *
 * @author Aman Karanjit
 */
public class DeleteCatServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int i = 0;
        PrintWriter out = response.getWriter();
        try {
            Connection cn = JDBCConnection.getConnection();
            String c_name = request.getParameter("c_name");
            out.println("Delete "+c_name);
//            PreparedStatement stmt = cn.prepareStatement("DELETE from category where name=?");
//            stmt.setString(1, c_name);
//            i = stmt.executeUpdate();
//            RequestDispatcher rd = request.getRequestDispatcher("ResponseAddCategory.jsp");
//            rd.include(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
