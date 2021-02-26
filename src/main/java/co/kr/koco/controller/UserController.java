package co.kr.koco.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.koco.service.UserService;
import co.kr.koco.vo.UserVO;

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
	
	@RequestMapping("/userLogout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "login.jsp";
	}

//	@GetMapping("/mypage")
//	public String mypage(HttpSession session, Model model) throws Exception {
//		String userId = (String) session.getAttribute("userId");
//		String userPw = (String) session.getAttribute("userPw");
//		
//		UserVO userVo = service.mypage(userId, userPw);
//		
//		model.addAttribute("userInfo", userVo);
//		
//		return "mypage.jsp";
//	}
}
