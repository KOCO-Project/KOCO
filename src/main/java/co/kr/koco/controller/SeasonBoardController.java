package co.kr.koco.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import co.kr.koco.service.SeasonService;
import co.kr.koco.vo.CultureVO;
import co.kr.koco.vo.PageVO;
import co.kr.koco.vo.SeasonVO;


@Controller
@SessionAttributes("season")

public class SeasonBoardController {
	
	@Autowired
	private SeasonService seasonService;
	
	@RequestMapping(value = "/seasonList")
	public String getSeasonList(@ModelAttribute SeasonVO vo,@RequestParam(value = "page", defaultValue = "1") int page, Model model,@RequestParam(value="searchKeyword" ,required=false)String searchKeyword,@RequestParam(value="searchCondition" ,required=false)String searchCondition) {
		
		model.addAttribute("seasonList", seasonService.getSeasonBoardList(vo,page));
		
		PageVO pageVO = seasonService.getSeasonBoardCnt(vo, page);
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("page", page);

		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("searchCondition", searchCondition);
		
		return "season/list";
	}
	
	@RequestMapping("/seasonMain")
	public String seasonMain(@ModelAttribute SeasonVO vo, Model model) {
		List<SeasonVO> seasonList = seasonService.getSeasonMainList(vo);
		model.addAttribute("seasonList",seasonList);
		return "season/seasonMain"; // View �씠由� 由ы꽩
	}
	
	
	@RequestMapping("/getSeasonBoard")
	public String getSeasonBoard(int seasonNo, Model model) {
		model.addAttribute("season", seasonService.getSeasonBoard(seasonNo));
		return "season/get";
	}
	
	@RequestMapping("/seasonRegisterForm")
	public String seasonRegisterForm(){
		return "season/register";
	}
	
	@RequestMapping("/seasonRegister")
	public String seasonRegister(SeasonVO vo) {
		seasonService.seasonRegister(vo);
		return "redirect:seasonList";
	}
	
	@RequestMapping("/deleteSeasonBoard")
	public String deleteSeasonBoard(int seasonNo) {
		seasonService.deleteSeasonBoard(seasonNo);
		return "redirect:seasonList";
	}
	
	@RequestMapping("/seasonUpdateBoardForm")
	public String seasonUpdateBoardForm(int seasonNo , Model model) {
		model.addAttribute("season", seasonService.getSeasonBoard(seasonNo));
		return "season/updateForm";
	}
	
	@RequestMapping("/seasonUpdateBoard")
	public String seasonUpdateBoard(@ModelAttribute("season") SeasonVO vo) {
		seasonService.seasonUpdate(vo);
		return "redirect:seasonList";
	}
}
