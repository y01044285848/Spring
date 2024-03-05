package kr.co.ch04.dao;

import kr.co.ch04.dto.User4DTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class User4DAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public User4DTO selectUser4(){
        return null;
    }
    public List<User4DTO> selectUser4s(){
        String sql = "SELECT * FROM `user4`";
        return jdbcTemplate.query(sql, new User4RowMapper());
    }
    public void insertUser4(User4DTO user4DTO){
        String sql = "INSERT INTO `user4` VALUES(?,?,?,?,?,?)";
        Object[] params = {
                user4DTO.getUid(),
                user4DTO.getName(),
                user4DTO.getGender(),
                user4DTO.getAge(),
                user4DTO.getHp(),
                user4DTO.getAddr()
        };
        jdbcTemplate.update(sql,params);
    }
    public void deleteUser4(String uid){
        String sql = "DELETE FROM `user4` WHERE `uid`=?";
        jdbcTemplate.update(sql,uid);
    }
    public void updateUser4(){}


}
