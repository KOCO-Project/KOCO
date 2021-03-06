package co.kr.koco.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.kr.koco.service.FollowService;
import co.kr.koco.vo.FollowVO;
import co.kr.koco.vo.UserVO;

@Controller
public class FollowController {
	@Autowired
	private FollowService followService;
	
	@Resource(name = "followVO")
	@Lazy
	private FollowVO followVO;
	
	@Resource(name = "userVO")
	@Lazy
	private UserVO userVO;
	
	@RequestMapping("/follow")
	public String follow(@RequestParam(value = "toFollow") String toFollow, FollowVO followVo, HttpSession session) throws Exception {
		//session = request.getSession();
		String from = (String) session.getAttribute("from");
		System.out.println(from);
		//followVO.setFromFollow(userVO.getUserNickname());
		followVo.setFromFollow(from);
		followVo.setToFollow(toFollow);
		followService.follow(followVo);
		
		return "redirect:mypage";
	}
	
	@RequestMapping("/followerList")
	public String followerList(Model model, @RequestParam(value = "toFollow") String toFollow) throws Exception {
		model.addAttribute("followerList", followService.followerList(toFollow));
		System.out.println(toFollow);
		return "users/followerList";
	}
	
}
