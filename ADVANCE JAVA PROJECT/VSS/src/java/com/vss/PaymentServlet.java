package com.vss;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        double amount = Double.parseDouble(request.getParameter("amount"));
        String status = request.getParameter("status");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/vss_db",
                    "root",
                    "vaibhavi"
            );

            String query = "INSERT INTO payments (name, amount, status) VALUES (?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, name);
            ps.setDouble(2, amount);
            ps.setString(3, status);

            ps.executeUpdate();

            con.close();

            // ✅ redirect to view page
            response.sendRedirect("viewPayments.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // prevent blank page
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect("payment.jsp");
    }
}