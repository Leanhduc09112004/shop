package com.demo.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor
@Entity @Table(name="Orderdetails")
public class OrderDetail {
    @Id
    @GeneratedValue(
        strategy= GenerationType.IDENTITY
    )Long id;
    //Long orderid;
    @ManyToOne @JoinColumn(name="orderid")
    Order order;
    Integer productid;
    Integer price;
    Integer quantity;
}
