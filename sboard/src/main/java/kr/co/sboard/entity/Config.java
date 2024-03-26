package kr.co.sboard.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.*;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
@Entity
@Table(name = "config")
public class Config {

    @Id
    private String cate;
    private String boardName;
    private String admin;

    @ColumnDefault("0")
    private String total;

    @CreationTimestamp
    private String createDate;


}
