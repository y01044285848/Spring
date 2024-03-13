package kr.co.ch07.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import kr.co.ch07.dto.User2DTO;
import lombok.*;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
@Entity
@Table(name = "user2")
public class User2 {

    @Id
    private String uid;
    private String name;
    private String birth;
    private String addr;

    public User2DTO toDTO(){
        return User2DTO.builder()
                .uid(uid)
                .uid(name)
                .uid(birth)
                .uid(addr)
                .build();
    }

}
