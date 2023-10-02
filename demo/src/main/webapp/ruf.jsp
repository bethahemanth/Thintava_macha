<%@ page import="java.sql.*" %>
<%
    String jdbcUrl = "jdbc:mysql://localhost:3306/db";
    String dbUser = "root";
    String dbPassword = "root";

    Connection connection = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
        out.println("Connected successfully!");

    } catch (Exception e) {
        e.printStackTrace();
        e.getMessage();
    }
%>
<%
    String vehicle1 = request.getParameter("vehicle1");
    String insertQuery = "INSERT INTO ruf VALUES (?)";

    PreparedStatement ps = null;
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","root");
        ps=con.prepareStatement(query);
        ps.setString(1,vehicle1);
        int i=ps.executeUpdate();
        if(i>0)
        {
            out.print("<p>Data successfully uploaded</p> ");
        }
        else {
            out.print("<p>Error Message</p>");
        }
    }
    catch (Exception e)
    {
        out.print(e);
    }

%>
