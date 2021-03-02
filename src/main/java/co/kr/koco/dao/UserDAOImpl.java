package co.kr.koco.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.koco.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {
	@Autowired
	private SqlSessionTemplate sql;

	@Override
	public String userIdExist(String userId) {
		return sql.selectOne("userMapper.userIdExist", userId);
	}
	
	@Override
	public String userNicknameExist(String userNickname) {		
		return sql.selectOne("userMapper.userNicknameExist", userNickname);
	}
	
	@Override
	public String userEmailExist(String userEmail) {
		return sql.selectOne("userMapper.userEmailExist", userEmail);
	}

	@Override
	public void userRegister(UserVO userVo) throws Exception {
		sql.insert("userMapper.register", userVo);
	}

	@Override
	public Map<String, UserVO> login(UserVO userVo) throws Exception {
		return sql.selectOne("userMapper.loginCheck", userVo);
	}

	@Override
	public UserVO findIdPw(String userEmail) throws Exception {
		return (UserVO) sql.selectOne("userMapper.findIdPw", userEmail);
	}	

}
