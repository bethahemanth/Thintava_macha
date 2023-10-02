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
    <a target="_blank" href="_1.jpg" class="for_img">
      <img src="_1.jpg" alt="Beef tenderloin">
    </a>
    <div class="desc">
      <p class="rupees">Beef tenderloin ₹300</p>
      <form action="maincourse.jsp" method="post">
        <input type="hidden" name="itemName" value="Beef tenderloin">
        <input type="hidden" name="itemPrice" value="300">
        <button type="submit" style="height:22px;width:30px" class="add" name="submit">Add</button>
      </form>
    </div>
  </div>
</div>
<div class="responsive">
  <div class="gallery clearfix">
    <a target="_blank" href="_2.jpg" class="for_img">
      <img src="_2.jpg" alt="pan seared salmon">
    </a>
    <div class="desc">
      <p class="rupees">pan seared salmon ₹120</p>
      <form action="maincourse.jsp" method="post">
        <input type="hidden" name="itemName" value="pan seared salmon">
        <input type="hidden" name="itemPrice" value="120">
        <button type="submit" style="height:22px;width:30px" class="add" name="submit">Add</button>
      </form>
    </div>
  </div>
</div>
<div class="responsive">
  <div class="gallery clearfix">
    <a target="_blank" href="_3.jpg" class="for_img">
      <img src="_3.jpg" alt="Chicken lentils">
    </a>
    <div class="desc">
      <p class="rupees">Chicken lentils ₹220</p>
      <form action="maincourse.jsp" method="post">
        <input type="hidden" name="itemName" value="Chicken lentils">
        <input type="hidden" name="itemPrice" value="220">
        <button type="submit" style="height:22px;width:30px" name="submit" class="add">Add</button>
      </form>    </div>
  </div>
</div>
<div class="responsive">
  <div class="gallery clearfix">
    <a target="_blank" href="_4.jpg" class="for_img">
      <img src="_4.jpg" alt="fillet of beef">
    </a>
    <div class="desc">
      <p class="rupees">fillet of beef ₹340</p>
      <form action="maincourse.jsp" method="post">
        <input type="hidden" name="itemName" value="fillet of beef">
        <input type="hidden" name="itemPrice" value="340">
        <button type="submit" style="height:22px;width:30px" name="submit" class="add">Add</button>
      </form>    </div>
  </div>
</div>
<div class="responsive">
  <div class="gallery clearfix">
    <a target="_blank" href="_5.jpg" class="for_img">
      <img src="_5.jpg" alt="vegan mushroom">
    </a>
    <div class="desc">
      <p class="rupees">vegan mushroom ₹290</p>
      <form action="maincourse.jsp" method="post">
        <input type="hidden" name="itemName" value="vegan mushroom">
        <input type="hidden" name="itemPrice" value="290">
        <button type="submit" style="height:22px;width:30px" name="submit" class="add">Add</button>
      </form>
    </div>
  </div>
</div>
<div class="responsive">
  <div class="gallery clearfix">
    <a target="_blank" href="_6.jpg" class="for_img">
      <img src="_6.jpg" alt="lemon and butter chicken">
    </a>
    <div class="desc">
      <p class="rupees">lemon and butter chicken ₹390</p>
      <form action="maincourse.jsp" method="post">
        <input type="hidden" name="itemName" value="lemon and butter chicken">
        <input type="hidden" name="itemPrice" value="390">
        <button type="submit" style="height:22px;width:30px" name="submit" class="add">Add</button>
      </form>    </div>
  </div>
</div>
<div class="responsive">
  <div class="gallery clearfix">
    <a target="_blank" href="_7.jpg" class="for_img">
      <img src="_7.jpg" alt="beef fillet">
    </a>
    <div class="desc">
      <p class="rupees">beef fillet ₹140</p>
      <form action="maincourse.jsp" method="post">
        <input type="hidden" name="itemName" value="beef fillet">
        <input type="hidden" name="itemPrice" value="140">
        <button type="submit" style="height:22px;width:30px" name="submit" class="add">Add</button>
      </form>    </div>
  </div>
</div>
<div class="responsive">
  <div class="gallery clearfix">
    <a target="_blank" href="_8.jpg" class="for_img">
      <img src="_8.jpg" alt="tuscan chicken">
    </a>
    <div class="desc">
      <p class="rupees">tuscan chicken ₹340</p>
      <form action="maincourse.jsp" method="post">
        <input type="hidden" name="itemName" value="tuscan chicken">
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