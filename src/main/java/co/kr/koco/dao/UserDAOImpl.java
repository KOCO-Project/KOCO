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
	public void userRegister(UserVO userVo) throws Exception {
		sql.insert("userMapper.register", userVo);
	}

	@Override
	public Map<String, UserVO> login(UserVO userVo) throws Exception {
		return sql.selectOne("userMapper.loginCheck", userVo);
	}

//	@Override
//	public UserVO mypage(String userId, String userPw) throws Exception {
//		Map<String, Object> userInfo = new HashMap<String, Object>();
//		
//		userInfo.put("userId", userId);
//		userInfo.put("userPw", userPw);
//		
//		return sql.selectOne("userMapper.mypage", userInfo);
//	}

}
