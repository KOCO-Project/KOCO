package co.kr.koco.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import co.kr.koco.service.CommentService;
import co.kr.koco.service.CultureService;
import co.kr.koco.service.QnaBoardService;
import co.kr.koco.service.UserService;
import co.kr.koco.vo.BoardVO;
import co.kr.koco.vo.CommentVO;
import co.kr.koco.vo.PageVO;
import co.kr.koco.vo.UserVO;

@Controller
@SessionAttributes("admin")
public class AdminController {

	@Autowired
	private CultureService cultureService;

	@Autowired
	private QnaBoardService qnaBoardService;
	
	@Resource(name = "CommentService")
	private CommentService commentService;
	
	@Autowired
	private UserService userService;

	@Resource(name = "userVO")
	@Lazy
	private UserVO userVO;

	@RequestMapping("/adminMain")
	public String adminMain(UserVO userVo, Model model) throws Exception {
		model.addAttribute("userList", userService.userList(userVo));
		return "admin/adminMain";
	}

	@RequestMapping("/adminQnaList")
	public String qnaList() {
		return "admin/adminQnaList";
	}

	@RequestMapping("/adminFreeList")
	public String adminFreeList() {
		return "admin/adminFreeList";
	}

	@RequestMapping("/adminEventList")
	public String adminEventList() {
		return "admin/adminEventList";
	}

	@RequestMapping("/adminNotiList")
	public String adminNotiList() {
		return "admin/adminNotiList";
	}

	@RequestMapping("/adminTest")
	public String adminTest() {
		return "admin/adminTest";
	}

	@RequestMapping("/getAdminTest")
	public String getAdminTest(@ModelAttribute CommentVO vo,Model model) {
		
		List<CommentVO> commentList = commentService.commentList(vo);
		model.addAttribute("commentList", commentList);
		
		return "admin/getAdminTest";
	}
	@RequestMapping("/commentRegister")
	public String commentRegister(CommentVO vo) {
		commentService.commentRegister(vo);
		return "redirect:getAdminTest";
	}
	@RequestMapping("/commentDelete")
	public String commentDelete(int commentNo) {
		commentService.commentDelete(commentNo);
		return "redirect:getAdminTest";
	}

	
	@RequestMapping("commentUpdateForm")
	public String commentUpdateForm(int commentNo,Model model) {
		model.addAttribute("comment", commentService.commentGet(commentNo));
		return "admin/commentUpdateForm";
	}
	
	@RequestMapping("commentUpdate")
	public String commentUpdate(@ModelAttribute("comment") CommentVO vo) {
		commentService.commentUpdate(vo);		
		return "redirect:getAdminTest";
	}
}
