package kr.co.ch06.controller;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;

import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;

import static org.junit.jupiter.api.Assertions.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@SpringBootTest
@AutoConfigureMockMvc
class MainControllerTest {

    /*
    * MockMvc는 웹 애플리케이션을 서버에 실행하지 않고
    * Spring Mvc 동작을 세션에서 테스트하는 가상 객체
    * */

    @Autowired
    private MockMvc mockMvc;

    @BeforeAll
    public static void before(){

    }

    @Test
    void index() throws Exception{
        mockMvc.perform(get("/index"))
                .andExpect(status().isOk())
                .andExpect(view().name("/index"))
                .andDo(print());
    }

    @Test
    void content1() {
    }

    @Test
    void content2() {
    }
}