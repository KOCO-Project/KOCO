package co.kr.koco.service;

import java.util.Map;

import co.kr.koco.vo.UserVO;

public interface UserService {
	// 아이디 중복검사
	public boolean userIdExist(String userId);

	// 회원가입
	public void userRegister(UserVO userVo) throws Exception;

	// 로그인
	public Map<String, UserVO> login(UserVO userVo) throws Exception;
	
	// 마이페이지
	//public UserVO mypage(String userId, String userPw) throws Exception;
}
