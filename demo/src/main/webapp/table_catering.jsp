<%@ page import="java.sql.*, java.util.*,java.lang.*" %>
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
    String date=request.getParameter("date");
    String order_date=request.getParameter("order_date");
    String delivery_method=request.getParameter("delivery_method");
    String name=request.getParameter("name");
    String Date_of_event=request.getParameter("Date_of_event");
    String Event_location=request.getParameter("Event_location");
    String Number_of_guests=request.getParameter("Number_of_guests");
    Connection con=null;
    PreparedStatement ps=null;
    String query="insert into catering values(?,?,?,?,?,?,?)";
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","root");
        ps=con.prepareStatement(query);
        ps.setString(1,date);
        ps.setString(2,order_date);
        ps.setString(3,delivery_method);
        ps.setString(4,name);
        ps.setString(5,Date_of_event);
        ps.setString(6,Event_location);
        ps.setString(7,Number_of_guests);
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