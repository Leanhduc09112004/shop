package com.demo.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name="Products")
public class Product {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    Integer id;
    //String code;
    String name;
    Integer price;
    String description;
    Boolean available;
    String image;
    @ManyToOne @JoinColumn(name="categoryid")
    Category category;
    // @Data --> setId, getId, setCode, getCode ....
    // @NoArgsConstructor --> public Product()
    //@AllArgsConstructor --> public Product(Integer id, String code, ...)
}
