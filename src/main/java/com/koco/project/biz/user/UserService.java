package com.koco.project.biz.user;

import java.util.Map;

public interface UserService {
	// 아이디 중복검사
	public boolean userIdExist(String userId);

	// 회원가입
	public void userRegister(UserVO userVo) throws Exception;

	// 로그인
	public Map<String, UserVO> login(UserVO userVo) throws Exception;
}
