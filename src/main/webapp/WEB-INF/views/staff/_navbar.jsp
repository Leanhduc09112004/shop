<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<nav class="navbar navbar-expand-lg navbar-dark bg-primary p-0">
    <div class="navbar-nav collapse navbar-collapse">
        <a class="nav-item nav-link" href="/list-order">Quản lý đơn hàng</a>
        <span class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#S">Báo cáo thống kê</a>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="/report-by-day">Theo ngày</a></li>
                <li><a class="dropdown-item" href="/report-by-product">Theo sản phẩm</a></li>
            </ul>
        </span>
    </div>

    <ul class="navbar-nav ml-auto">
        <li class="nav-item no-arrow">
            <c:if test="${user != null}">
                <a class="nav-link dropdown-toggle p-0" data-bs-toggle="dropdown" href="#">
                    <img alt="" class="rounded-circle" style="width:60px"
                         src="/static/images/profile.png" />
                </a>
                <div class="dropdown-menu dropdown-menu-end">
                    <a class="dropdown-item" href="/logout">
                        Đăng xuất
                    </a>
                </div>
            </c:if>
            <c:if test="${user == null}">
                <a class="nav-link mt-3" href="/login">Đăng nhập</a>
            </c:if>
        </li>
    </ul>
</nav>
