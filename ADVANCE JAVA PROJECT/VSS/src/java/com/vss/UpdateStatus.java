package com.vss;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/UpdateStatus")
public class UpdateStatus extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String idStr = request.getParameter("id");
            String status = request.getParameter("status");

            int id = Integer.parseInt(idStr);

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/vss_db",
                    "root",
                    "vaibhavi"
            );

            String query = "UPDATE payments SET status=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, status);
            ps.setInt(2, id);

            ps.executeUpdate();

            con.close();

            response.sendRedirect("viewPayments.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}