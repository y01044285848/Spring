package kr.co.ch04.controller;

import kr.co.ch04.dao.User4DAO;
import kr.co.ch04.dto.User4DTO;
import kr.co.ch04.service.User4Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class User4Controller {

    @Autowired
    private User4Service service;

    @GetMapping("/user4/list")
    public String list(Model model){
        List<User4DTO> users = service.selectUser4s();
        model.addAttribute("users", users);
        return "user4/list";
    }

    @GetMapping("/user4/register")
    public String register(){

        return "user4/register";
    }

    @PostMapping("/user4/register")
    public String register(User4DTO user4DTO){
        service.insertUser4(user4DTO);
        return "redirect:/user4/list";
    }

    @GetMapping("/user4/delete")
    public String delete(@RequestParam("uid") String uid){
        service.deleteUser4(uid);
        return "redirect:/user4/list";
    }

}
