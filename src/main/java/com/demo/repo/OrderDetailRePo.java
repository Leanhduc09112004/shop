package com.demo.repo;

import com.demo.model.OrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Date;
import java.util.List;

public interface OrderDetailRePo extends JpaRepository<OrderDetail, Long> {
    @Query(value="select cast(o.Createdate as date) as date , \n" +
            "sum(od.quantity*od.price) as revenue\n" +
            "FROM OrderDetails od JOIN Orders o \n" +
            "ON o.id=od.Orderid  \n" +
            "WHERE o.Createdate BETWEEN ?1 AND ?2\n" +
            "GROUP BY cast(o.Createdate as  date)" ,
            nativeQuery = true
    )
    List<Object[]> reportByDay(Date d1, Date d2);
}
