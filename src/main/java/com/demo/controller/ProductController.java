package com.demo.controller;

import com.demo.model.Product;
import com.demo.repo.ProductRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class ProductController {
    @Autowired
    ProductRepo repo;

    // http:/localhost:8080/view-product/1
    @GetMapping("/view-product/{id}")
    public String viewProduct(@PathVariable Integer id, Model model) {
        Product p = repo.findById(id).orElse(null);
        model.addAttribute("p", p);
        return "product/detail";
    }
    @GetMapping("/list-product")
    public String listProduct(Model model){
        model.addAttribute("list", repo.findAll());
        return "product/index";
    }
}
