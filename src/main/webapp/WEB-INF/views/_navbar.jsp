<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary p-0">
    <div class="navbar-nav collapse navbar-collapse">
        <a class="nav-item nav-link active" href="/list-product" > <img class="img-nav" src="/static/images/logo2.png"></a>
        <a class="nav-item nav-link active" href="/list-product">Sản phẩm</a>
        <a class="nav-item nav-link" href="/about">Giới thiệu</a>
    </div>

    <ul class="navbar-nav ml-auto">
        <li class="nav-item no-arrow">
            <c:if test="${carts!=null && carts.size()>0}">
            <a href="/view-cart" class="nav-link mt-1 text-light">
                <img class="img-cart" alt="" style="width:40px"
                     src="/static/images/cart.png" />
                ${carts.size()}
            </a>
            </c:if>
        </li>
        <li class="nav-item no-arrow">
            <c:if test="${user!=null}">
            <a class="nav-link dropdown-toggle p-0" data-bs-toggle="dropdown" href="#">
                <img alt="" class="rounded-circle" style="width:60px"
                     src="/static/images/profile.png" />
            </a>
            <div class="dropdown-menu dropdown-menu-end">
                <p class="dropdown-name">${user.fullname}</p>
                <a class="dropdown-item" href="/logout" style="text-align: center">
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
<style>
    .dropdown-name {
        text-align: center;
    }
    .img-nav{
        width: 80px;
        height: 80px;
        border-radius: 10px;
    }
    .img-cart{
        background:white;
        border-radius: 4px;
    }
    .dropdown-item{
        text-align: center;
    }
</style>