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
	
	@GetMapping("/list")
	public String qnaList(@RequestParam("infoNo") int infoNo, 
							@RequestParam(value = "page", defaultValue = "1") int page,
							Model model) {
		List<BoardVO> qnaList = qnaBoardService.getQnaList(infoNo);
		model.addAttribute("qnaList", qnaList);
		
		String boardInfoName = qnaBoardService.getBoardInfoName(infoNo);
		model.addAttribute("boardInfoName", boardInfoName);
		
		PageVO pageVO = qnaBoardService.getQnaCnt(infoNo,page);
		model.addAttribute("pageVO",pageVO);
		model.addAttribute("page", page);
		return "qna/list";
	}
	
	@GetMapping("/getQna")
	public String getQna() {
		return "qna/getQna";
	}
	
	
	@GetMapping("/registerQna")
	public String register(@ModelAttribute("qnaBoardVO") BoardVO qnaBoardVO, 
							@RequestParam("infoNo") int infoNo) {
		qnaBoardVO.setBoardCategory(infoNo);
		return "qna/register";
	}
	
	@PostMapping("/regQna_pro")
	public String qnaRegisterPro(@Valid @ModelAttribute("qnaBoardVO") BoardVO regQnaBoardVO, BindingResult result) {
		if(result.hasErrors()) {
			System.out.println("글쓰기 에러");
			return "qna/register";
		}
		qnaBoardService.register(regQnaBoardVO);
		return "qna/regQna_pro";
	}
	
	
	
	

	@GetMapping("/qnaUpdate")
	public String qnaUpdate() {
	
		return "qna/update";
	}
	
	@PostMapping("/qnaUpd_pro")
	public String qnaUpd_pro() {

		return "qna/qnaUpd_pro.jsp";
	}
	
	@GetMapping("/qnaDelete")
	public String delete() {

		
		return "qna/delete";
	}
	
	@GetMapping("/not_writer")
	public String not_writer() {
		return "qna/not_writer";
	}
	
	
	
}
