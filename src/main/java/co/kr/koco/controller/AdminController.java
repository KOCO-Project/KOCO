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
	
	//adminController에서는 admin페이지의 모든 기능을 실행 시키기 위하여 각 기능의 service클래스를 import함
	
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

	//어드민 main으로 이동하기 위한 페이지였으나 현재 adminMain 미구현
	//	@RequestMapping("/adminMain")
	//	public String adminMain(UserVO userVo, Model model) throws Exception {
	//		model.addAttribute("userList", userService.userList(userVo));
	//		return "admin/adminMain";
	//	}
	
	/*유저관리 영역===================================*/
	
	//유저 정보 리스트 출력
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
	
	//유저 정보 삭제
	@RequestMapping("adminUserDelete")
	public String adminUserDelete(int userNo) throws Exception{
		userService.adminUserDelete(userNo);
		return "redirect:adminUserList";
	}
	
	//리스트에서 유저 정보 간단 수정
	@RequestMapping("adminSimpleUpdate")
	public String adminSimpleUpdate(@ModelAttribute("user") UserVO vo) throws Exception{
		userService.adminSimpleUpdate(vo);
		return "redirect:adminUserList";
	}
	
	//유저 정보 상세페이지
	@RequestMapping("adminGetUser")
	public String adminGetUser(int userNo, Model model) throws Exception{
		model.addAttribute("getUser",userService.adminGetUser(userNo));
		return "admin/adminGetUser";
	}
	
	//유저 정보 수정 폼 이동
	@RequestMapping("adminUserUpdateForm")
	public String adminUserUpdateForm(int userNo, Model model) throws Exception{
		model.addAttribute("getUser",userService.adminGetUser(userNo));
		return "admin/adminUserUpdateForm";
	}
	
	//유저 정보 수정
	@RequestMapping("adminUserUpdate")
	public String adminUserUpdate(@ModelAttribute("user") UserVO vo) throws Exception{
		userService.adminUserUpdate(vo);
		return "redirect:adminGetUser?userNo="+vo.getUserNo();
	}
	
	
	
	/* 문의메일 영역=================================== */
	
	//문의 메일 보내기 페이지 이동
	@RequestMapping("supportMailForm")
	public String supportMailForm() throws Exception{
		return "admin/supportMailForm";
	}
	
	//문의 메일 보내기
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
	
	
	/* admin page list 영역=================================== */
	
	//admin QnA 리스트 출력
	@RequestMapping("/adminQnaList")
	public String qnaList(@RequestParam(value = "infoNo", defaultValue = "2") int infoNo,@RequestParam(value = "page", defaultValue = "1") int page,@ModelAttribute BoardVO vo,@RequestParam(value="searchKeyword" ,required=false)String searchKeyword,@RequestParam(value="searchCondition" ,required=false)String searchCondition, Model model) {
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

	//admin freeBoard 리스트 출력
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

	//admin eventBoard 리스트 출력 (다만 현재 미구현)
	@RequestMapping("/adminEventList")
	public String adminEventList(Criteria cri, Model model) {
		model.addAttribute("infoNo", 3);
		int total = eventBoardService.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "admin/adminEventList";
	}
	
	//어드민 noti으로 이동하기 위한 페이지였으나 현재 adminMain 미구현
	@RequestMapping("/adminNotiList")
	public String adminNotiList() {
		return "admin/adminNotiList";
	}
	
	/* admin page checkBox delete영역=================================== */
	
	//QnA delete
	@RequestMapping("qnaDeleteList")
	public String qnaDeleteList(@RequestParam("check") List<Integer> ids) throws Exception{
		
		for(Integer id : ids) {
		System.out.println(id);	
		qnaBoardService.deleteQnaBoard(id);
		}

		return "redirect:adminQnaList";
	}
	
	//freeBoard delete	
	@RequestMapping("freeDeleteList")
	public String deleteList(@RequestParam("check") List<Integer> ids) throws Exception{
		
		for(Integer id : ids) {
		System.out.println(id);	
		freeBoardService.freeBoardDelete(id);
		}

		return "redirect:adminFreeList";
	}
	
	/* 댓글, 대댓글 영역=================================== */
	
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
}
