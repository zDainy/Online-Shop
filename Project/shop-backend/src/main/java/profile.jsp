<%@page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/profile.css">
    <title>Checkout</title>
</head>
<body>
<div class="header">
    <div class="container box-flex">
        <a class="logo" href="#">rodrina`<span>s</span></a>
        <div class="right">
            <% if (request.getSession(false).getAttribute("login") != null) {
            request.setAttribute("isAuthorized", 1);
            } %>
            <c:if test="${isAuthorized == 1}">
                <a href="cart"><img src="img/ico1.png" alt=""></a>
            </c:if>
            <a href="profile"><img src="img/ico2.png" style="padding-left:30px;" alt=""></a>
        </div>

    </div>
</div>
<div class="container">
    <div class="nav">
        <ul>
            <li><a href="main">Home</a></li>
            <li><a href="product">All products</a></li>
            <li><a href="product?gender=1">Man</a></li>
            <li><a href="product?gender=0">Women</a></li>
            <li><a href="product?cat=ACCESSORIES">Accessories</a></li>
        </ul>
    </div>
</div>

<div class="container flex-1">
    <% if (request.getSession(false).getAttribute("login") != null) {
    request.setAttribute("isAuthorized", 1);
    }
    if (request.getParameter("name") != null) {
    request.setAttribute("name", request.getParameter("name"));
    }
    if (request.getParameter("email") != null) {
    request.setAttribute("email", request.getParameter("email"));
    }
    if (request.getParameter("phone") != null) {
    request.setAttribute("phone", request.getParameter("phone"));
    }
    if (request.getParameter("address") != null) {
    request.setAttribute("address", request.getParameter("address"));
    }%>
    <c:set var="isAuthorized" scope="request" value="${isAuthorized}"/>
    <c:set var="name" scope="session" value="${name}"/>
    <c:set var="email" scope="session" value="${email}"/>
    <c:set var="phone" scope="session" value="${phone}"/>
    <c:set var="address" scope="session" value="${address}"/>
    <c:if test="${isAuthorized == 1}">
        <div class="shipping ">
            <h2>Correct the information</h2>
            <form id="correct" action="profile" method="post">
                <input type="text" class="placeholder" name="name" placeholder="Name" value="${name}">
                <input type="text" class="placeholder" name="phone" placeholder="Phone" value="${phone}">
                <input type="text" class="placeholder" name="address" placeholder="Address" value="${address}">
                <input type="text" class="placeholder" name="email" placeholder="Email" value="${email}">
                <input type="hidden" name="type" value="setInfo">
                <button type="submit" class="box1btn">Set info</button>
            </form>
        </div>
    </c:if>
    <c:if test="${isAuthorized != 1}">
        <div class="shipping">
            <h2>Registration</h2>
            <h3>Create new user</h3>
            <form id="registration" action="profile" method="post">
                <input type="text" class="placeholder" name="login" placeholder="Login*">
                <input type="password" name="password" class="placeholder" placeholder="Password*">
                <input type="hidden" name="type" value="registration">
                <button type="submit" class="box1btn">Register</button>
            </form>
        </div>
        <div class="shipping">
            <h2>Already registed?</h2>
            <h3>Please log in below</h3>
            <form id="login" action="profile" method="post">
                <input type="text" class="placeholder" name="login" placeholder="Login*">
                <input type="password" name="password" class="placeholder" placeholder="Password*">
                <input type="hidden" name="type" value="logIn">
                <button type="submit" class="box1btn">Log in</button>
            </form>
        </div>
    </c:if>
</div>
<div id="footer">
    <div class="container">
        <div class="inf">
            <a class="logo" href="main">rodrina`<span>s</span></a> <br>
            <p>Objectively transition extensive data rather than cross
                functional solutions. Monotonectally syndicate multidisciplinary
                materials before go forward benefits. Intrinsicly syndicate an
                expanded array of processes and cross-unit partnerships.
                <br><br>

                Efficiently plagiarize 24/365 action items and focused infomediaries. <br>
                Distinctively seize superior initiatives for wireless technologies.
                Dynamically optimize.
            </p>
        </div>
        <div class="inf">
            <h6>COMPANY</h6>
            <ul>
                <li><a href="main">Home</a></li>
                <li><a href="product">Shop</a></li>
                <li><a href="profile">Profile</a></li>
            </ul>
        </div>
        <div class="inf">
            <h6>INFORMATION</h6>
            <ul>
                <li><a href="profile">Profile</a></li>
                <li><a href="product">Products</a></li>
            </ul>
        </div>
        <div class="inf">
            <h6>SHOP CATEGORY</h6>
            <ul>
                <li><a href="product?gender=1">Man</a></li>
                <li><a href="product?gender=0">Women</a></li>
                <li><a href="product">Brows All</a></li>
            </ul>
        </div>
    </div>
</div>
<div id="copyrite">
    <div class="container box-flex">
        <a href="#">Copyrite rodrina</a>
        <div class="right">
            <a href="#"><img src="img/facebook.png" alt=""></a>
            <a href="#"><img src="img/pinterest.png" alt=""></a>
            <a href="#"><img src="img/Google.png" alt=""></a>
        </div>
    </div>
</div>
</body>
</html>