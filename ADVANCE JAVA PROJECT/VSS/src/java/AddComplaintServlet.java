import com.vss.DBConnection;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/AddComplaintServlet")
public class AddComplaintServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String complaint = request.getParameter("complaint");

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO complaints(name, complaint, status) VALUES (?, ?, ?)"
            );

            ps.setString(1, name);
            ps.setString(2, complaint);
            ps.setString(3, "Pending");

            ps.executeUpdate();

            response.sendRedirect("complaints.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}