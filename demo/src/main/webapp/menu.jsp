<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title id="title">India Spice Haven</title>
    <link rel="icon" type="image/x-icon" href="food_order_logo.png">
    <link rel="stylesheet" href="menu.css">
</head>
<body>
<div class="nav">
    <a href="menu.jsp">Appetizers</a>
    <a href="maincourse.jsp">Main course</a>
    <a href="deserts.jsp">Deserts</a>
    <a href="soups.jsp">Soups</a>
</div>
<br>
<div class="responsive">
    <div class="gallery clearfix">
        <a target="_blank" href="food_img_1.jpg" class="for_img">
            <img src="food_img_1.jpg" alt="samosa">
        </a>
        <div class="desc">
            <p class="rupees">Samosa ₹30</p>
            <form action="menu.jsp" method="post">
                <input type="hidden" name="itemName" value="Samosa">
                <input type="hidden" name="itemPrice" value="30">
                <button type="submit" style="height:22px;width:30px" class="add" name="submit">Add</button>
            </form>
        </div>
    </div>
</div>
<div class="responsive">
    <div class="gallery clearfix">
        <a target="_blank" href="food_img_2.jpg" class="for_img">
            <img src="food_img_2.jpg" alt="Mexican balls">
        </a>
        <div class="desc">
            <p class="rupees">Mexican balls ₹120</p>
            <form action="menu.jsp" method="post">
                <input type="hidden" name="itemName" value="Mexican balls">
                <input type="hidden" name="itemPrice" value="120">
                <button type="submit" style="height:22px;width:30px" class="add" name="submit">Add</button>
            </form>
        </div>
    </div>
</div>
<div class="responsive">
    <div class="gallery clearfix">
        <a target="_blank" href="food_img_3.jpg" class="for_img">
            <img src="food_img_3.jpg" alt="Caprese salad">
        </a>
        <div class="desc">
            <p class="rupees">Caprese salad ₹220</p>
            <form action="menu.jsp" method="post">
                <input type="hidden" name="itemName" value="Caprese salad">
                <input type="hidden" name="itemPrice" value="220">
                <button type="submit" style="height:22px;width:30px" name="submit" class="add">Add</button>
            </form>    </div>
    </div>
</div>
<div class="responsive">
    <div class="gallery clearfix">
        <a target="_blank" href="food_img_4.jpg" class="for_img">
            <img src="food_img_4.jpg" alt="Shrimp cucumber crackers">
        </a>
        <div class="desc">
            <p class="rupees">Shrimp cucumber crackers ₹340</p>
            <form action="menu.jsp" method="post">
                <input type="hidden" name="itemName" value="Shrimp cucumber crackers">
                <input type="hidden" name="itemPrice" value="340">
                <button type="submit" style="height:22px;width:30px" name="submit" class="add">Add</button>
            </form>    </div>
    </div>
</div>
<div class="responsive">
    <div class="gallery clearfix">
        <a target="_blank" href="food_img_5.png" class="for_img">
            <img src="food_img_5.png" alt="fruit charcuteirie board">
        </a>
        <div class="desc">
            <p class="rupees">fruit charcuteirie board ₹290</p>
            <form action="menu.jsp" method="post">
                <input type="hidden" name="itemName" value="fruit charcuteirie board">
                <input type="hidden" name="itemPrice" value="290">
                <button type="submit" style="height:22px;width:30px" name="submit" class="add">Add</button>
            </form>
        </div>
    </div>
</div>
<div class="responsive">
    <div class="gallery clearfix">
        <a target="_blank" href="food_img_6.png" class="for_img">
            <img src="food_img_6.png" alt="hot spanish artichoke dip">
        </a>
        <div class="desc">
            <p class="rupees">hot spanish artichoke dip ₹390</p>
            <form action="menu.jsp" method="post">
                <input type="hidden" name="itemName" value="hot spanish artichoke dip">
                <input type="hidden" name="itemPrice" value="390">
                <button type="submit" style="height:22px;width:30px" name="submit" class="add">Add</button>
            </form>    </div>
    </div>
</div>
<div class="responsive">
    <div class="gallery clearfix">
        <a target="_blank" href="food_img_7.png" class="for_img">
            <img src="food_img_7.png" alt="teriyaki pineapple meat balls">
        </a>
        <div class="desc">
            <p class="rupees">teriyaki pineapple meat balls ₹140</p>
            <form action="menu.jsp" method="post">
                <input type="hidden" name="itemName" value="teriyaki pineapple meat balls">
                <input type="hidden" name="itemPrice" value="140">
                <button type="submit" style="height:22px;width:30px" name="submit" class="add">Add</button>
            </form>    </div>
    </div>
</div>
<div class="responsive">
    <div class="gallery clearfix">
        <a target="_blank" href="food_img_8.png" class="for_img">
            <img src="food_img_8.png" alt="savory part bread">
        </a>
        <div class="desc">
            <p class="rupees">savory part bread ₹340</p>
            <form action="menu.jsp" method="post">
                <input type="hidden" name="itemName" value="savory part bread">
                <input type="hidden" name="itemPrice" value="340">
                <button type="submit" style="height:22px;width:30px" name="submit" class="add">Add</button>
            </form>    </div>
    </div>
</div>

<%
    Connection conn = null;
    if (request.getParameter("submit") != null) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db", "root", "root");

            String itemName = request.getParameter("itemName");
            String itemPrice = request.getParameter("itemPrice");

            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO hemanth (name,price) VALUES (?, ?)");
            pstmt.setString(1, itemName);
            pstmt.setString(2, itemPrice);

            pstmt.executeUpdate();

            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
</body>
</html>