package com.koco.project.biz.user;

import java.util.Map;

public interface UserService {
	// 회원가입
	public void userRegister(UserVO userVo) throws Exception;
	
	// 로그인
	public Map<String, UserVO> login(UserVO userVo) throws Exception;
}
