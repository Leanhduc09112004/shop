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
           ${order.user.fullname}
        </div>
    </div>
    <div class="row mt-3">
        <div class="col-3">
            <b>Địa chỉ:</b>
        </div>
        <div class="col-9">
            ${order.address}
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
                <c:forEach items="${order.orderDetailList}" var="item">
                <tbody>
                <tr>
                    <td>${item.product.name}</td>
                    <td>${item.price}</td>
                    <td>${item.quantity}</td>
                    <td>${item.price*item.quantity}</td>
                </tr>
                </tbody>
                </c:forEach>
            </table>
        </div>
    </div>
    <div class="row mt-3">
        <div class="col-3">
            <b>Tổng số tiền:</b>
        </div>
        <div class="col-9">
            ${order.total}
        </div>
    </div>

    <div class="row mt-3">
        <div class="col-3">
            <b>Trạng thái đơn hàng:</b>
        </div>
        <div class="col-9">
            <c:if test="${'NEW'.equals(order.status)}">Đang chờ giao hàng</c:if>
            <c:if test="${'DELIVERED'.equals(order.status)}">Đã giao</c:if>
            <c:if test="${'CANCELLED'.equals(order.status)}">Đã hủy</c:if>
        </div>
    </div>

    <div class="mt-3">
        <a class="btn btn-secondary" href="/list-order">Quay lại</a>
        <c:if test="${'NEW'.equals(order.status)}">
        <button onclick="confirmOrder()" class="btn btn-primary">Xác nhận đã giao</button>
        <button onclick="cancelOrder()" class="btn btn-danger">Huỷ đơn hàng</button>
        </c:if>
    </div>
</div>
<script>
    function confirmOrder() {
        if(confirm("Xác nhận đơn hàng đã được giao ?")){
            location.href="/confirm-order/${order.id}";
        }
    }
    function  cancelOrder(){
        if(confirm("Xác nhận hủy đơn hàng?")){
            location.href="/cancel-order/${order.id}";
        }
    }
</script>