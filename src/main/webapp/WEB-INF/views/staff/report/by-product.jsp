<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../_navbar.jsp"%>
<div class="container mt-3">
    <form method="post">
        <div class="row">
            <div class="col-4">
                <label>Từ ngày:</label>
                <input type="date" value="${param.fromDate}" name="fromDate" class="form-control">
            </div>
            <div class="col-4">
                <label>Đến ngày:</label>
                <input type="date" value="${param.toDate}" name="toDate" class="form-control">
            </div>
            <div class="col-4">
                <br/>
                <button class="btn btn-primary">Báo cáo</button>
            </div>
        </div>
    </form>
    <table class="table">
        <thead>
        <tr>
            <th>Sản phẩm</th>
            <th>Số lượng</th>
            <th>Doanh thu</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>IPhone 15</td>
            <td>10</td>
            <td>150.000.000 đ</td>
        </tr>
        </tbody>
    </table>
</div>