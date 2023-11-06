package com.demo.controller;

import com.demo.model.Product;
import com.demo.repo.ProductRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class ProductController {
    @Autowired
    ProductRepo repo;

    // http:/localhost:8080/view-product/1
    @GetMapping("/view-product/{id}")
    public String viewProduct
    (@PathVariable Integer id, Model model) {
        Product p = repo.findById(id).orElse(null);
        model.addAttribute("p", p);
        return "product/detail";
    }
    @GetMapping("/list-product")
    public String listProduct
            (@RequestParam(defaultValue = "") String keyword,@RequestParam(defaultValue = "") String categoryId, @RequestParam(defaultValue = "0") Integer priceRange, Model model){
        int minPrice = 0, maxPrice = 100000000;
        if (priceRange==1){
            minPrice = 0 ; maxPrice=10000000;
        }else if (priceRange == 2){
            minPrice = 10000000; maxPrice= 20000000;
        }else if (priceRange==3){
            minPrice=20000000;
        }
        List<Product> list = repo.search(categoryId,"%"+keyword+"%", minPrice, maxPrice);
        model.addAttribute("list", list);
        return "product/index";
    }
}
