package kr.co.ch05.mapper;

import kr.co.ch05.dto.User2DTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/*
    @Mapper
     - MapperScan을 통한 해당 Mapper 등록
     - Mapper xml 파일과 연결 및 데이터베이스와 상호작용
 */
@Mapper
public interface User2Mapper {
    public void insertUser2(User2DTO user2DTO);
    public User2DTO selectUser2(String uid);
    public List<User2DTO> selectUser2s();
    public void updateUser2(User2DTO user2DTO);
    public void deleteUser2(String uid);
}