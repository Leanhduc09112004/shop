<%--
  Created by IntelliJ IDEA.
  User: ICEMAN
  Date: 11/18/2023
  Time: 12:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../_navbar.jsp"%>

<div class="container mt-3">
    <h4>Danh sách đơn hàng</h4>
    <ul class="nav nav-tabs">
        <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">Đang chờ giao</a>
        </li>

        <li class="nav-item">
            <a class="nav-link" href="#">Đã giao</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">Đã hủy</a>
        </li>
    </ul>
    <form class="row mt-3">
        <div class="col-4">
            <input class="form-control" placeholder="Khách hàng" />
        </div>
        <div class="col-3">
            <input type="date" class="form-control" placeholder="Từ ngày" />
        </div>

        <div class="col-3">
            <input type="date" class="form-control" placeholder="Đến ngày" />
        </div>
        <div class="col-2">
            <button class="btn btn-primary">Tìm kiếm</button>
        </div>
    </form>
    <table class="table mt-3">
        <thead>
        <tr>
            <th style="width:30%">Khách hàng</th>
            <th style="width:30%">Địa chỉ nhận</th>
            <th style="width:25%">Ngày mua</th>
            <th style="width:15%"></th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>Nguyễn Văn A</td>
            <td>Tầng 4, Tòa nhà FPT, Kiều Mai</td>
            <td>10:30:00 17/11/2023</td>
            <td class="text-center">
                <a class="btn btn-sm btn-secondary" href="/view-order/1">Xem</a>
            </td>
        </tr>
        <tr>
            <td>Nguyễn Văn B</td>
            <td>123, Phố XYZ , Hà Nội</td>
            <td>11:30:00 16/11/2023</td>
            <td class="text-center">
                <a class="btn btn-sm btn-secondary" href="/view-order/2">Xem</a>
            </td>
        </tr>
        </tbody>
    </table>
    <nav aria-label="Page navigation example">
        <ul class="pagination">
            <li class="page-item"><a class="page-link" href="#/">&laquo;</a></li>
            <li class="page-item"><a class="page-link" href="#/">&lsaquo;</a></li>
            <li class="page-item"><a class="page-link" href="#/">&rsaquo;</a></li>
            <li class="page-item"><a class="page-link" href="#/">&raquo;</a></li>
        </ul>
        <span>Hiển thị 1-10 trên tổng số 25 đơn hàng</span>
    </nav>
</div>
