package com.koco.project.view.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.koco.project.biz.user.UserService;
import com.koco.project.biz.user.UserVO;

@Controller
public class UserController {
	@Autowired
	private UserService service;
	
	@GetMapping("/userIdExist/{userId}")
	public String userIdExist(@PathVariable String userId) {
		boolean check = service.userIdExist(userId);
		
		return check + "";
	}

	@PostMapping("/userRegister")
	public String userRegister(UserVO vo) throws Exception {
		service.userRegister(vo);

		return "login.jsp";
	}

	@PostMapping("/userLogin")
	public String login(UserVO userVo, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();

		Map<String, UserVO> login = service.login(userVo);

		if (login != null) {
			session.setAttribute("user", login);
		} else {
			session.setAttribute("user", null);
		}

		return "logintest.jsp";
	}
}
