package com.backendServlet;

import JDBCConnection.JDBCConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class manageUserServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Connection cn = JDBCConnection.getConnection();
            String operation = request.getParameter("operation");
//            String name = request.getParameter("name");
            Statement stmt = cn.createStatement();
            ResultSet rs = stmt.executeQuery("Select * from users");
            while (rs.next()) {
                int id = rs.getInt("id");
//                String name = rs.getString("name");

                if (operation.equals("delete")) {
                    String query = "delete from users where id=?"  ;
                    PreparedStatement preparedStmt = cn.prepareStatement(query);
                    preparedStmt.setInt(1, id);
                    // execute the preparedstatement
                    preparedStmt.execute();

                } else if (operation.equals("update")) {
                    System.out.println("update");
                } else {
                }
            }
        } catch (Exception e) {
        }

    }

}
