package com.demo.controller;
import com.demo.model.User;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class StaffController {
    @Autowired
    HttpSession session;

    @GetMapping("/list-order")
    public String listOrder(){
        User user = (User) session.getAttribute("user");
        if(user == null || !user.getIsstaff()) {
            session.setAttribute("loginRedirectURL", "/list-order");
            return "redirect:/login";
        }
        return "staff/order/list";
    }

    @GetMapping("/view-order/{id}")
    public String viewOrder(@PathVariable long id) {
        User user = (User) session.getAttribute("user");
        if(user == null || !user.getIsstaff()) {
            session.setAttribute("loginRedirectURL", "/view-order/"+id);
            return "redirect:/login";
        }
        return "staff/order/detail";
    }
}
