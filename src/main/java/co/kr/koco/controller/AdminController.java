package co.kr.koco.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.xml.stream.events.Comment;

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
		//여기 코드 작성 시작하면 된단다 태섭아 서비스,dao,매퍼 다 작성해야하고 이부분 끝나면
		//심플 업데이트말고 업데이트 부분 추가하면 어드민 유저 끝난다.
		//어드민 유저 끝내고나서는 지원이 누나꺼 기능 마저 구현하고
		//자유,질문,이벤트 게시판이 어드민에 필요할까? 한번에 많이 삭제할 수 있도록 체크박스 기능을 통해서 다수의 삭제를 할 수 있다면 그건 괜찮을 것 같아
		//어드민 페이지 디자인을 조금 만지고
		//메인 디자인 살짝살짝 만지고
		//메일기능 구현하고
		//토요일 일요일날 ppt하고 발표대본 작성하면 될 것 같음
		return "admin/adminGetUser";
	}
}
