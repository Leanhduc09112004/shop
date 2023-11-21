package com.demo.repo;

import com.demo.model.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Date;
import java.util.List;

public interface OrderRepo extends JpaRepository<Order, Long> {
    @Query ("SELECT o FROM Order o WHERE o.user.fullname LIKE ?1 AND o.createdate >=?2 AND o.createdate <= ?3 AND o.status=?4")
    List<Order> search(String keyword, Date d1, Date d2, String status);
    @Query(
            value="select cast(o.Createdate as date) as date , \n" +
                    "sum(od.quantity*od.price) as revenue\n" +
                    "FROM OrderDetails od JOIN Orders o \n" +
                    "ON o.id=od.Orderid \n" +
                    "GROUP BY cast(o.Createdate as  date) \n" +
                    "WHERE o.Createdate BETWEEN ?1 AND ?2",
            nativeQuery = true
    )
    List<Object[]> reportByDay(Date d1, Date d2);
}
