package co.kr.koco.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.kr.koco.service.TopMenuService;

@Controller
public class HomeController {

	@Autowired
	TopMenuService topMenuService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		return "main";
	}

	@RequestMapping("/main")
	public String main(Model model) {
		return "main";

	}

	@RequestMapping(value = "/loginView")
	public String loginView() {
		return "users/login";
	}

	@RequestMapping(value = "/registerView")
	public String registerView() {
		return "users/userRegister";
	}

	@RequestMapping("/adminMain")
	public String adminMain() {
		return "admin/adminMain";
	}

}
