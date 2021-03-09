package co.kr.koco.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.RequestScope;
import org.springframework.web.context.annotation.SessionScope;

import co.kr.koco.service.CommentService;
import co.kr.koco.service.QnaBoardService;
import co.kr.koco.vo.BoardVO;
import co.kr.koco.vo.CommentVO;
import co.kr.koco.vo.PageVO;
import co.kr.koco.vo.UserVO;

@Controller
public class QnaBoardController {
	
	@Autowired
	private QnaBoardService qnaBoardService;
	
	@Resource(name = "CommentService")
	private CommentService commentService;
	
	@Resource(name="userVO")
	@Lazy
	private UserVO userVO;
	
	@GetMapping("/qnalist")
	public String qnaList(@RequestParam("infoNo") int infoNo,
						  @RequestParam(value = "page", defaultValue = "1") int page,
						   Model model) {
		
		model.addAttribute("infoNo", infoNo);
		String infoName = qnaBoardService.getBoardInfoName(infoNo);
		model.addAttribute("infoName", infoName);
		
		List<BoardVO> qnaList = qnaBoardService.getQnaBoardList(infoNo, page);
		model.addAttribute("qnaList",qnaList);

		PageVO pageVO = qnaBoardService.getQnaBoardCnt(infoNo, page);
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("page", page);

		return "qna/list";
	}
	
	@GetMapping("/getQna")
	public String getQnaBoard(@ModelAttribute CommentVO vo,@RequestParam("infoNo") int infoNo,
					   @RequestParam("boardNo") int boardNo,
					   @RequestParam("page") int page,
					   Model model) {
		model.addAttribute("infoNo", infoNo);
		model.addAttribute("boardNo", boardNo);
		
		BoardVO readContent = qnaBoardService.getQnaBoard(boardNo);
		model.addAttribute("readContentBean", readContent);
		
		model.addAttribute("userVO", userVO);
		model.addAttribute("page", page);
		
		List<CommentVO> commentList = commentService.commentList(vo);
		model.addAttribute("commentList", commentList);
		return "qna/getQnaBoard";
	}
	
	@GetMapping("/qnaRegister")
	public String qnaRegister(@ModelAttribute("regQnaBoardVO")BoardVO regQnaBoardVO,
						   @RequestParam("infoNo")int infoNo) {
		regQnaBoardVO.setBoardCategory(infoNo);
		return "qna/register";
	}
	
	@PostMapping("/regQna_pro")
	public String qnaRegisterPro(@Valid @ModelAttribute("regQnaBoardVO") BoardVO regQnaBoardVO, BindingResult result,@RequestParam("userNo") int userNo) {
		if(result.hasErrors()) {
			System.out.println("글쓰기 에러");
			return "qna/register";
		}
		regQnaBoardVO.setUserNo(userNo);
		qnaBoardService.getQnaBoardRegister(regQnaBoardVO);
		return "qna/qnaRegister_pro";
	}
	
	@GetMapping("/ansRegister")
	public String ansRegister(@ModelAttribute("ansQnaBoardVO")BoardVO ansQnaBoardVO,
			@RequestParam("infoNo") int infoNo,
			@RequestParam("boardNo") int boardNo) {
		System.out.println("ansRegister");
		ansQnaBoardVO.setBoardCategory(infoNo);
		ansQnaBoardVO.setParent(boardNo);

		return "qna/answer_register";
	}
	
	@PostMapping("/ansRegister_pro")
	public String ansRegisterPro(@ModelAttribute("ansQnaBoardVO") BoardVO ansQnaBoardVO, 
			@RequestParam("userNo") int userNo, HttpServletRequest request, Model model) {
		System.out.println("ansRegister Pro");
		ansQnaBoardVO.setUserNo(userNo);
		ansQnaBoardVO.setSequence(1);
		model.addAttribute("ansQnaBoardVO", ansQnaBoardVO);
		model.addAttribute("userVO", userVO);
		qnaBoardService.getQnaBoardRegister(ansQnaBoardVO);
		return "qna/answer_register_pro";
	}
	
	@GetMapping("/qnaupdate")
	public String qnaUpdate(@RequestParam("infoNo") int infoNo,
						 @RequestParam("boardNo") int boardNo,
						 @ModelAttribute("qnaUpdateBoardVO") BoardVO qnaUpdateBoardVO,
						 @RequestParam("page") int page,
						 Model model) {
		
		model.addAttribute("infoNo", infoNo);
		model.addAttribute("boardNo", boardNo);
		model.addAttribute("page", page);
		
		BoardVO tempBoardVO = qnaBoardService.getQnaBoard(boardNo);
		qnaUpdateBoardVO.setUserNo(tempBoardVO.getUserNo());
		qnaUpdateBoardVO.setBoardRegdate(tempBoardVO.getBoardRegdate());
		qnaUpdateBoardVO.setBoardTitle(tempBoardVO.getBoardTitle());
		qnaUpdateBoardVO.setBoardContent(tempBoardVO.getBoardContent());
		qnaUpdateBoardVO.setUploadFile(tempBoardVO.getUploadFile());
		qnaUpdateBoardVO.setWriter(tempBoardVO.getWriter());
		qnaUpdateBoardVO.setBoardNo(boardNo);
		qnaUpdateBoardVO.setBoardCategory(infoNo);
		
		return "qna/update";
	}
	
	@PostMapping("/qnaUpdate_pro")
	public String qnaUpdatePro(@Valid @ModelAttribute("qnaUpdateBoardVO") BoardVO qnaUpdateBoardVO,
							BindingResult result,
							@RequestParam("page") int page,
							Model model) {
		model.addAttribute("page", page);
		if(result.hasErrors()) {
			System.out.println("수정 에러");
			return "qna/update";
		}
		qnaBoardService.updateQnaBoard(qnaUpdateBoardVO);
		return "qna/qnaUpdate_pro";
	}
	
	@GetMapping("/qnadelete")
	public String qnaDelete(@RequestParam("infoNo") int infoNo,
					 	 @RequestParam("boardNo") int boardNo,
					 	 Model model) {
		qnaBoardService.deleteQnaBoard(boardNo);
		model.addAttribute("infoNo", infoNo);
		return "qna/delete";
	}
	
	@GetMapping("/not_login")
	public String regFail() {
		return "users/not_login";
	}
	
	@GetMapping("/not_writer")
	public String fail() {
		return "qna/not_writer";
	}
	
}
