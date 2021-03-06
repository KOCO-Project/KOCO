package co.kr.koco.controller;

import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
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
	public void follow(@RequestParam(value = "toFollow") String toFollow, FollowVO followVo, HttpSession session,
			HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		String from = (String) session.getAttribute("from");

		followVo.setFromFollow(from);
		followVo.setToFollow(toFollow);
		followService.follow(followVo);

		out.println("성공");
	}

	@RequestMapping("/unfollow")
	public void unfollow(@RequestParam(value = "toFollow") String toFollow, FollowVO followVo, HttpSession session,
			HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		String from = (String) session.getAttribute("from");
		
		followVo.setFromFollow(from);
		followVo.setToFollow(toFollow);
		followService.unfollow(followVo);
		
		out.println("성공");
	}

	@RequestMapping("/followerList")
	public String followerList(Model model, @RequestParam(value = "toFollow") String toFollow, FollowVO followVo)
			throws Exception {
		model.addAttribute("followerList", followService.followerList(toFollow));
		model.addAttribute("selectUser", toFollow);

		return "users/followerList";
	}

	@RequestMapping("/followingList")
	public String followingList(Model model, @RequestParam(value = "fromFollow") String fromFollow) throws Exception {
		model.addAttribute("followingList", followService.followingList(fromFollow));
		model.addAttribute("selectUser", fromFollow);

		return "users/followingList";
	}

}
