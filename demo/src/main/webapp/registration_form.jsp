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
    String user_name = request.getParameter("user_name");
    String gender = request.getParameter("gender");
    String email = request.getParameter("email");
    String phone_number = request.getParameter("phone_number");
    String pass = request.getParameter("pass");
    String reenter = request.getParameter("reenter");
    String dob = request.getParameter("dob");
    String nationality = request.getParameter("nationality");
    String preferences = request.getParameter("preferences");
    String favourite_food = request.getParameter("favourite_food");
    String cuisine = request.getParameter("cuisine");
    String news_letter = request.getParameter("news_letter");
    String gluten_free = request.getParameter("gluten_free");
    String checkQuery = "SELECT COUNT(*) FROM registration_form WHERE email=?";
    String insertQuery = "INSERT INTO registration_form VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    PreparedStatement ps = null;
    try {
        connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
        // Prepare and execute the query to check if the email exists
        ps = connection.prepareStatement(checkQuery);
        ps.setString(1, email);
        ResultSet resultSet = ps.executeQuery();
        resultSet.next(); // Move to the first (and only) row
        int emailCount = resultSet.getInt(1);

        if (emailCount > 0) {
            // Email already exists in the database
            out.print("<p>User with this email already exists.</p>");
        } else {
            // Prepare the SQL statement with parameterized query for inserting user data
            ps = connection.prepareStatement(insertQuery);

            // Set the parameters for the insert query
            ps.setString(1,user_name);
            ps.setString(2, gender);
            ps.setString(3, email);
            ps.setString(4, phone_number);
            ps.setString(5, pass);
            ps.setString(6, reenter);
            ps.setString(7, dob);
            ps.setString(8, nationality);
            ps.setString(9, preferences);
            ps.setString(10, favourite_food);
            ps.setString(11, cuisine);
            ps.setString(12, news_letter);
            ps.setString(13, gluten_free);

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                out.print("<p>Data successfully uploaded</p>");
            } else {
                out.print("<p>Error Message</p>");
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (ps != null) {
            try {
                ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
