package co.kr.koco.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import co.kr.koco.service.CommentService;

import co.kr.koco.service.FreeBoardService;
import co.kr.koco.vo.BoardVO;
import co.kr.koco.vo.CommentVO;
import co.kr.koco.vo.HeartVO;
import co.kr.koco.vo.PageVO;
import co.kr.koco.vo.UserVO;

@Controller
@SessionAttributes("freeBoard") 
public class FreeBoardController {
	
	@Autowired
	private FreeBoardService freeBoardService; 
	@Resource(name = "CommentService")
	private CommentService commentService;
	@Resource(name="userVO")
	@Lazy
	private UserVO userVO;	
	
	// 글 등록 폼
	@RequestMapping(value="/freeBoardRegister", method=RequestMethod.GET)
	public String freeBoardRegisterView(@RequestParam("infoNo") int infoNo, @ModelAttribute("freeBoardVO") BoardVO freeBoardVO) {
		/* freeBoardService.freeBoardRegister(freeBoardVO); */
		freeBoardVO.setBoardCategory(infoNo);
		
		return "freeboard/freeBoardRegister";
	}
	
	// 글 등록 
	@RequestMapping(value="/freeBoardRegister", method=RequestMethod.POST)
	public String freeBoardRegister(@Valid @ModelAttribute("freeBoardVO") BoardVO freeBoardVO,  BindingResult result, @RequestParam("userNo") int userNo) {
		freeBoardVO.setUserNo(userNo);
		freeBoardService.freeBoardRegister(freeBoardVO);
		
		return "freeboard/freeBoardRegister_pro";
	}
	
	// 글 수정 폼
	@RequestMapping(value="/freeBoardUpdate", method=RequestMethod.GET)
	public String freeBoardUpdateView(@RequestParam("infoNo") int infoNo, @RequestParam("boardNo") int boardNo, 
			@ModelAttribute("freeBoardVO") BoardVO freeBoardVO, @RequestParam("page") int page, Model model) {
		
		model.addAttribute("infoNo", infoNo);
		model.addAttribute("boardNo", boardNo);
		model.addAttribute("page", page);
		
		BoardVO tempBoardVO = freeBoardService.getFreeBoard(boardNo);
		
		model.addAttribute("freeBoardVO", tempBoardVO);
		
		/* freeBoardService.freeBoardUpdate(freeBoardVO); */
		
		return "freeboard/freeBoardUpdate";
	}
	
	// 글 수정
	@RequestMapping(value="/freeBoardUpdate", method=RequestMethod.POST)
	public String freeBoardUpdate(@ModelAttribute("freeBoardVO") BoardVO freeBoardVO, @RequestParam("page") int page, Model model,  @RequestParam(value = "boardNo") int boardNo, @RequestParam(value = "infoNo") int infoNo) {
		model.addAttribute("page", page);
		
		BoardVO updateBoard = new BoardVO();
		
		updateBoard.setBoardCategory(infoNo);
		updateBoard.setBoardNo(boardNo);
		updateBoard.setBoardTitle(freeBoardVO.getBoardTitle());
		updateBoard.setBoardContent(freeBoardVO.getBoardContent());
		
		freeBoardService.freeBoardUpdate(updateBoard);
		
		return "freeboard/freeBoardUpdate_pro";
	}
	
	// 글 삭제
	@RequestMapping("/freeBoardDelete")
	public String freeBoardDelete(@RequestParam("infoNo") int infoNo, @RequestParam("boardNo") int boardNo, Model model) {
		freeBoardService.freeBoardDelete(boardNo);
		model.addAttribute("infoNo", infoNo);
		
		return "freeboard/freeBoardDelete";
	}
	
	// 글 상세 조회
	@RequestMapping("/getFreeBoard")
	public String getFreeBoard(@ModelAttribute CommentVO vo, @RequestParam("page") int page, @RequestParam("infoNo") int infoNo, @RequestParam("boardNo") int boardNo, BoardVO freeBoardVO, Model model) {
		
		model.addAttribute("infoNo", infoNo);
		model.addAttribute("boardNo", boardNo);
		
		BoardVO readContent = freeBoardService.getFreeBoard(boardNo);
		model.addAttribute("readContentBean", readContent);
		
		model.addAttribute("userVO", userVO);
		model.addAttribute("page", page);
	
		List<CommentVO> commentList = commentService.commentList(vo);
		model.addAttribute("commentList", commentList);
		model.addAttribute("groupNo", (Integer)commentService.commentGetGroupNo());
		
		return "freeboard/getFreeBoard";
	}
	
