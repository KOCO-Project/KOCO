package co.kr.koco.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	// 글 목록 검색
	@RequestMapping("/cultureList")
	public String getCultureList(@ModelAttribute CultureVO vo,@RequestParam(value = "page", defaultValue = "1") int page, Model model,@RequestParam(value="searchKeyword" ,required=false)String searchKeyword,@RequestParam(value="searchCondition" ,required=false)String searchCondition) {
		
		List<CultureVO> cultureList = cultureService.getCultureBoardList(vo, page);
		model.addAttribute("cultureList",cultureList);

		// Model 정보 저장
		PageVO pageVO = cultureService.getCultureBoardCnt(vo, page);
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("page", page);

		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("searchCondition", searchCondition);
		
		return "culture/list"; // View 이름 리턴
	}
	
	@RequestMapping("/cultureMain")
	public String cultureMain(@ModelAttribute CultureVO vo, Model model) {
		List<CultureVO> cultureList = cultureService.getCultureMainList(vo);
		model.addAttribute("cultureList",cultureList);
		return "culture/cultureMain"; // View 이름 리턴
	}

	// 검색 조건 목록 설정
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		conditionMap.put("작성자", "NICKNAME");
		return conditionMap;
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
}
