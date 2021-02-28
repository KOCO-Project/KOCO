package co.kr.koco.controller;

import java.util.List;

import javax.annotation.Resource;
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

import co.kr.koco.service.QnaBoardService;
import co.kr.koco.vo.BoardVO;
import co.kr.koco.vo.PageVO;
import co.kr.koco.vo.UserVO;

@Controller
@RequestMapping("/qna")
public class QnaBoardController {
	
	@Autowired
	private QnaBoardService qnaBoardService;
	
	@Resource(name="userVO")
	@Lazy
	private UserVO userVO;
	
	@GetMapping("/qnaList")
	public String qnaList(@RequestParam("boardInfo") int boardInfo,
							   @RequestParam(value = "page", defaultValue = "1") int page,
							   Model model) {
		model.addAttribute("boardInfo", boardInfo);
		
		String boardInfoName = qnaBoardService.getBoardInfoName(boardInfo);
		model.addAttribute("boardInfoName", boardInfoName);
		
		List<BoardVO> qnaBoardList = qnaBoardService.getQnaBoardList(boardInfo, page);
		model.addAttribute("qnaBoardList",qnaBoardList);
		
		PageVO pageVO = qnaBoardService.getQnaBoardCnt(boardInfo, page);
		model.addAttribute("pageBean", pageVO);
		model.addAttribute("page", page);
		return "qna/qnaList";
	}
	
	@GetMapping("/getQnaBoard")
	public String getQnaBoard(@RequestParam("boardInfo") int boardInfo,
					   @RequestParam("boardNo") int boardNo,
					   @RequestParam("page") int page,
					   Model model) {
		model.addAttribute("boardInfo", boardInfo);
		model.addAttribute("boardNo", boardNo);
		
		BoardVO readContentBean = qnaBoardService.getQnaBoard(boardNo);
		model.addAttribute("readContentBean", readContentBean);
		
		model.addAttribute("userVO", userVO);
		model.addAttribute("page", page);
		
		return "qna/getQnaBoard";
	}
	
	@GetMapping("/qnaRegister")
	public String qnaRegister(@ModelAttribute("qnaBoardVO")BoardVO regQnaBoardVO,
						   @RequestParam("boardInfo")int boardInfo) {
		regQnaBoardVO.setBoardCategory(boardInfo);
		return "qna/qnaRegister";
	}
	
	@GetMapping("/qnaRegisterPro")
	public String qnaRegisterPro(@Valid @ModelAttribute("qnaBoardVO") BoardVO regQnaBoardVO, BindingResult result) {
		if(result.hasErrors()) {
			System.out.println("글쓰기 에러");
			return "qna/qnaRegister";
		}
		qnaBoardService.getQnaBoardRegister(regQnaBoardVO);
		return "qna/qnaRegister_pro";
	}
	
	@GetMapping("/qnaUpdate")
	public String qnaUpdate(@RequestParam("boardInfo") int boardInfo,
						 @RequestParam("boardNo") int boardNo,
						 @ModelAttribute("qnaUpdateBoardVO") BoardVO qnaUpdateBoardVO,
						 @RequestParam("page") int page,
						 Model model) {
		
		model.addAttribute("boardInfo", boardInfo);
		model.addAttribute("boardNo", boardNo);
		model.addAttribute("page", page);
		
		BoardVO tempBoardVO = qnaBoardService.getQnaBoard(boardNo);
		qnaUpdateBoardVO.setUserNo(tempBoardVO.getUserNo());
		qnaUpdateBoardVO.setBoardRegdate(tempBoardVO.getBoardRegdate());
		qnaUpdateBoardVO.setBoardTitle(tempBoardVO.getBoardTitle());
		qnaUpdateBoardVO.setBoardContent(tempBoardVO.getBoardContent());
		qnaUpdateBoardVO.setUploadFile(tempBoardVO.getUploadFile());
		qnaUpdateBoardVO.setUserNo(tempBoardVO.getUserNo());
		qnaUpdateBoardVO.setBoardNo(boardNo);
		qnaUpdateBoardVO.setBoardCategory(boardInfo);
		
		return "qna/qnaUpdate";
	}
	
	@PostMapping("/qnaUpdatePro")
	public String qnaUpdatePro(@Valid @ModelAttribute("qnaUpdateBoardVO") BoardVO qnaUpdateBoardVO,
							BindingResult result,
							@RequestParam("page") int page,
							Model model) {
		model.addAttribute("page", page);
		if(result.hasErrors()) {
			System.out.println("수정 에러");
			return "qna/qnaUpdate";
		}
		qnaBoardService.updateQnaBoard(qnaUpdateBoardVO);
		return "qna/qnaUpdate_pro";
	}
	
	@GetMapping("/qnaDelete")
	public String qnaDelete(@RequestParam("boardInfo") int boardInfo,
					 	 @RequestParam("boardNo") int boardNo,
					 	 Model model) {
		qnaBoardService.deleteQnaBoard(boardNo);
		model.addAttribute("boardInfo", boardInfo);
		return "qna/qnaDelete";
	}
	
	@GetMapping("/regFail")
	public String regFail() {
		return "qna/qnaRegister_fail";
	}
	
}
