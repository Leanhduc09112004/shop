package com.demo.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data @AllArgsConstructor @NoArgsConstructor
@Entity @Table(name="Orders")
public class Order {
    @Id @GeneratedValue(
        strategy=GenerationType.IDENTITY
    ) Long id;
    String username;
    Date createdate;
    String address;
    Date deliver;
    String status;

    public static interface Status{
        public String New ="NEW";
        public String Deliveried ="DELIVERED";
        public String Cancelled ="CANCELLED";
    }
}
