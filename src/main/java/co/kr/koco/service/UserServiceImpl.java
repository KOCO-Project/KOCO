package co.kr.koco.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import co.kr.koco.dao.UserDAO;
import co.kr.koco.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO dao;
	
	@Resource(name = "userVO")
	@Lazy
	private UserVO userVO;

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
	public boolean userNicknameExist(String userNickname) {
		String exist = dao.userNicknameExist(userNickname);
		
		if (exist == null) {
			return true;
		} else {
			return false;
		}
	}
	
	@Override
	public boolean userEmailExist(String userEmail) {
		String exist = dao.userEmailExist(userEmail);
		
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

	@Override
	public UserVO findIdPw(String userEmail) throws Exception {
		return dao.findIdPw(userEmail);
	}		

}
