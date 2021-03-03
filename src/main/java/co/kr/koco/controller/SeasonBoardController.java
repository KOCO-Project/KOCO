package co.kr.koco.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import co.kr.koco.service.SeasonService;
import co.kr.koco.vo.SeasonVO;


@Controller
@SessionAttributes("season")

public class SeasonBoardController {
	
	@Autowired
	private SeasonService seasonService;
	
	@RequestMapping(value = "/seasonList")
	public String getSeasonList(@ModelAttribute SeasonVO vo,Model model) {
		model.addAttribute("seasonList", seasonService.getSeasonList(vo));
		return "season/list";
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
