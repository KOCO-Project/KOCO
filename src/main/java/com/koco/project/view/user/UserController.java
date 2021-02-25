package com.koco.project.view.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.koco.project.biz.user.UserService;
import com.koco.project.biz.user.UserVO;

@Controller
public class UserController {
	@Autowired
	private UserService service;

	@RequestMapping(value = "/userRegister", method = RequestMethod.POST)
	public String userRegister(UserVO vo) throws Exception {
		service.userRegister(vo);

		return "login.jsp";
	}

	@RequestMapping(value = "/userLogin", method = RequestMethod.POST)
	public String login(UserVO userVo, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();

		Map<String, UserVO> login = service.login(userVo);

		if (login != null) {
			System.out.println("1");
			session.setAttribute("userId", userVo.getUserId());
			session.setAttribute("userPw", userVo.getUserPw());
			session.setAttribute("user", login);
		} else {
			System.out.println("2");
			session.setAttribute("user", "tlqkf");
		}

		return "logintest.jsp";
	}
}
