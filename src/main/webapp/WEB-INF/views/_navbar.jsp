<%--
  Created by IntelliJ IDEA.
  User: ICEMAN
  Date: 11/10/2023
  Time: 2:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary p-0">
    <div class="navbar-nav collapse navbar-collapse">
        <a class="nav-item nav-link active" href="/list-product">Sản phẩm</a>
        <a class="nav-item nav-link" href="/about">Giới thiệu</a>
    </div>

    <ul class="navbar-nav ml-auto">
        <li class="nav-item no-arrow">
            <a href="/cart" class="nav-link mt-2 text-light">
                <img alt="" style="width:40px"
                     src="static/images/cart.png" />
                2
            </a>
        </li>
        <li class="nav-item no-arrow">
            <c:if test="${user!=null}">
            <a class="nav-link dropdown-toggle p-0" data-bs-toggle="dropdown" href="#">
                <img alt="" class="rounded-circle" style="width:60px"
                     src="/static/images/user.svg" />
            </a>
            <div class="dropdown-menu dropdown-menu-end">
                <a class="dropdown-item" href="/logout">
                    Đăng xuất
                </a>
            </div>
            </c:if>
            <c:if test="${user==null}">
                <a class="nav-link mt-2" href="/login">Đăng nhập</a>
            </c:if>
        </li>
    </ul>
</nav>
