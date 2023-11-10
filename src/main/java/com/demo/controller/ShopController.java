package com.demo.controller;

import com.demo.model.User;
import com.demo.repo.UserRepo;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ShopController {
    @Autowired
    UserRepo userRepo;
    @Autowired
    HttpSession session;
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
}
