package co.kr.koco.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import co.kr.koco.service.CultureService;
import co.kr.koco.vo.CultureVO;
import co.kr.koco.vo.PageVO;

@Controller
@SessionAttributes("culture")
public class CultureBoardController {

	@Autowired
	private CultureService cultureService;

//	// 검색 조건 목록 설정
//	@ModelAttribute("conditionMap")
//	public Map<String, String> searchConditionMap() {
//		Map<String, String> conditionMap = new HashMap<String, String>();
//		conditionMap.put("제목", "TITLE");
//		conditionMap.put("내용", "CONTENT");
//		return conditionMap;
//	}

	// 글 목록 검색
	@RequestMapping("/cultureList")
	public String getCultureList(@ModelAttribute CultureVO vo,@RequestParam(value = "page", defaultValue = "1") int page, Model model) {

		List<CultureVO> cultureList = cultureService.getCultureBoardList(vo, page);
		model.addAttribute("cultureList",cultureList);

		PageVO pageVO = cultureService.getCultureBoardCnt(vo, page);
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("page", page);
		
		return "culture/list"; // View 이름 리턴
	}

	@RequestMapping("/cultureRegisterForm")
	public String cultureRegisterForm() {
		return "culture/register";
	}

	@RequestMapping("/cultureRegister")
	public String cultureRegister(CultureVO vo) {
		cultureService.cultureRegister(vo);
		return "redirect:cultureList";
	}

	@RequestMapping("/getCultureBoard")
	public String getCultureBoard(int cultureNo, Model model) {
		model.addAttribute("culture", cultureService.getCultureBoard(cultureNo));
		return "culture/get";
	}

	@RequestMapping("/deleteCultureBoard")
	public String deleteCultureBoard(int cultureNo) {
		cultureService.deleteCultureBoard(cultureNo);
		return "redirect:cultureList";
	}

	@RequestMapping("cultureUpdateBoardForm")
	public String cultureUpdateBoard(int cultureNo, Model model) {
		model.addAttribute("culture", cultureService.getCultureBoard(cultureNo));
		return "culture/updateForm";
	}

	@RequestMapping("/cultureUpdateBoard")
	public String cultureUpdateBoard(@ModelAttribute("culture") CultureVO vo) {
		cultureService.cultureUpdate(vo);
		return "redirect:cultureList";
	}
	
// 페이징 테스트	
//	@GetMapping("/listTest")
//	public String qnaList(@ModelAttribute CultureVO vo,@RequestParam(value = "page", defaultValue = "1") int page, Model model) {
//
//		List<CultureVO> cultureList = cultureService.getCultureBoardList(vo, page);
//		model.addAttribute("cultureList",cultureList);
//
//		PageVO pageVO = cultureService.getCultureBoardCnt(vo, page);
//		model.addAttribute("pageVO", pageVO);
//		model.addAttribute("page", page);
//
//		return "culture/listTest";
//	}
}
