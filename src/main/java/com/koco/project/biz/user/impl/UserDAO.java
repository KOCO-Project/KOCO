package com.koco.project.biz.user.impl;

import java.util.Map;

import com.koco.project.biz.user.UserVO;

public interface UserDAO {
	// 회원가입
	public void userRegister(UserVO userVo) throws Exception;
	
	// 로그인
	public Map<String, UserVO> login(UserVO userVo) throws Exception;		
}
