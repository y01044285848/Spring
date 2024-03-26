package kr.co.ch07.repository.shop;


import kr.co.ch07.entity.shop.Order;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@Slf4j
@SpringBootTest
public class ShopRepositoryTest {

    @Autowired private CustomerRepository customerRepository;
    @Autowired private OrderRepository orderReopsitory;
    @Autowired private OrderItemRepository orderItemReopsitory;
    @Autowired private ProductRepository productReopsitory;

    @Test
    public void selectOrders(){
        List<Order> Orders = orderReopsitory.findAll();

        for(Order order : Orders){
            log.info(order.toString());
        }

    }
}
