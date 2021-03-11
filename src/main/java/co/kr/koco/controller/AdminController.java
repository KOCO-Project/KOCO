package co.kr.koco.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import co.kr.koco.service.CommentService;
import co.kr.koco.service.CultureService;
import co.kr.koco.service.QnaBoardService;
import co.kr.koco.service.UserService;
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
		model.addAttribute("groupNo", (Integer)commentService.commentGetGroupNo());
		return "admin/getAdminTest";
	}
	
	@RequestMapping("/commentRegister")
	public String commentRegister(CommentVO vo) {
		commentService.commentRegister(vo);
		return "redirect:getAdminTest";
	}
	
	@RequestMapping("/comcommentRegister")
	public String comcommentRegister(CommentVO vo) {
		commentService.comcommentRegister(vo);
		return "redirect:getAdminTest";
	}
	
	@RequestMapping("/commentDelete")
	public String commentDelete(int groupNo) {
		commentService.commentDelete(groupNo);
		return "redirect:getAdminTest";
	}

	@RequestMapping("/comcommentDelete")
	public String comcommentDelete(int commentNo) {
		commentService.comcommentDelete(commentNo);
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
	
	@RequestMapping("adminUserList")
	public String adminUserList(@ModelAttribute UserVO vo,@RequestParam(value = "page", defaultValue = "1") int page, Model model,@RequestParam(value="searchKeyword" ,required=false)String searchKeyword,@RequestParam(value="searchCondition" ,defaultValue = "ID")String searchCondition) throws Exception{
		
		List<UserVO> adminUserList = userService.getAdminUserList(vo, page);
		model.addAttribute("adminUserList", adminUserList);
		
		PageVO pageVO = userService.getAdminUserCnt(vo, page);
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("page", page);
		
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("searchCondition", searchCondition);
		
		return "admin/adminUser";
	}
	
	@RequestMapping("adminUserDelete")
	public String adminUserDelete(int userNo) throws Exception{
		userService.adminUserDelete(userNo);
		return "redirect:adminUserList";
	}
	
	@RequestMapping("adminSimpleUpdate")
	public String adminSimpleUpdate(@ModelAttribute("user") UserVO vo) throws Exception{
		userService.adminSimpleUpdate(vo);
		return "redirect:adminUserList";
	}
	
	@RequestMapping("adminGetUser")
	public String adminGetUser(int userNo, Model model) throws Exception{
		model.addAttribute("getUser",userService.adminGetUser(userNo));
		return "admin/adminGetUser";
	}
	
	@RequestMapping("adminUserUpdateForm")
	public String adminUserUpdateForm(int userNo, Model model) throws Exception{
		model.addAttribute("getUser",userService.adminGetUser(userNo));
		return "admin/adminUserUpdateForm";
	}
	
	@RequestMapping("adminUserUpdate")
	public String adminUserUpdate(@ModelAttribute("user") UserVO vo) throws Exception{
		userService.adminUserUpdate(vo);
		return "redirect:adminGetUser?userNo="+vo.getUserNo();
	}
}
