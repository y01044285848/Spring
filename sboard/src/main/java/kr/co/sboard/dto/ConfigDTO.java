package kr.co.sboard.dto;

import lombok.*;



@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class ConfigDTO {

    private String cate;
    private String boardName;
    private String admin;
    private String total;
    private String createDate;



}