package kr.co.ch06.controller;

import kr.co.ch06.dto.User1DTO;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Controller
public class MainController {

    //private Logger logger = LoggerFactory.getLogger(MainController.class);

    @GetMapping(value = {"/", "/index"})
    public String index(Model model){

        log.debug("index...");

        // 출력
        String str1 = "Hello World";
        String str2 = "Hello Spring Boot";

        model.addAttribute("str1", str1);
        model.addAttribute("str2", str2);

        // Constructor 초기화
        User1DTO user1 = new User1DTO("A101", "김유신","2024-02-13","010-1234-5678", 23);

        // Setter 초기화
        User1DTO user2 = new User1DTO();
        user2.setUid("A102");
        user2.setName("김춘추");
        user2.setAge(21);

        // Builder 패턴 초기화
        User1DTO user3 = User1DTO.builder()
                            .uid("A103")
                            .name("장보고")
                            .age(33)
                            .build();

        User1DTO user4 = null;

        model.addAttribute("user1",user1);
        model.addAttribute("user2",user2);
        model.addAttribute("user3",user3);
        model.addAttribute("user4",user4);

        // List 생성
        List<User1DTO> users = new ArrayList<>();
        users.add(user1);
        users.add(user2);
        users.add(user3);

        model.addAttribute("users", users);


        return "/index";
    }

    @GetMapping("/sub2/content1")
    public String content1(){
        return "/sub2/content1";
    }

    @GetMapping("/sub2/content2")
    public String content2(){
        return "/sub2/content2";
    }
}
