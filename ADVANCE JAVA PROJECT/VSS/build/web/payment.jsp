<%@ page import="java.sql.*" %>
<%@ page import="com.vss.DBConnection" %>

<html>
<head>
    <title>Payment - VSS</title>

    <style>
        body {
            margin: 0;
            font-family: Arial;
            background: linear-gradient(to right, #667eea, #764ba2);
        }

        .container {
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 30px;
        }

        .form-box {
            background: white;
            padding: 25px;
            border-radius: 12px;
            width: 320px;
            box-shadow: 0px 5px 15px rgba(0,0,0,0.3);
            text-align: center;
            margin-bottom: 30px;
        }

        h2 {
            margin-bottom: 15px;
        }

        input {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        button {
            width: 100%;
            padding: 10px;
            background: #667eea;
            color: white;
            border: none;
            border-radius: 5px;
            margin-top: 10px;
        }

        button:hover {
            background: #5a67d8;
        }

        table {
            width: 80%;
            background: white;
            border-collapse: collapse;
            box-shadow: 0px 5px 15px rgba(0,0,0,0.3);
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background: #667eea;
            color: white;
        }
    </style>
</head>

<body>

<div class="container">

<div class="form-box">
    <h2>Add Payment</h2>

    <form action="PaymentServlet" method="post">

        <input type="text" name="name" placeholder="Enter Name" required>

        <!-- ? NO NEGATIVE ALLOWED -->
        <input type="number" name="amount" placeholder="Enter Amount"
               min="1"
               onkeypress="return event.key !== '-'"
               required>

        <button type="submit">Add Payment</button>
    </form>
</div>

<h2>Payment List</h2>

<table>
<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Amount</th>
    <th>Date</th>
</tr>

<%
    try {
        Connection con = DBConnection.getConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM payments");

        while (rs.next()) {
%>

<tr>
    <td><%= rs.getInt("id") %></td>
    <td><%= rs.getString("name") %></td>
    <td><%= rs.getDouble("amount") %></td>
    <td><%= rs.getString("date") %></td>
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