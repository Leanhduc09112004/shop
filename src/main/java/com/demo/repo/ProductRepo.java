package com.demo.repo;

import com.demo.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProductRepo extends JpaRepository<Product, Integer> {
    @Query("SELECT p FROM Product p WHERE (?1='' OR p.category.id=?1) AND p.name LIKE ?2 AND p.price>=?3 AND p.price<=?4")
    List<Product> search( String categoryId, String  keyword, int minPrice, int maxPrice);
}
