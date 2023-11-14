<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<div class="container mt-5 mb-5">
    <div class="row">
        <div class="col-6">
            <img alt="" class="product-detail-image" src="${p.image}" />
        </div>
        <div class="col-6 mt-5">
            <div class="product-detail-title">${p.name}</div>
            <br />
            <table class="table">
                <tbody>
                <tr>
                    <td>Loại điện thoại:</td>
                    <td>${p.category.name}</td>
                </tr>
                <tr>
                    <td>Giá bán:</td>
                    <td><b>${p.price} VNĐ</b></td>
                </tr>
                </tbody>
            </table>
            <br />
            <a class="btn btn-secondary" href="/list-product">Quay lại</a>
            <a class="btn btn-primary" href="/purchase/${p.id}">Mua hàng</a>
            <a class="btn btn-primary" href="/add-to-cart/${p.id}">Thêm vào giỏ hàng</a>
        </div>
    </div>
</div>
<style>
    .product-detail-image {
        width: 400px;
        height: 400px;
        float: left;
        margin-right: 20px;
    }

    .product-detail-title {
        font-weight: bold;
        font-size: 20px;
    }

    .table td:first-child {
        font-weight: bold;
        width: 150px;
    }
</style>
