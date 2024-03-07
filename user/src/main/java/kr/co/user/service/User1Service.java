package kr.co.user.service;

import kr.co.user.dto.User1DTO;
import kr.co.user.mapper.User1Mapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class User1Service {
    private final User1Mapper mapper;


    public User1Service(User1Mapper mapper) {
        this.mapper = mapper;
    }
    public List<User1DTO> selectUser1s(){
        return mapper.selectUser1s();
    }
}
