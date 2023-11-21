package com.demo.controller;
import com.demo.repo.OrderDetailRePo;
import org.springframework.ui.Model;
import com.demo.model.Order;
import com.demo.model.User;
import com.demo.repo.OrderRepo;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class StaffController {
    @Autowired
    HttpSession session;
    @Autowired
    OrderRepo orderRepo;
    @Autowired
    OrderDetailRePo orderDetailRePo;
    @GetMapping("/list-order")
    public String listOrder(@RequestParam(defaultValue = "1970-01-01 00:00:00") String fromDate,
                            @RequestParam(defaultValue = "2100-01-01 ") String toDate,
                            @RequestParam(defaultValue = "") String keyword,
                            @RequestParam(defaultValue = "NEW") String status, Model model) throws ParseException {
        User user = (User) session.getAttribute("user");
        if(user == null || !user.getIsstaff()) {
            session.setAttribute("loginRedirectURL", "/list-order");
            return "redirect:/login";
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date d1 = sdf.parse(fromDate+ " 00:00:00");
        Date d2 = sdf.parse(toDate+" 23:59:59") ;
        List<Order> list = orderRepo.search("%"+keyword+"%",d1,d2,status);
        model.addAttribute("list",list);
        return "staff/order/list";
    }

    @GetMapping("/view-order/{id}")
    public String viewOrder(@PathVariable long id, Model model) {
        User user = (User) session.getAttribute("user");
        if(user == null || !user.getIsstaff()) {
            session.setAttribute("loginRedirectURL", "/view-order/"+id);
            return "redirect:/login";
        }
        Order order = orderRepo.findById(id).orElse(null);
        model.addAttribute("order", order);
        return "staff/order/detail";
    }
    @RequestMapping("/confirm-order/{id}")
    public String confirmOrder(@PathVariable long id){
        Order order = orderRepo.findById(id).get();
        order.setStatus(Order.Status.Deliveried);
        order.setDeliver(new Date());
        orderRepo.save(order);
        return "redirect:/list-order";
    }
    @RequestMapping("/cancel-order/{id}")
    public String cancelOrder(@PathVariable long id){
        Order order = orderRepo.findById(id).get();
        order.setStatus(Order.Status.Cancelled);
        orderRepo.save(order);
        return "redirect:/list-order";
    }
    @GetMapping("/report-by-day")
    public String getReportByDay(){
        return "staff/report/by-day";
    }

    @PostMapping("/report-by-day")
    public String reportByDay(
            @RequestParam(defaultValue="1970-01-01 00:00:00") String fromDate,
            @RequestParam(defaultValue="2100-01-01 00:00:00") String toDate,
            Model model
    ) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date d1 = sdf.parse(fromDate + " 00:00:00");
        Date d2 = sdf.parse(toDate + " 23:59:59");
        List<Object[]> data = orderDetailRePo.reportByDay(d1, d2);
        model.addAttribute("data", data);
        return "staff/report/by-day";

    }
    @GetMapping("/report-by-product")
    public String getReportByProduct(){
        return "staff/report/by-product";
    }
}
