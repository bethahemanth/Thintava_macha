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
    <a target="_blank" href="__1.webp" class="for_img">
      <img src="__1.webp" alt="Chocolate molten cake">
    </a>
    <div class="desc">
      <p class="rupees">Chocolate molten cake ₹300</p>
      <form action="deserts.jsp" method="post">
        <input type="hidden" name="itemName" value="Chocolate molten cake">
        <input type="hidden" name="itemPrice" value="300">
        <button type="submit" style="height:22px;width:30px" class="add" name="submit">Add</button>
      </form>
    </div>
  </div>
</div>
<div class="responsive">
  <div class="gallery clearfix">
    <a target="_blank" href="__2.webp" class="for_img">
      <img src="__2.webp" alt="salted choclate">
    </a>
    <div class="desc">
      <p class="rupees">salted choclate ₹120</p>
      <form action="deserts.jsp" method="post">
        <input type="hidden" name="itemName" value="salted choclate">
        <input type="hidden" name="itemPrice" value="120">
        <button type="submit" style="height:22px;width:30px" class="add" name="submit">Add</button>
      </form>
    </div>
  </div>
</div>
<div class="responsive">
  <div class="gallery clearfix">
    <a target="_blank" href="__3.webp" class="for_img">
      <img src="__3.webp" alt="No bake pb&j cheese cake">
    </a>
    <div class="desc">
      <p class="rupees">No bake pb&j cheese cake ₹220</p>
      <form action="deserts.jsp" method="post">
        <input type="hidden" name="itemName" value="No bake pb&j cheese cake">
        <input type="hidden" name="itemPrice" value="220">
        <button type="submit" style="height:22px;width:30px" name="submit" class="add">Add</button>
      </form>    </div>
  </div>
</div>
<div class="responsive">
  <div class="gallery clearfix">
    <a target="_blank" href="__4.webp" class="for_img">
      <img src="__4.webp" alt="chocolate truffle">
    </a>
    <div class="desc">
      <p class="rupees">fillet of beef ₹340</p>
      <form action="deserts.jsp" method="post">
        <input type="hidden" name="itemName" value="chocolate truffle">
        <input type="hidden" name="itemPrice" value="340">
        <button type="submit" style="height:22px;width:30px" name="submit" class="add">Add</button>
      </form>    </div>
  </div>
</div>
<div class="responsive">
  <div class="gallery clearfix">
    <a target="_blank" href="__5.webp" class="for_img">
      <img src="__5.webp" alt="treacle tart">
    </a>
    <div class="desc">
      <p class="rupees">treacle tart ₹290</p>
      <form action="deserts.jsp" method="post">
        <input type="hidden" name="itemName" value="treacle tart">
        <input type="hidden" name="itemPrice" value="290">
        <button type="submit" style="height:22px;width:30px" name="submit" class="add">Add</button>
      </form>
    </div>
  </div>
</div>
<div class="responsive">
  <div class="gallery clearfix">
    <a target="_blank" href="__6.webp" class="for_img">
      <img src="__6.webp" alt="peach melba pie">
    </a>
    <div class="desc">
      <p class="rupees">peach melba pie ₹390</p>
      <form action="deserts.jsp" method="post">
        <input type="hidden" name="itemName" value="peach melba pie">
        <input type="hidden" name="itemPrice" value="390">
        <button type="submit" style="height:22px;width:30px" name="submit" class="add">Add</button>
      </form>    </div>
  </div>
</div>
<div class="responsive">
  <div class="gallery clearfix">
    <a target="_blank" href="__7.webp" class="for_img">
      <img src="__7.webp" alt="easy cornflakes tart">
    </a>
    <div class="desc">
      <p class="rupees">easy cornflakes tart ₹140</p>
      <form action="deserts.jsp" method="post">
        <input type="hidden" name="itemName" value="easy cornflakes tart">
        <input type="hidden" name="itemPrice" value="140">
        <button type="submit" style="height:22px;width:30px" name="submit" class="add">Add</button>
      </form>    </div>
  </div>
</div>
<div class="responsive">
  <div class="gallery clearfix">
    <a target="_blank" href="__8.webp" class="for_img">
      <img src="__8.webp" alt="floating islands">
    </a>
    <div class="desc">
      <p class="rupees">floating islands ₹340</p>
      <form action="deserts.jsp" method="post">
        <input type="hidden" name="itemName" value="floating islands">
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