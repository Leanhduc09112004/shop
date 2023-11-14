package com.demo.controller;

import com.demo.model.Product;
import com.demo.model.User;
import com.demo.repo.ProductRepo;
import com.demo.repo.UserRepo;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
public class ShopController {
    @Autowired
    UserRepo userRepo;
    @Autowired
    HttpSession session;
    @Autowired
    ProductRepo productRepo;
    @GetMapping("/login")
    public String login(){
        return"login";
    }
    @PostMapping("/login")
    public String login(@RequestParam String username, @RequestParam String password, Model model){
        User user = userRepo.findById(username).orElse(null);
        if(user == null||!user.getPassword().equals(password)){
            model.addAttribute("error","Tên đăng nhập hoặc mật khẩu không chính xác");
            return "login";
        }
        session.setAttribute("user",user);
        return"redirect:/list-product";
    }
    @GetMapping("/logout")
    public String logout(){
        session.removeAttribute("user");
        return"redirect:/list-product";
    }
    @Data @AllArgsConstructor @NoArgsConstructor
    public static class CartItem{
        Integer productId;
        String productName;
        Integer productPrice;
        Integer quantity;
        public Integer getTotal(){return quantity*productPrice;}
    }
    void addCart(int productId, int quantity) {
        List<CartItem> carts = (List<CartItem>) session.getAttribute("carts");
        if(carts == null){                  // Start of session
            carts = new ArrayList<>();
            session.setAttribute("carts", carts);
        }
        for(CartItem item : carts) {
            if(item.getProductId() == productId) {  // product already exists
                item.setQuantity(item.getQuantity() + quantity);
                return;
            }
        }
        Product product = productRepo.findById(productId).orElse(null);
        if(product != null) {
            CartItem newItem = new CartItem();
            newItem.setProductId(productId);
            newItem.setQuantity(quantity);
            newItem.setProductName(product.getName());
            newItem.setProductPrice(product.getPrice());
            carts.add(newItem);
        }
    }
    @GetMapping("/add-to-cart/{id}")
    public String addToCart(@PathVariable int id)
    {
        addCart(id,1);
        return "redirect:/list-product";
    }

    @GetMapping("/remove-cart/{id}")
    public String removeCart(@PathVariable int id){
        List<CartItem> carts = (List<CartItem>) session.getAttribute("carts");
        int index=-1;
        for (int i=0;i<carts.size();i++){
            if (carts.get(i).getProductId()==id) index=i;
        }
        if (index>=0) carts.remove(index);
        return "redirect:/view-cart";
    }

    @PostMapping("/update-cart/{id}")
    public String updateCart(@PathVariable int id,@RequestParam int quantity){
        List<CartItem> carts = (List<CartItem>) session.getAttribute("carts");
        int index=-1;
        for (int i=0;i<carts.size();i++){
            if (carts.get(i).getProductId()==id) index=i;
        }
        if (index>=0) carts.get(index).setQuantity(quantity);
        return "redirect:/view-cart";
    }

    @GetMapping("/view-cart")
    public String viewCart(Model model){
        int total = 0;
        List<CartItem> carts = (List<CartItem>)session.getAttribute("carts");
        if (carts!=null){
                for (CartItem item :carts) total+=item.getTotal();
        }
        if (total==0){
            return "redirect:/list-product";
        }
        model.addAttribute("total",total);
        return "cart";
    }
    @GetMapping("/purchase/{id}")
    public String purchase(@PathVariable int id)
    {
        addCart(id,1);
        return "redirect:/view-cart";
    }
}
