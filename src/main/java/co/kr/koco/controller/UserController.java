package co.kr.koco.controller;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.kr.koco.service.UserService;
import co.kr.koco.vo.UserVO;

@Controller
public class UserController {
	@Autowired
	private UserService service;

	@PostMapping("/userIdExist")
	public void userIdExist(@RequestParam(value = "userId") String userId, HttpServletResponse response)
			throws Exception {
		PrintWriter out = response.getWriter();

		boolean check = service.userIdExist(userId);

		if (check) {
			out.println("1"); // 아이디 사용 가능
		} else {
			out.println("0"); // 아이디 중복
		}
	}

	@PostMapping("/userNicknameExist")
	public void userNicknameExist(@RequestParam(value = "userNickname") String userNickname,
			HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		
		boolean check = service.userIdExist(userNickname);

		if (check) {
			out.println("1"); // 닉네임 사용 가능
		} else {
			out.println("0"); // 닉네임 중복
		}
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
