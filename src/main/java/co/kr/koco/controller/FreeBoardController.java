package co.kr.koco.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import co.kr.koco.service.FreeBoardService;
import co.kr.koco.vo.BoardVO;

@Controller
@SessionAttributes("board")
public class FreeBoardController {
	@Autowired
	private FreeBoardService freeBoardService; 

	//글 등록
	@RequestMapping("/boardRegister.do")
	public String boardRegister(BoardVO freeBoardVO) {
		freeBoardService.boardRegister(freeBoardVO);
		
		return "freeBoardList.do";
	}
	
	//글 수정
	@RequestMapping("/boardUpdate.do")
	public String boardUpdate(@ModelAttribute("board") BoardVO freeBoardVO) {
		freeBoardService.boardUpdate(freeBoardVO);
		
		return "freeBoardList.do";
	}
	
	// 글 삭제 
	@RequestMapping("/boardDelete.do")
	public String boardDelete(BoardVO freeBoardVO) {
		freeBoardService.boardDelete(freeBoardVO);
		
		return "freeBoardList.do";
	}
	
	// 글 상세 조회
	public String getFreeBoard(BoardVO freeBoardVO, Model model) {
		model.addAttribute("board");
		
		return "getFreeBoard.jsp";
	}
	
	// 검색 조건 목록 설정
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap(){
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		
		return conditionMap;
	}
	
	// 글 목록 검색
	public String freeBoardList(BoardVO freeBoardVO, Model model) {
		
		if(freeBoardVO.getSearchCondition() == null) freeBoardVO.setSearchCondition("TITLE");
		if(freeBoardVO.getSearchKeyword() == null) freeBoardVO.setSearchKeyword("");
		
		model.addAttribute("boardList", freeBoardService.freeBoardList(freeBoardVO));
		
		return "freeBoardList.jsp";
	}
}
