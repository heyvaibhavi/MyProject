import com.vss.DBConnection;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/UpdateStatusServlet")
public class UpdateStatusServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "UPDATE complaints SET status=? WHERE id=?"
            );

            ps.setString(1, "Solved");
            ps.setInt(2, id);

            ps.executeUpdate();

            response.sendRedirect("complaints.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}