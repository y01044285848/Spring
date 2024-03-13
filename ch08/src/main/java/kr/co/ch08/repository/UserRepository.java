package kr.co.ch08.repository;

import kr.co.ch08.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, String> {
}
