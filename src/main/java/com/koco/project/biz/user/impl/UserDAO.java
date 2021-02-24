package com.koco.project.biz.user.impl;

import com.koco.project.biz.user.UserVO;

public interface UserDAO {
	// 회원가입
	public void userRegister(UserVO vo) throws Exception;
	
	// 로그인
	public UserVO login(UserVO vo) throws Exception;		
}
