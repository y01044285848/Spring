package kr.co.sboard.repository;

import kr.co.sboard.entity.File;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FileRepository extends JpaRepository<File, Integer> {

}
