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
        </tr>
        </thead>
        <c:forEach items="${carts}" var="item">
        <tbody>
        <tr>
            <td>${item.productName}</td>
            <td>${item.productPrice} VNĐ</td>
            <td>${item.quantity}</td>
            <td>${item.total} VNĐ</td>
        </tr>
        </tbody>
        </c:forEach>
    </table>
    <div class="my-2">Tổng số tiền: ${total} VNĐ</div>
    <form method="POST">
        <div>
            <label class="mb-1">Địa chỉ nhận hàng:</label>
            <textarea class="form-control" rows="2" name="address"></textarea>
        </div>
        <div class="error" style="color: red">${error}</div>
        <button class="mt-2 btn btn-primary">Đặt mua</button>
    </form>
</div>
