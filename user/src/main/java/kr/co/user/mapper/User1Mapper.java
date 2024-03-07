package kr.co.user.mapper;

import kr.co.user.dto.User1DTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface User1Mapper {
    public List<User1DTO> selectUser1s();
}
