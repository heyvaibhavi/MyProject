package com.vss;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/UpdateMemberServlet")
public class UpdateMemberServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "UPDATE members SET name=?, phone=? WHERE id=?"
            );

            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setInt(3, id);

            ps.executeUpdate();

            response.sendRedirect("members.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}