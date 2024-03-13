package kr.co.ch07.repository.shop;

import kr.co.ch07.entity.shop.Customer;
import kr.co.ch07.entity.shop.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductReopsitory extends JpaRepository<Product,String> {
}
