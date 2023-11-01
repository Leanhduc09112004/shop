<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<c:forEach items="${list}" var="p">--%>
<%--<table>--%>
<%--<p class="nameproduct"><a class="nameproduct" href="/view-product/${p.id}">${p.name}</a></p>--%>
<%--<p class="imageproduct"><img src="${p.image}"/> </p>--%>
<%--<p class="categoryproduct">${p.category.name}</p>--%>
<%--<p class="priceproduct">${p.price}</p>--%>
<%--</table>pp--%>
<%--</c:forEach>--%>
<%--<style>--%>
<%--    .nameproduct{--%>
<%--        font-family: Arial;--%>
<%--        font-size: 20px;--%>
<%--    }--%>
<%--</style>--%>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<div class="container mt-5 mb-5">
    <div class="row">
        <div class="col-3 p-3 card">
            <form>
                <div class="product-search-info mt-3">
                    <label for="name" class="mb-1"><b>Tên sản phẩm:</b></label>
                    <input name="name" class="form-control" placeholder="Nhập tên sản phẩm để tìm" />
                </div>

                <div class="brand-search-info mt-3">
                    <label for="brandId"><b>Loại điện thoại:</b></label>
                    <div class="mt-2">
                        <input type="radio" name="categoryId" checked value="" />
                        <span>Tất cả</span>
                    </div>
                    <div class="mt-1">
                        <input name="categoryId" type="radio" value="IP" />
                        <span>IPhone</span>
                    </div>
                    <div class="mt-1">
                        <input name="categoryId" type="radio" value="ANDR" />
                        <span>Android</span>
                    </div>
                </div>

                <div class="price-search-info mt-3">
                    <label for="priceRange"><b>Mức giá:</b></label>
                    <div class="mt-2">
                        <input type="radio" name="priceRange" checked value="" />
                        <span>Tất cả</span>
                    </div>

                    <div class="mt-1">
                        <input type="radio" name="priceRange" value="1" />
                        <span>Dưới 10 triệu</span>
                    </div>

                    <div class="mt-1">
                        <input type="radio" name="priceRange" value="2" />
                        <span>Từ 10-20 triệu</span>
                    </div>

                    <div class="mt-1">
                        <input type="radio" name="priceRange" value="3" />
                        <span>Trên 20 triệu</span>
                    </div>
                </div>

                <button type="submit" class="btn btn-primary mt-4 mb-4">Tìm kiếm</button>
            </form>
        </div>
        <div class="col-9">
            <c:forEach items="${list}" var="p">
            <ul class="list-unstyled row" >
                <li class="list-item col-sm-4 mt-3">
                    <div class="item-container">
                        <a href="/view-product/${p.id}"><img src="${p.image}" class="product-image" alt="" /></a>
                            <div class="item-info">
                                <div>
                                    <span class="product-name">${p.name}</span>
                                </div>
                                <div>
                                    <span class="price-title">Giá bán:</span>
                                    <span class="price">${p.price} VNĐ</span>
                                </div>
                            </div>
                    </div>
                </li>
            </ul>
            </c:forEach>
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <li class="page-item"><a class="page-link" href="#/">&laquo;</a></li>
                    <li class="page-item"><a class="page-link" href="#/">&lsaquo;</a></li>
                    <li class="page-item"><a class="page-link" href="#/">&rsaquo;</a></li>
                    <li class="page-item"><a class="page-link" href="#/">&raquo;</a></li>
                </ul>
                <span>Hiển thị 1-10 trên tổng số 25 sản phẩm</span>
            </nav>
        </div>
    </div>
</div>

<style>
    .product-image {
        width: 95%;
        gap: 20px;
    }

    .price-title {
        font-family: Arial;
        font-size: 18px;
        font-weight: bold;
    }

    .price {
        font-size: 16px;
        font-weight: bold;
    }

    .product-item,
    .product-item:link,
    .product-item:hover,
    .product-item:visited {
        text-decoration: none;
        color: black;
    }

    .item-container {
        position: relative;
        height: 100%;
        padding-bottom: 50px;

    }

    .item-info {
        position: absolute;
        bottom: 0px;
        height: 50px;
    }
    .product-name{
        font-weight: bold;
        font-family: Arial;
        font-size: 25px;
        color: darkblue;
    }
</style>