	// 검색 조건 목록 설정
	@ModelAttribute("conditionMap") //2가지 기능이 있는데 그 중 하나가 RequestMapping보다 먼저 실행!
	public Map<String, String> searchConditionMap(){
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		conditionMap.put("작성자", "NICKNAME");
	
		return conditionMap;
	}
	
	// 글 목록
	@RequestMapping("/freeBoardList")
	public String freeBoardList(@RequestParam(value = "infoNo", defaultValue = "1") int infoNo, @RequestParam(value = "page", defaultValue = "1") int page, 
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
				
		return "freeboard/freeBoardList";
	}
	
	// 댓글
	@RequestMapping("/freeCommentRegister")
	public String commentRegister(@ModelAttribute CommentVO vo, @RequestParam("boardNo") int boardNo,
			 Model model) {
		commentService.commentRegister(vo);
		model.addAttribute("infoNo", 1);
		model.addAttribute("boardNo", boardNo);
		//model.addAttribute("page", 1);

		return "redirect:getFreeBoard";
	}
	@RequestMapping("/freeCommentDelete")
	public String commentDelete(int groupNo,Model model,int boardNo) {
		commentService.commentDelete(groupNo);
		model.addAttribute("infoNo", 1);
		model.addAttribute("boardNo", boardNo);
		return "redirect:getFreeBoard";
	}
	
	@RequestMapping("/freeComcommentDelete")
	public String comcommentDelete(Model model,int boardNo,int commentNo) {
		commentService.comcommentDelete(commentNo);
		model.addAttribute("infoNo", 1);
		model.addAttribute("boardNo", boardNo);
		return "redirect:getFreeBoard";
	}
	
	@RequestMapping("/freeCommentUpdateForm")
	public String commentUpdateForm(int commentNo,Model model) {
		model.addAttribute("comment", commentService.commentGet(commentNo));
		return "freeboard/commentUpdateForm";
	}
	@RequestMapping("freeCommentUpdate")
	public String commentUpdate(@ModelAttribute("comment") CommentVO vo,Model model,int boardNo) {
		commentService.commentUpdate(vo);	
		model.addAttribute("infoNo", 1);
		model.addAttribute("boardNo", boardNo);
		return "redirect:getFreeBoard";
	}
	@RequestMapping("/freeComcommentRegister")
	public String comcommentRegister(@ModelAttribute CommentVO vo, @RequestParam("boardNo") int boardNo,
			 Model model) {
		commentService.comcommentRegister(vo);
		model.addAttribute("infoNo", 1);
		model.addAttribute("boardNo", boardNo);
		//model.addAttribute("page", 1);
		return "redirect:getFreeBoard";
	}
	
		// 좋아요 눌렀을때
	/*	@RequestMapping("/clickLike")
		@ResponseBody
		public Map<String, Object> clickLike(@RequestParam Map<String, Object> commandMap){
			int resultCode = 1;
			int likeCheck = 1;
			Map<String, Object> map = new HashMap<>();
			Map<String, Object> likecntMap = new HashMap<>();
			Map<String, Object> resultMap = new HashMap<>();
			try {
				map = freeBoardService.likeCheck(commandMap);
				if(map == null) {
					//처음 좋아요 누른것 likeCheck = 1, 좋아요 빨간색
					freeBoardService.insertLikeBtn(commandMap);
					freeBoardService.updateLikeCntPlus(commandMap);
					resultCode = 1;
				}
				else if(Integer.parseInt(map.get("likeCheck").toString())==0) {
					//좋아요 처음은 아니고 취소했다가 다시 눌렀을때 likeCheck = 1, 좋아요 빨간색
					commandMap.put("likeCheck",likeCheck);
					freeBoardService.updateLikeCheck(commandMap);
					freeBoardService.updateLikeCntPlus(commandMap);
					resultCode = 1;
				}
				else {
					//좋아요 취소한거 likeCheck=0, 빈하트
					likeCheck = 0;
					commandMap.put("likeCheck", likeCheck);
					freeBoardService.updateLikeCheck(commandMap);
					freeBoardService.updateLikeCntMinus(commandMap);
					resultCode = 0;
				}
				resultMap = freeBoardService.getLikeCnt(commandMap);
				resultMap.put("likeCheck", likeCheck);
			} catch(Exception e) {
				resultCode = -1;
			}
			resultMap.put("resultCode", resultCode);
			
			return resultMap;
		}*/
}
	
