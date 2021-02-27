package co.kr.koco.controller;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
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
		
		boolean check = service.userNicknameExist(userNickname);

		if (check) {
			out.println("1"); // 닉네임 사용 가능
		} else {
			out.println("0"); // 닉네임 중복
		}
	}
	
	@PostMapping("/userEmailExist")
	public void userEmailExist(@RequestParam(value = "userEmail") String userEmail,
			HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		
		boolean check = service.userEmailExist(userEmail);

		if (check) {
			out.println("1"); // 이메일 사용 가능
		} else {
			out.println("0"); // 이메일 중복
		}
	}

	@PostMapping("/userRegister")
	public String userRegister(@Valid UserVO vo, BindingResult result) throws Exception {
//		if(result.hasErrors()) {
//			List<ObjectError> list = result.getAllErrors();
//			for(ObjectError error : list) {
//				System.out.println(error);
//			}
//			return "userRegister";
//		}
		
		service.userRegister(vo);

		return "users/login";
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

		return "users/logintest";
	}

	@RequestMapping("/userLogout")
	public String logout(HttpSession session) {
		session.invalidate();

		return "users/login";
	}

	@GetMapping("/mypage")
	public String mypage() throws Exception {		
		return "users/mypage";
	}
}
