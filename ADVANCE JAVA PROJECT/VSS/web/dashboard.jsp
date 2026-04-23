<%@ page import="java.sql.*" %>
<%@ page import="com.vss.DBConnection" %>

<html>
<head>
    <title>VSS Dashboard</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        body {
            margin: 0;
            font-family: Arial;
            background: #f4f6f9;
        }

        .navbar {
            background: #ff4d4d;
            color: white;
            padding: 15px;
            font-size: 20px;
        }

        .container {
            padding: 40px;
            text-align: center;
        }

        .card {
            display: inline-block;
            width: 220px;
            height: 170px;
            margin: 20px;
            background: white;
            border-radius: 12px;
            box-shadow: 0px 5px 15px rgba(0,0,0,0.2);
            text-align: center;
            padding-top: 25px;
        }

        .card i {
            font-size: 30px;
            color: #ff4d4d;
            margin-bottom: 10px;
        }

        .card h3 {
            margin: 5px 0;
        }

        .count {
            font-size: 28px;
            font-weight: bold;
            margin-top: 10px;
            color: #333;
        }

        .card a {
            text-decoration: none;
            color: black;
        }
    </style>
</head>

<body>

<div class="navbar">
    VSS - Vaibhavi Society System
</div>

<div class="container">

<%
    int mcount = 0;
    int ccount = 0;
    int pcount = 0;

    Connection con = null;

    try {
        con = DBConnection.getConnection();
        Statement st = con.createStatement();

        // Members count
        ResultSet rs1 = st.executeQuery("SELECT COUNT(*) FROM members");
        if (rs1.next()) {
            mcount = rs1.getInt(1);
        }

        // Complaints count
        ResultSet rs2 = st.executeQuery("SELECT COUNT(*) FROM complaints");
        if (rs2.next()) {
            ccount = rs2.getInt(1);
        }

        // Payments count
        ResultSet rs3 = st.executeQuery("SELECT COUNT(*) FROM payments");
        if (rs3.next()) {
            pcount = rs3.getInt(1);
        }

        con.close(); // ? IMPORTANT

    } catch (Exception e) {
        e.printStackTrace();
    }
%>

    <!-- MEMBERS -->
    <div class="card">
        <a href="members.jsp">
            <i class="fa fa-users"></i>
            <h3>Members</h3>
            <div class="count"><%= mcount %></div>
        </a>
    </div>

   
    <div class="card">
        <a href="complaints.jsp">
            <i class="fa fa-exclamation-circle"></i>
            <h3>Complaints</h3>
            <div class="count"><%= ccount %></div>
        </a>
    </div>

  
    <div class="card">
        <a href="payment.jsp">
            <i class="fa fa-credit-card"></i>
            <h3>Payments</h3>
            <div class="count"><%= pcount %></div>
        </a>
    </div>

</div>

</body>
</html>