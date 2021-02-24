package com.koco.project.view.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.koco.project.biz.user.UserVO;
import com.koco.project.biz.user.impl.UserDAO;

@Controller
public class UserController {
	@Autowired
	private UserDAO dao;
	
	@RequestMapping(value = "/userRegister.do", method = RequestMethod.POST)
	public String userRegister(UserVO vo) throws Exception {
		dao.userRegister(vo);
		
		return null;
	}
}
