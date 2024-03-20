package kr.co.ch09.service;

import kr.co.ch09.dto.User1DTO;

import kr.co.ch09.entity.User1;
import kr.co.ch09.repository.User1Repository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Slf4j
@RequiredArgsConstructor
@Service
public class User1Service {

    private final User1Repository user1Repository;

    public void insertUser1(User1DTO user1DTO){
        User1 user1 = user1DTO.toEntity();
        user1Repository.save(user1);
    }
    public User1DTO selectUser1(String uid){
        User1 user1 = user1Repository.findById(uid).get();
        return user1.toDTO();
    }
    public List<User1DTO> selectUser1s(){
        List<User1> user1s = user1Repository.findAll();
        return user1s
                .stream()
                .map((entity)->User1DTO.builder()
                        .uid(entity.getUid())
                        .name(entity.getName())
                        .birth(entity.getBirth())
                        .hp(entity.getHp())
                        .age(entity.getAge())
                        .build())
                .collect(Collectors.toList());
    }
    public User1DTO updateUser1(User1DTO user1DTO){
        user1Repository.save(user1DTO.toEntity());

        Optional<User1> result = user1Repository.findById(user1DTO.getUid());

        return result.get().toDTO();
    }
    public ResponseEntity deleteUser1(String uid){
        user1Repository.deleteById(uid);

        Optional<User1> optUser1 = user1Repository.findById(uid);
        if(optUser1.isPresent()){
            user1Repository.deleteById(uid);
            return ResponseEntity
                    .ok()
                    .body(optUser1.get());
        }else{
            return ResponseEntity
                    .status(HttpStatus.NOT_FOUND)
                    .body("user not found");
        }
    }

}
