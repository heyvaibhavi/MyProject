<%@ page import="java.sql.*" %>

<html>
<head>
    <title>View Payments</title>

    <style>
        body {
            font-family: Arial;
            background: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        h2 {
            text-align: center;
        }

        table {
            width: 80%;
            margin: auto;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 0 10px gray;
        }

        th, td {
            padding: 10px;
            text-align: center;
        }

        th {
            background: #667eea;
            color: white;
        }

        tr:nth-child(even) {
            background: #f2f2f2;
        }

        a {
            padding: 5px 10px;
            text-decoration: none;
            border-radius: 5px;
            color: white;
        }

        .paid {
            background: green;
        }

        .delete {
            background: red;
        }

        .top-link {
            text-align: center;
            margin-bottom: 15px;
        }
    </style>
</head>

<body>

<div class="top-link">
    <a href="payment.jsp" style="background:#667eea;">Add Payment</a>
</div>

<h2>All Payments</h2>

<table>
<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Amount</th>
    <th>Status</th>
    <th>Action</th>
</tr>

<%
    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/vss_db",
        "root",
        "vaibhavi"
    );

    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM payments");

    while(rs.next()) {
%>

<tr>
    <td><%= rs.getInt("id") %></td>
    <td><%= rs.getString("name") %></td>
    <td><%= rs.getDouble("amount") %></td>
    <td><%= rs.getString("status") %></td>

    <td>
        <a class="paid" href="UpdateStatus?id=<%= rs.getInt("id") %>&status=Paid">Paid</a>
        <a class="delete" href="DeletePayment?id=<%= rs.getInt("id") %>"
           onclick="return confirm('Delete this payment?');">Delete</a>
    </td>
</tr>

<%
    }
    con.close();
%>

</table>

</body>
</html>