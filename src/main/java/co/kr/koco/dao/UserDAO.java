package co.kr.koco.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.koco.vo.UserVO;

@Repository
public class UserDAO {
	@Autowired
	private SqlSessionTemplate sql;

	public String userIdExist(String userId) {
		return sql.selectOne("userMapper.userIdExist", userId);
	}
	
	public String userNicknameExist(String userNickname) {		
		return sql.selectOne("userMapper.userNicknameExist", userNickname);
	}
	
	public String userEmailExist(String userEmail) {
		return sql.selectOne("userMapper.userEmailExist", userEmail);
	}

	public void userRegister(UserVO userVo) throws Exception {
		sql.insert("userMapper.register", userVo);
	}

	public UserVO login(UserVO userVo) throws Exception {
		return (UserVO) sql.selectOne("userMapper.loginCheck", userVo);
	}

	public UserVO findIdPw(String userEmail) throws Exception {
		return (UserVO) sql.selectOne("userMapper.findIdPw", userEmail);
	}
	
	public void userUpdate(UserVO userVo) throws Exception {
		sql.update("userMapper.userUpdate", userVo);
	}
	
	public void pwUpdate(UserVO userVo) throws Exception {
		sql.update("userMapper.pwUpdate", userVo);
	}
	
	public UserVO userPage(String userNickname) throws Exception{
		return (UserVO) sql.selectOne("userMapper.userPage", userNickname);
	}

	public List<UserVO> userList(UserVO userVo) throws Exception {
		return sql.selectList("userMapper.userList", userVo);
	}			

}
