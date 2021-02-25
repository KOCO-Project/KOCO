package com.koco.project.biz.user.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koco.project.biz.user.UserService;
import com.koco.project.biz.user.UserVO;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO dao;

	@Override
	public void userRegister(UserVO userVo) throws Exception {
		dao.userRegister(userVo);
	}

	@Override
	public Map<String, UserVO> login(UserVO userVo) throws Exception {
		return dao.login(userVo);
	}

}
