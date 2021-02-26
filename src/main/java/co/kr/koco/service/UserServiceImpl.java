package co.kr.koco.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.koco.dao.UserDAO;
import co.kr.koco.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO dao;

	@Override
	public boolean userIdExist(String userId) {
		String exist = dao.userIdExist(userId);

		if (exist == null) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public void userRegister(UserVO userVo) throws Exception {
		dao.userRegister(userVo);
	}

	@Override
	public Map<String, UserVO> login(UserVO userVo) throws Exception {
		return dao.login(userVo);
	}

//	@Override
//	public UserVO mypage(String userId, String userPw) throws Exception {
//		return dao.mypage(userId, userPw);
//	}

}
