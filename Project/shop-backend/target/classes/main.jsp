<%@page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@page import="common.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/index.css">
    <title>Магазинчик</title>
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
            <li><a class="active_link" href="main">Home</a></li>
            <li><a href="product">All products</a></li>
            <li><a href="product?gender=1">Man</a></li>
            <li><a href="product?gender=0">Women</a></li>
            <li><a href="product?cat=ACCESSORIES">Accessories</a></li>
        </ul>
    </div>
</div>
<div class="box-1">
    <div class="container">
        <h1>New spring collection</h1>
        <h2>-20%</h2>
        <h3>for women</h3>
        <form method="LINK" action="product">
            <button type="submit" class="box1btn">look at collection</button>
        </form>
    </div>
</div>

<div class="box-2">
    <div class="container">
        <div class="man"><img src="img/forman.png" alt="">
        </div>
        <div class="women"><img src="img/forwom.png" alt="">
        </div>
    </div>
</div>
<div class="box-3">
    <div class="container">
        <h4>Featured Items</h4>
        <h5>Shop for items based on what we featured in this week</h5>
        <div id="left">
            <ul>
                <c:forEach var="product" items="${products}">
                    <li>
                        <div class="img"><a href="#"><img alt="" src="${product.imgSrc}"></a></div>
                        <a class="title" href="#">
                            <c:out value="${product.name}"/>
                        </a>
                        <div class="price">
                            <p>$<c:out value="${product.price}"/>.00</p>
                                <c:if test="${isAuthorized == 1}">
                                <form action="main" method="post" class="prodForm">
                                    <input type="hidden" name="productId" value="${product.id}">
                                    <button type="submit" class="box2btn">Add</button>
                                </form>
                            </c:if>
                        </div>
                    </li>
                </c:forEach>
            </ul>
            <form method="LINK" action="product">
                <button type="submit" class="box3btn">Browse All Product</button>
            </form>
        </div>
    </div>
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