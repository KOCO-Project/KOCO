package co.kr.koco.controller;

import java.io.PrintWriter;
import java.util.Random;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import co.kr.koco.service.FollowService;
import co.kr.koco.service.UserService;
import co.kr.koco.vo.FollowVO;
import co.kr.koco.vo.UserVO;

@Controller
public class UserController {
	@Autowired
	private UserService service;

	@Autowired
	private FollowService followService;

	@Autowired
	private JavaMailSenderImpl mailSender;

	@Resource(name = "userVO")
	@Lazy
	private UserVO userVO;

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
	public void userEmailExist(@RequestParam(value = "userEmail") String userEmail, HttpServletResponse response)
			throws Exception {
		PrintWriter out = response.getWriter();

		boolean check = service.userEmailExist(userEmail);

		if (check) {
			out.println("1"); // 이메일 사용 가능
		} else {
			out.println("0"); // 이메일 중복
		}
	}

	@PostMapping("/userRegister")
	public String userRegister(UserVO userVo) throws Exception {
		service.userRegister(userVo);

		return "users/login";
	}

	@PostMapping("/userLogin")
	public String login(UserVO userVo, HttpServletRequest request, HttpSession session) throws Exception {
		session = request.getSession();

		UserVO login = service.login(userVo);

		if (login != null) {
			session.setAttribute("user", login);
			session.setAttribute("from", login.getUserNickname());
			session.setAttribute("userNo", login.getUserNo());

			return "redirect:main";
		} else {
			session.setAttribute("user", null);
			return "users/login";
		}
	}

	@RequestMapping("/userLogout")
	public String logout(HttpSession session) {
		session.invalidate();

		return "main";
	}

	@RequestMapping("/loginView")
	public String loginView() {
		return "users/login";
	}

	@RequestMapping("/registerView")
	public String registerView() {
		return "users/userRegister";
	}

	@RequestMapping("/userUpdateView")
	public String userUpdateView() throws Exception {
		return "users/userUpdate";
	}

	@RequestMapping("/pwUpdateView")
	public String pwUpdateView() {
		return "users/pwUpdate";
	}

	@RequestMapping("/findUserInfo")
	public String findUserInfo() {
		return "users/findUserInfo";
	}

	@RequestMapping("/userUpdate")
	public String userUpdate(@RequestParam(value = "oldNick") String oldNick, @RequestParam(value = "newNick") String newNick, @RequestParam(value = "userId") String userId, UserVO userVo, FollowVO followVo, HttpSession session) throws Exception {
		userVo.setUserNickname(newNick);
		userVo.setUserId(userId);		
		service.userUpdate(userVo);
		
		followVo.setNewNick(newNick);
		followVo.setOldNick(oldNick);
		followService.updateFromFollow(followVo);
		followService.updateToFollow(followVo);
		
		session.invalidate();

		return "redirect:/";
	}

	@RequestMapping("/pwUpdate")
	public String pwUpdate(@RequestParam(value = "currentPw") String currentPw,
			@RequestParam(value = "newPw") String newPw, UserVO userVo, HttpSession session) throws Exception {
		service.pwUpdate(userVo);
		session.invalidate();

		return "redirect:/";
	}

	@GetMapping("/userPage")
	public String userPage(@RequestParam(value = "userNickname", required = false) String userNickname, UserVO userVo,
			Model model, HttpSession session, FollowVO followVo) throws Exception {
		UserVO userVO = service.userPage(userNickname);

		String fromFollow = (String) session.getAttribute("from");
		String toFollow = userNickname;

		if (fromFollow.equals(toFollow)) {
			model.addAttribute("selectUser", userVO);
			model.addAttribute("followerCnt", followService.followerCnt(userNickname));
			model.addAttribute("followingCnt", followService.followingCnt(userNickname));
		} else {
			followVo.setFromFollow(fromFollow);
			followVo.setToFollow(toFollow);

			model.addAttribute("followyn", followService.followyn(followVo));
			model.addAttribute("selectUser", userVO);
			model.addAttribute("followerCnt", followService.followerCnt(userNickname));
			model.addAttribute("followingCnt", followService.followingCnt(userNickname));
		}

		return "users/userPage";
	}

	@RequestMapping("/sendAuthMail")
	public void sendAuthMail(@RequestParam(value = "userEmail") String email, HttpServletResponse response)
			throws Exception {
		PrintWriter out = response.getWriter();
		Random random = new Random();
		int num = random.nextInt(888888) + 111111;

		String setFrom = "kocomuzi@gmail.com";
		String setTo = email;
		String mailTitle = "KOCO에서 보내드리는 인증번호입니다.";
		String mailContent = "인증번호: " + num;

		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mail, true, "utf-8");

			helper.setFrom(setFrom);
			helper.setTo(setTo);
			helper.setSubject(mailTitle);
			helper.setText(mailContent);
			mailSender.send(mail);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String authKey = Integer.toString(num);

		out.println(authKey);
	}

	@GetMapping("/findIdPwd")
	public ModelAndView findIdPw(@RequestParam(value = "userEmail") String userEmail) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("users/findIdPw");
		mav.addObject("findUser", service.findIdPw(userEmail));

		return mav;
	}

}
