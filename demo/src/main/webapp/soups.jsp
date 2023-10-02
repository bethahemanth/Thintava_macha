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
    <a target="_blank" href="___1.webp" class="for_img">
      <img src="___1.webp" alt="The sweet potato soup">
    </a>
    <div class="desc">
      <p class="rupees">The sweet potato soup ₹300</p>
      <form action="soups.jsp" method="post">
        <input type="hidden" name="itemName" value="The sweet potato soup">
        <input type="hidden" name="itemPrice" value="300">
        <button type="submit" style="height:22px;width:30px" class="add" name="submit">Add</button>
      </form>
    </div>
  </div>
</div>
<div class="responsive">
  <div class="gallery clearfix">
    <a target="_blank" href="___2.webp" class="for_img">
      <img src="___2.webp" alt="Broccoli soup">
    </a>
    <div class="desc">
      <p class="rupees">Broccoli soup ₹120</p>
      <form action="soups.jsp" method="post">
        <input type="hidden" name="itemName" value="Broccoli soup">
        <input type="hidden" name="itemPrice" value="120">
        <button type="submit" style="height:22px;width:30px" class="add" name="submit">Add</button>
      </form>
    </div>
  </div>
</div>
<div class="responsive">
  <div class="gallery clearfix">
    <a target="_blank" href="___3.webp" class="for_img">
      <img src="___3.webp" alt="Barley soup">
    </a>
    <div class="desc">
      <p class="rupees">Barley soup ₹220</p>
      <form action="soups.jsp" method="post">
        <input type="hidden" name="itemName" value="Barley soup">
        <input type="hidden" name="itemPrice" value="220">
        <button type="submit" style="height:22px;width:30px" name="submit" class="add">Add</button>
      </form>    </div>
  </div>
</div>
<div class="responsive">
  <div class="gallery clearfix">
    <a target="_blank" href="___4.webp" class="for_img">
      <img src="___4.webp" alt="manchow momo soup">
    </a>
    <div class="desc">
      <p class="rupees">manchow momo soup₹340</p>
      <form action="soups.jsp" method="post">
        <input type="hidden" name="itemName" value="manchow momo soup">
        <input type="hidden" name="itemPrice" value="340">
        <button type="submit" style="height:22px;width:30px" name="submit" class="add">Add</button>
      </form>    </div>
  </div>
</div>
<div class="responsive">
  <div class="gallery clearfix">
    <a target="_blank" href="___5.webp" class="for_img">
      <img src="___5.webp" alt="beetroot chicken soup">
    </a>
    <div class="desc">
      <p class="rupees">beetroot chicken soup ₹290</p>
      <form action="soups.jsp" method="post">
        <input type="hidden" name="itemName" value="beetroot chicken soup">
        <input type="hidden" name="itemPrice" value="290">
        <button type="submit" style="height:22px;width:30px" name="submit" class="add">Add</button>
      </form>
    </div>
  </div>
</div>
<div class="responsive">
  <div class="gallery clearfix">
    <a target="_blank" href="___6.webp" class="for_img">
      <img src="___6.webp" alt="Dal pithi">
    </a>
    <div class="desc">
      <p class="rupees">Dal pithi ₹390</p>
      <form action="soups.jsp" method="post">
        <input type="hidden" name="itemName" value="Dal pithi">
        <input type="hidden" name="itemPrice" value="390">
        <button type="submit" style="height:22px;width:30px" name="submit" class="add">Add</button>
      </form>    </div>
  </div>
</div>
<div class="responsive">
  <div class="gallery clearfix">
    <a target="_blank" href="___7.webp" class="for_img">
      <img src="___7.webp" alt="shubz badam ka shorba">
    </a>
    <div class="desc">
      <p class="rupees">shubz badam ka shorba ₹140</p>
      <form action="soups.jsp" method="post">
        <input type="hidden" name="itemName" value="shubz badam ka shorba">
        <input type="hidden" name="itemPrice" value="140">
        <button type="submit" style="height:22px;width:30px" name="submit" class="add">Add</button>
      </form>    </div>
  </div>
</div>
<div class="responsive">
  <div class="gallery clearfix">
    <a target="_blank" href="___8.jpg" class="for_img">
      <img src="___8.jpg" alt="Seb aur Baadam ka shobra">
    </a>
    <div class="desc">
      <p class="rupees">Seb aur Baadam ka shobra ₹340</p>
      <form action="soups.jsp" method="post">
        <input type="hidden" name="itemName" value="Seb aur Baadam ka shobra">
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