<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../_navbar.jsp"%>
<div class="container mt-3">
    <h4>Danh sách đơn hàng</h4>
    <ul class="nav nav-tabs">
        <li class="nav-item">
            <a class="nav-link ${param.status==null?'active':''}" aria-current="page" href="/list-order">Đang chờ giao</a>
        </li>

        <li class="nav-item">
            <a class="nav-link ${'DELIVERED'.equals(param.status)?'active':''}" href="/list-order?status=DELIVERED">Đã giao</a>
        </li>
        <li class="nav-item">
            <a class="nav-link ${'CANCELLED'.equals(param.status)?'active':''}" href="/list-order?status=CANCELLED">Đã hủy</a>
        </li>
    </ul>
    <form class="row mt-3">
        <input type="hidden" name="status" value="${param.status}">
        <div class="col-4">
            <input name="keyword" ${param.keyword} class="form-control" placeholder="Khách hàng" />
        </div>
        <div class="col-3">
            <input name="fromDate" ${param.fromDate} type="date" class="form-control" placeholder="Từ ngày" />
        </div>

        <div class="col-3">
            <input name="toDate" ${param.toDate} type="date" class="form-control" placeholder="Đến ngày" />
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
        <c:forEach items="${list}" var="order">
        <tbody>
        <tr>
            <td>${order.user.fullname}</td>
            <td>${order.address}</td>
            <td>${order.createdate}</td>
            <td class="text-center">
                <a class="btn btn-sm btn-secondary" href="/view-order/${order.id}">Xem</a>
            </td>
        </tr>
        </tbody>
        </c:forEach>
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
