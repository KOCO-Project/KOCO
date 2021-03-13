package co.kr.koco.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import co.kr.koco.service.CommentService;
import co.kr.koco.service.CultureService;
import co.kr.koco.service.EventBoardService;
import co.kr.koco.service.FreeBoardService;
import co.kr.koco.service.QnaBoardService;
import co.kr.koco.service.UserService;
import co.kr.koco.vo.BoardVO;
import co.kr.koco.vo.CommentVO;
import co.kr.koco.vo.Criteria;
import co.kr.koco.vo.PageDTO;
import co.kr.koco.vo.PageVO;
import co.kr.koco.vo.UserVO;

@Controller
@SessionAttributes("admin")
public class AdminController {

	@Autowired
	private CultureService cultureService;

	@Autowired
	private QnaBoardService qnaBoardService;

	@Autowired
	private FreeBoardService freeBoardService;
	
	@Autowired
	private EventBoardService eventBoardService;
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
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
	public String qnaList(@RequestParam(value = "infoNo", defaultValue = "2") int infoNo,
			  @RequestParam(value = "page", defaultValue = "1") int page,@ModelAttribute BoardVO vo,@RequestParam(value="searchKeyword" ,required=false)String searchKeyword,@RequestParam(value="searchCondition" ,required=false)String searchCondition, Model model) {
		model.addAttribute("infoNo", infoNo);
		String infoName = qnaBoardService.getBoardInfoName(infoNo);
		model.addAttribute("infoName", infoName);
		
		List<BoardVO> qnaList = qnaBoardService.getQnaBoardList(vo, page);
		model.addAttribute("qnaList",qnaList);

		PageVO pageVO = qnaBoardService.getQnaBoardCnt(vo, page);
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("page", page);

		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("searchCondition", searchCondition);
		
		return "admin/adminQnaList";
	}

	@RequestMapping("/adminFreeList")
	public String adminFreeList(@RequestParam(value = "infoNo", defaultValue = "1") int infoNo, @RequestParam(value = "page", defaultValue = "1") int page, 
			BoardVO freeBoardVO, Model model, @RequestParam(value="searchKeyword" ,required=false)String searchKeyword, @RequestParam(value="searchCondition", defaultValue="TITLE")String searchCondition) {
		
		model.addAttribute("infoNo", infoNo);
		String infoName = freeBoardService.getBoardInfoName(infoNo);
		model.addAttribute("infoName", infoName);
		//freeBoardVO.setBoardCategory(infoNo);
		
		List<BoardVO> freeBoardList = freeBoardService.freeBoardList(page, freeBoardVO);
		model.addAttribute("freeBoardList", freeBoardList);
		
		PageVO pageVO = freeBoardService.getfreeBoardCnt(page, freeBoardVO);
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("page", page);
		
		model.addAttribute("searchCondition", searchCondition);
		model.addAttribute("searchKeyword", searchKeyword);
		
		return "admin/adminFreeList";
	}

	@RequestMapping("/adminEventList")
	public String adminEventList(Criteria cri, Model model) {
		model.addAttribute("infoNo", 3);
//		model.addAttribute("infoName", service.getBoardInfoName(infoNo));
//		model.addAttribute("eventBoardList", eventBoardService.getListWithPaging(cri));
		int total = eventBoardService.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
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
	
	@RequestMapping("supportMailForm")
	public String supportMailForm() throws Exception{
		return "admin/supportMailForm";
	}
	
	@RequestMapping("supportMail")
	public String supportMail(@RequestParam(value = "email") String email,@RequestParam(value = "example") String example,@RequestParam(value = "content") String content, HttpServletResponse response) throws Exception{
		
		String setFrom = email;
		String setTo = "kocomuzi@gmail.com";
		String mailTitle = "[KOCO " + example +"] 문의가 들어왔습니다.";
		String mailContent = content;

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
		
		return "main";
	}
	
	@RequestMapping("qnaDeleteList")
	public String qnaDeleteList(@RequestParam("check") List<Integer> ids) throws Exception{
		
		for(Integer id : ids) {
		System.out.println(id);	
		qnaBoardService.deleteQnaBoard(id);
		}

		return "redirect:adminQnaList";
	}
	
	@RequestMapping("freeDeleteList")
	public String deleteList(@RequestParam("check") List<Integer> ids) throws Exception{
		
		for(Integer id : ids) {
		System.out.println(id);	
		freeBoardService.freeBoardDelete(id);
		}

		return "redirect:adminFreeList";
	}
	
}
