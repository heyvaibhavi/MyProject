<%@ page import="java.sql.*" %>
<%@ page import="com.vss.DBConnection" %>

<html>
<head>
    <title>Members</title>

    <style>
        body {
            margin: 0;
            font-family: Arial;
            display: flex;
        }

        .sidebar {
            width: 200px;
            background: #2c3e50;
            color: white;
            height: 100vh;
            padding: 20px;
        }

        .sidebar a {
            display: block;
            color: white;
            text-decoration: none;
            margin: 15px 0;
        }

        .content {
            flex: 1;
            padding: 20px;
            background: #f4f4f4;
        }

        .box {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px gray;
            width: 300px;
        }

        input {
            width: 100%;
            padding: 8px;
            margin: 5px 0;
        }

        button {
            width: 100%;
            padding: 10px;
            background: teal;
            color: white;
            border: none;
        }

        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            background: white;
            box-shadow: 0px 0px 10px gray;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background: teal;
            color: white;
        }

        .delete {
            color: red;
        }

        .update {
            color: green;
        }
    </style>
</head>

<body>

<!-- Sidebar -->
<div class="sidebar">
    <h2>VSS</h2>
    <a href="dashboard.jsp">Dashboard</a>
    <a href="members.jsp">Members</a>
    <a href="complaints.jsp">Complaints</a>
    <a href="payment.jsp">Payments</a>
</div>

<!-- Content -->
<div class="content">

<h2>Members Management</h2>

<div class="box">
    <h3>Add Member</h3>

    <form action="AddMemberServlet" method="post">
        <input type="text" name="name" placeholder="Enter Name" required>
        <input type="text" name="phone" placeholder="Enter Phone" required>
        <button type="submit">Add Member</button>
    </form>
</div>

<h3>Member List</h3>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Phone</th>
        <th>Action</th>
    </tr>

<%
    try {
        Connection con = DBConnection.getConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM members");

        while (rs.next()) {
%>

<tr>
    <td><%= rs.getInt("id") %></td>
    <td><%= rs.getString("name") %></td>
    <td><%= rs.getString("phone") %></td>
    <td>
        <a class="update" href="editMember.jsp?id=<%= rs.getInt("id") %>">Update</a> |
        <a class="delete" href="DeleteMemberServlet?id=<%= rs.getInt("id") %>">Delete</a>
    </td>
</tr>

<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

</table>

</div>

</body>
</html>