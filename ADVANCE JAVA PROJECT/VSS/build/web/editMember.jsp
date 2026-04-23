<%@ page import="java.sql.*" %>
<%@ page import="com.vss.DBConnection" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));

    Connection con = DBConnection.getConnection();
    PreparedStatement ps = con.prepareStatement("SELECT * FROM members WHERE id=?");
    ps.setInt(1, id);

    ResultSet rs = ps.executeQuery();
    rs.next();
%>

<html>
<head>
    <title>Edit Member</title>

    <style>
        body {
            font-family: Arial;
            background: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .box {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px gray;
            width: 300px;
        }

        input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
        }

        button {
            width: 100%;
            padding: 10px;
            background: teal;
            color: white;
            border: none;
        }
    </style>
</head>

<body>

<div class="box">
    <h3>Update Member</h3>

    <form action="UpdateMemberServlet" method="post">

        <input type="hidden" name="id" value="<%= rs.getInt("id") %>">

        Name:
        <input type="text" name="name" value="<%= rs.getString("name") %>" required>

        Phone:
        <input type="text" name="phone" value="<%= rs.getString("phone") %>" required>

        <button type="submit">Update</button>
    </form>
</div>

</body>
</html>