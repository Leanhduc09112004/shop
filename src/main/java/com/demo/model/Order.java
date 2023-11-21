package com.demo.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data @AllArgsConstructor @NoArgsConstructor
@Entity @Table(name="Orders")
public class Order {
    @Id @GeneratedValue(
        strategy=GenerationType.IDENTITY
    ) Long id;
    @ManyToOne @JoinColumn(name="username")
    User user;
    Date createdate;
    String address;
    Date deliver;
    String status;

    @OneToMany(mappedBy="order")
    List<OrderDetail> orderDetailList;
    public static interface Status{
        public String New ="NEW";
        public String Deliveried ="DELIVERED";
        public String Cancelled ="CANCELLED";
    }
    public long getTotal(){
     if(orderDetailList==null) return 0;
     long total = 0;
     for(OrderDetail item : orderDetailList){
         total+=item.getQuantity()*item.getPrice();
     }
     return total;
    }
}
