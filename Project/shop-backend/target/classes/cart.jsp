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
    <link rel="stylesheet" href="css/single.css">
    <title>Shopping card</title>
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
<section>
    <div class="container box-flex">
        <h1>new arrivals</h1>
        <nav>
            <ul>
                <li><a href="main">home</a>/</li>
                <li><a href="product">All products</a></li>
            </ul>
        </nav>
    </div>
</section>
<div class="container box-flex">
    <h2>product details</h2>
    <div class="zag">
        <h2>price</h2>
        <h2>size</h2>
        <h2>category</h2>
        <h2>shipping</h2>
        <h2>action</h2>
    </div>
</div>
<c:forEach var="product" items="${products}">
    <div class="container zag">
        <div class="strip zag">
            <img class="product" src="${product.imgSrc}" alt="">
            <div class="info">
                <h2>
                    <c:out value="${product.name}"/>
                </h2>
            </div>
        </div>
        <div class="strip box-flex wid-1 ">
            <div class="zag">
                <h3 id="price">$<c:out value="${product.price}"/>.00
                </h3>
                <h3 id="size">
                    <c:out value="${product.size}"/>
                </h3>
                <h3 id="category">
                    <c:out value="${product.category}"/>
                </h3>
                <h3 id="shipping">free</h3>
                <a id="no" href="cart?action=remove&id=${product.id}">X</a>
            </div>
        </div>
    </div>
</c:forEach>
<div class="container">
    <div class="buttons flex-1">
        <form method="post" action="cart?action=clear" >
            <button type="submit" class="box1btn">clear shopping cart</button>
        </form>
        <form method="get" action="product">
            <button type="submit" class="box1btn">continue shopping</button>
        </form>
    </div>
</div>
<div class="container">
    <div class="buttons notFlex">
        <div>
            <h1>total price</h1>
            <h5 id="total">$<c:out value="${price}"/>.00
            </h5>
            <form method="post" action="cart?action=continue">
                <button type="submit" class="box1btn">proceed to checkout</button>
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