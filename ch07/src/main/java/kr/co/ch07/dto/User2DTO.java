package kr.co.ch07.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class User2DTO {
    private String uid;
    private String name;
    private String birth;
    private String addr;


}
