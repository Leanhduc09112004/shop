<%--
  Created by IntelliJ IDEA.
  User: ICEMAN
  Date: 11/18/2023
  Time: 12:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../_navbar.jsp"%>

<div class="container mt-3">
    <h4>Thông tin đơn hàng</h4>
    <hr />
    <h5>Thông tin khách hàng</h5>
    <div class="row">
        <div class="col-3">
            <b>Họ và tên:</b>
        </div>
        <div class="col-9">
            Nguyễn Văn A
        </div>
    </div>
    <div class="row mt-3">
        <div class="col-3">
            <b>Số điện thoại:</b>
        </div>
        <div class="col-9">
            02321312
        </div>
    </div>
    <div class="row mt-3">
        <div class="col-3">
            <b>Địa chỉ:</b>
        </div>
        <div class="col-9">
            Hà Nội
        </div>
    </div>
    <h5 class="mt-3">Thông tin sản phẩm</h5>
    <div class="row">
        <div class="col-9">
            <table class="table">
                <thead>
                <tr>
                    <th>Sản phẩm</th>
                    <th>Đơn giá</th>
                    <th>Số lượng</th>
                    <th>Thành tiền</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>IPhone 11</td>
                    <td>11.500.000</td>
                    <td>2</td>
                    <td>23.000.000</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row mt-3">
        <div class="col-3">
            <b>Tổng số tiền:</b>
        </div>
        <div class="col-9">
            23.000.000 đ
        </div>
    </div>

    <div class="row mt-3">
        <div class="col-3">
            <b>Trạng thái đơn hàng:</b>
        </div>
        <div class="col-9">
            Đang chờ giao hàng
        </div>
    </div>

    <div class="mt-3">
        <a class="btn btn-secondary" href="order_list.html">Quay lại</a>
        <button class="btn btn-primary">Xác nhận đã giao</button>
        <button class="btn btn-danger">Huỷ đơn hàng</button>
    </div>
</div>
