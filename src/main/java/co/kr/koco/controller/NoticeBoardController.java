package co.kr.koco.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.kr.koco.service.NoticeService;
import co.kr.koco.vo.NoticeVO;
import co.kr.koco.vo.PageVO;

@Controller
public class NoticeBoardController {
	@Autowired
	private NoticeService service;
	
	@RequestMapping("/noticeList")
	public String getNoticeList(@RequestParam(value = "page", defaultValue = "1") int page, NoticeVO noticeVo, Model model) {
		model.addAttribute("noticeList", service.getNoticeList(noticeVo));
		
		PageVO pageVO = service.getNoticeCnt(page);
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("page", page);
		
		return "notice/list";
	}
}
