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
    <link rel="stylesheet" href="css/product.css">
    <link rel="stylesheet" href="js/main.js">
    <title>Product</title>
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
            <% if (request.getParameter("gender") != null) {
                request.setAttribute("gender", request.getParameter("gender"));
            }
               if (request.getParameter("cat") != null) {
                request.setAttribute("category", request.getParameter("cat"));
            } %>
            <c:set var="gender" scope="request" value="${gender}"/>
            <c:set var="category" scope="request" value="${category}"/>
            <c:choose>
                <c:when test="${gender == 1}">
                    <li><a href="product">All products</a></li>
                    <li><a class="active_link" href="product?gender=1">Man</a></li>
                    <li><a href="product?gender=0">Women</a></li>
                    <li><a href="product?cat=ACCESSORIES">Accessories</a></li>
                </c:when>
                <c:when test="${gender == 0}">
                    <li><a href="product">All products</a></li>
                    <li><a href="product?gender=1">Man</a></li>
                    <li><a class="active_link" href="product?gender=0">Women</a></li>
                    <li><a href="product?cat=ACCESSORIES">Accessories</a></li>
                </c:when>
                <c:when test="${category == 'ACCESSORIES'}">
                    <li><a href="product">All products</a></li>
                    <li><a href="product?gender=1">Man</a></li>
                    <li><a href="product?gender=0">Women</a></li>
                    <li><a class="active_link" href="product?cat=ACCESSORIES">Accessories</a></li>
                </c:when>
                <c:otherwise>
                    <li><a class="active_link" href="product">All products</a></li>
                    <li><a href="product?gender=1">Man</a></li>
                    <li><a href="product?gender=0">Women</a></li>
                    <li><a href="product?cat=ACCESSORIES">Accessories</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</div>
<section>
    <div class="container box-flex">
        <h1>new arrivals</h1>
        <nav>
            <ul>
                <li><a href="main">home</a>/</li>
                <li><a class="active" href="product">All products</a></li>
            </ul>
        </nav>
    </div>
</section>
<div class="container flexand">
    <div class="one">
        <div class="spoiler">
            <input type="checkbox" id="spoilerid_1">
            <label for="spoilerid_1">Category</label>
            <div class="spoiler_body">
                <ul>
                    <li><a href="product?cat=ACCESSORIES">Accessories</a></li>
                    <li><a href="product?cat=HOODIES">Hoodies</a></li>
                    <li><a href="product?cat=PANTS">Pants</a></li>
                    <li><a href="product?cat=SHIRTS">Shirts</a></li>
                    <li><a href="product?cat=SHORTS">Shorts</a></li>
                    <li><a href="product?cat=SWEATERS">Sweaters</a></li>
                    <li><a href="product?cat=T-SHIRTS">T-Shirts</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="two">
        <div class="box-flex sort">
            <form method="post" action="product" style="margin-left: 70px;">
                <div class="size" style="float: left;">
                    <h3>size</h3>
                    <ul>
                        <li><input name="xxs" type="checkbox">   XXS</li>
                        <li><input name="xs" type="checkbox">   XS</li>
                        <li><input name="s" type="checkbox">   S</li>
                        <li><input name="m" type="checkbox">   M</li>
                        <li><input name="l" type="checkbox">   L</li>
                        <li><input name="xl" type="checkbox">   XL</li>
                        <li><input name="xxl" type="checkbox">   XXL</li>
                    </ul>
                </div>
                <div class="prices" style="float: left;">
                    <h3>Price</h3>
                    <div class="price">
                        <input type="text" name="min" class="placeholder" placeholder="From 0$" style="width: 280px;"><br>
                        <input type="text" name="max" class="placeholder" placeholder="To 1000$" style="width: 280px;">
                    </div>
                </div>
                <div class="prices" style="float: left; margin-top: 40px;">
                    <button type="submit" class="box4btn">Search</button>
                </div>
            </form>
        </div>
        <div id="left">
            <ul>
                <c:forEach var="product" items="${products}" >
                    <li>
                        <div class="img"><a href="#"><img alt="" src="${product.imgSrc}"></a></div>
                        <a class="title" href="#"><c:out value="${product.name}"/></a>
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
        </div>
    </div>
</div>
<div class="preferences">
    <div class="container flexand">
        <div class="pref">
            <img src="img/pref1.png" alt="">
            <h4>Free Delivery</h4>
            <p>Worldwide delivery on all.
                Authorit tively morph next-generation
                innov tion with extensive models</p>
        </div>
        <div class="pref">
            <img src="img/pref2.png" alt="">
            <h4>Sales & discounts</h4>
            <p>Worldwide delivery on all.
                Authorit tively morph next-generation
                innov tion with extensive models</p>
        </div>
        <div class="pref">
            <img src="img/pref3.png" alt="">
            <h4>Quality assurance</h4>
            <p>Worldwide delivery on all.
                Authorit tively morph next-generation
                innov tion with extensive models</p>
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