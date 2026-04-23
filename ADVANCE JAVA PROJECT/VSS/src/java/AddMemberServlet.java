package com.vss;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/AddMemberServlet")
public class AddMemberServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String phone = request.getParameter("phone");

        // ✅ REMOVE EXTRA SPACES
        name = name.trim();

        // ✅ VALIDATION
        if (!name.matches("[A-Za-z ]+")) {
            response.getWriter().println("<h3>Invalid Name (Only letters allowed)</h3>");
            return;
        }

        if (!phone.matches("[0-9]{10}")) {
            response.getWriter().println("<h3>Invalid Phone (Enter 10 digits)</h3>");
            return;
        }

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO members(name, phone) VALUES (?, ?)"
            );

            ps.setString(1, name);
            ps.setString(2, phone);

            ps.executeUpdate();

            // ✅ REDIRECT BACK
            response.sendRedirect("members.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}