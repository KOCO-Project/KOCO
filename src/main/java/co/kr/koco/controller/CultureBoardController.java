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
	
	//글 목록 검색
	@RequestMapping("/cultureList")
	public String getCultureList(@ModelAttribute CultureVO vo,@RequestParam(value = "page", defaultValue = "1") int page, Model model,@RequestParam(value="searchKeyword" ,required=false)String searchKeyword,@RequestParam(value="searchCondition" ,required=false)String searchCondition) {
		
		//게시글 정보 저장
		List<CultureVO> cultureList = cultureService.getCultureBoardList(vo, page);
		model.addAttribute("cultureList",cultureList);

		//게시글 수 정보 저장
		PageVO pageVO = cultureService.getCultureBoardCnt(vo, page);
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("page", page);
		
		//파라미터 값으로 받은 검색키워드, 검색 컨디션 정보 저장
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("searchCondition", searchCondition);
		
		return "culture/list";
	}
	
	//홈페이지 메인 게시글 출력
	@RequestMapping("/cultureMain")
	public String cultureMain(@ModelAttribute CultureVO vo, Model model) {

		//게시글 정보 저장
		List<CultureVO> cultureList = cultureService.getCultureMainList(vo);
		model.addAttribute("cultureList",cultureList);
		return "culture/cultureMain";
	}

	//검색 조건 목록 설정 *굳이 필요없는 없는 코드임
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		conditionMap.put("작성자", "NICKNAME");
		return conditionMap;
	}
	
	//게시글 등록 폼 이동
	@RequestMapping("/cultureRegisterForm")
	public String cultureRegisterForm() {
		return "culture/register";
	}
	
	//게시글 등록 기능
	@RequestMapping("/cultureRegister")
	public String cultureRegister(CultureVO vo) {
		cultureService.cultureRegister(vo);
		return "redirect:cultureList";
	}

	//게시글 상세보기 기능
	@RequestMapping("/getCultureBoard")
	public String getCultureBoard(int cultureNo, Model model) {
		
		//게시글 정보 저장
		model.addAttribute("culture", cultureService.getCultureBoard(cultureNo));
		return "culture/get";
	}

	//게시글 삭제
	@RequestMapping("/deleteCultureBoard")
	public String deleteCultureBoard(int cultureNo) {

		//게시글 삭제 기능
		cultureService.deleteCultureBoard(cultureNo);
		return "redirect:cultureList";
	}

	//게시글 수정 폼 이동
	@RequestMapping("cultureUpdateBoardForm")
	public String cultureUpdateBoard(int cultureNo, Model model) {

		//수정 폼에서 기존 게시물의 값을 출력하기 위해 getCultureBoard와 동일한 기능 실행
		model.addAttribute("culture", cultureService.getCultureBoard(cultureNo));
		return "culture/updateForm";
	}

	//게시글 수정 기능
	@RequestMapping("/cultureUpdateBoard")
	public String cultureUpdateBoard(@ModelAttribute("culture") CultureVO vo) {
		
		//vo에 새로운 값들을 넣어 수정 기능 실행
		cultureService.cultureUpdate(vo);
		return "redirect:cultureList";
	}
}
