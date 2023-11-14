<%--
  Created by IntelliJ IDEA.
  User: ICEMAN
  Date: 11/13/2023
  Time: 3:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="_navbar.jsp"%>
<div class="container mt-3">
    <table class="table">
        <thead>
        <tr>
            <th>Sản phẩm</th>
            <th>Đơn giá</th>
            <th>Số lượng</th>
            <th>Thành tiền</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${carts}" var="item">
        <form action="/update-cart/${item.productId}" method="post">
            <input type="hidden" name="id" value="${item.productId}">
            <tr>
                <td>${item.productName}</td>
                <td>${item.productPrice} VNĐ</td>
                <td>
                    <input type="number" class="form-control"
                           min="1"
                           name="quantity"
                           value="${item.quantity}"
                           onchange="this.form.submit()"
                           style="width:50px;">
                </td>
                <td>${item.total} VNĐ</td>
                <td>
                    <a class="btn btn-sm btn-danger" href="/remove-cart/${item.productId}">Xóa</a>
                </td>
            </tr>
        </form>
        </c:forEach>
        </tbody>
    </table>
    <div class="my-2">Tổng số tiền: ${total} VNĐ</div>
    <a class="btn btn-secondary" href="/list-product">Tiếp tục mua hàng</a>
    <a class="btn btn-primary" href="checkout.html">Thanh toán</a>
</div>
