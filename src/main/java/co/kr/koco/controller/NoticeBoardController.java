package co.kr.koco.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.kr.koco.service.NoticeService;
import co.kr.koco.vo.NoticeVO;
import co.kr.koco.vo.PageVO;

@Controller
public class NoticeBoardController {
	@Autowired
	private NoticeService service;

	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		conditionMap.put("작성자", "NICKNAME");
		
		return conditionMap;
	}

	@RequestMapping("/noticeList")
	public String getNoticeList(@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam(value = "searchKeyword", required = false) String searchKeyword,
			@RequestParam(value = "searchCondition", required = false) String searchCondition, NoticeVO noticeVo,
			Model model) {
		model.addAttribute("noticeList", service.getNoticeList(noticeVo, page));

		PageVO pageVO = service.getNoticeCnt(noticeVo, page);
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("page", page);
		
		model.addAttribute("searchKeyword", searchKeyword);
		model.addAttribute("searchCondition", searchCondition);

		return "notice/list";
	}

	@RequestMapping("/getNoticeBoard")
	public String getNoticeBoard(int noticeNo, Model model) {
		model.addAttribute("notice", service.getNoticeBoard(noticeNo));

		return "notice/get";
	}

	@RequestMapping("/noticeRegisterView")
	public String noticeRegisterView() {
		return "notice/register";
	}

	@RequestMapping("/noticeRegister")
	public String noticeRegister(NoticeVO noticeVo) {
		service.noticeRegister(noticeVo);

		return "redirect:noticeList";
	}
	
	@RequestMapping("/deleteNoticeBoard")
	public String deleteNoticeBoard(int noticeNo) {
		service.deleteNotice(noticeNo);
		
		return "redirect:noticeList";
	}
	
	@RequestMapping("/updateNoticeView")
	public String updateNoticeView(int noticeNo, Model model) {
		model.addAttribute("notice", service.getNoticeBoard(noticeNo));
		
		return "notice/update";
	}
	
	@RequestMapping("/updateNotice")
	public String updateNotice(NoticeVO noticeVo) {
		service.updateNotice(noticeVo);
		
		return "redirect:noticeList";
	}
}
