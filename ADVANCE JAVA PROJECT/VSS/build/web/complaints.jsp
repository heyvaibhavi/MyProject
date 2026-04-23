<%@ page import="java.sql.*" %>
<%@ page import="com.vss.DBConnection" %>

<html>
<head>
    <title>Complaints - VSS</title>

    <style>
        body {
            margin: 0;
            font-family: Arial;
            background: #f4f4f4;
        }

        .container {
            padding: 20px;
        }

        .form-box {
            background: white;
            padding: 20px;
            width: 300px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px gray;
            margin-bottom: 30px;
        }

        input, textarea {
            width: 100%;
            padding: 8px;
            margin: 5px 0;
        }

        button {
            background: #ff4d4d;
            color: white;
            padding: 10px;
            border: none;
            width: 100%;
        }

        table {
            width: 100%;
            background: white;
            border-collapse: collapse;
            box-shadow: 0px 0px 10px gray;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background: #ff4d4d;
            color: white;
        }

        .pending {
            color: orange;
            font-weight: bold;
        }

        .solved {
            color: green;
            font-weight: bold;
        }

        a {
            color: green;
            text-decoration: none;
        }
    </style>
</head>

<body>

<div class="container">

<div class="form-box">
    <h3>Add Complaint</h3>

    <form action="AddComplaintServlet" method="post">

        <!-- ? NAME VALIDATION -->
        <input type="text" name="name"
               placeholder="Enter Name"
               pattern="[A-Za-z ]+"
               title="Only letters allowed"
               required>

        <textarea name="complaint" placeholder="Enter Complaint" required></textarea>

        <button type="submit">Submit</button>
    </form>
</div>

<h3>Complaint List</h3>

<table>
<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Complaint</th>
    <th>Status</th>
    <th>Action</th>
</tr>

<%
    try {
        Connection con = DBConnection.getConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM complaints");

        while (rs.next()) {
            String status = rs.getString("status");
%>

<tr>
    <td><%= rs.getInt("id") %></td>
    <td><%= rs.getString("name") %></td>
    <td><%= rs.getString("complaint") %></td>

    <td class="<%= status.equals("Pending") ? "pending" : "solved" %>">
        <%= status %>
    </td>

    <td>
        <a href="UpdateStatusServlet?id=<%= rs.getInt("id") %>&status=Solved">
            Mark as Solved
        </a>
    </td>
</tr>

<%
        }
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

</table>

</div>

</body>
</html>