package co.kr.koco.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import co.kr.koco.service.EventBoardService;
import co.kr.koco.vo.BoardVO;
import co.kr.koco.vo.Criteria;
import co.kr.koco.vo.PageDTO;

@Controller		
//@RequestMapping(value="/eventboard")		
public class EventBoardController {

	@Autowired
	private EventBoardService service;
	
	@GetMapping("/eventRegister")
	public String register() {
		return "eventboard/register";
	}
	
    @PostMapping("/eventRegister")	// 등록에 대한 처리
    public String register(BoardVO event, RedirectAttributes rttr) {
    	service.eventBoardRegister(event);
    	rttr.addFlashAttribute("result", event.getBoardNo());
    	return "redirect:/eventboard/list";
    }

//	@GetMapping("/list")
	@RequestMapping(value="/eventList", method=RequestMethod.GET)
	public String list(Criteria cri, Model model) {
		model.addAttribute("infoNo", 3);
//		model.addAttribute("infoName", service.getBoardInfoName(infoNo));
		model.addAttribute("list", service.getListWithPaging(cri));
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		return "eventboard/list3";
	}

    @GetMapping({"/eventGet"})
    public String get(@RequestParam("boardNo")int bno,@ModelAttribute("cri") Criteria cri,Model model) {
 	   model.addAttribute("event",service.getEventBoard(bno));
 	  return "eventboard/get";
    }
    @GetMapping({"/getEventUpdate"})
    public String update(@RequestParam("boardNo")int bno,@ModelAttribute("cri") Criteria cri,Model model) {
 	   model.addAttribute("event",service.getEventBoardUpdate(bno));
 	  return "eventboard/update";
    }

    @PostMapping("/postEvnetUpdate")
	public String update(@RequestParam("pageNum")int pageNum,@RequestParam("amount")int amount,BoardVO event,Criteria cri, RedirectAttributes rttr) {
		
		int count = service.postEventBoardUpdate(event);
		
		if(count == 1) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		return "redirect:/eventboard/list";
//		return "redirect:/eventboard/list?pageNum={pageNum}&amount={amount}";
		
	}

    @PostMapping("/eventDelete")
	public String delete(@RequestParam("boardNo") int bno,Criteria cri, RedirectAttributes rttr) {
		
		int count = service.eventBoardDelete(bno);
		
		if(count == 1) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		return "redirect:/eventboard/list";
	}
	
//  @GetMapping("/list")		// 목록에 대한 처리
//  public void list(Model model) {
//  	log.info("list");
//  	model.addAttribute("list", service.getList());
//  }

    
//  @GetMapping("/get")			// 상세보기에 대한 처리
//  public void eventGet(@RequestParam("bno") Long bno, Model model) {
//  	log.info("/get  ");
//  	model.addAttribute("event", service.get(bno));
//  }

//  @PostMapping("/update")		// 수정에 대한 처리
//  public String eventUpdate(EventVO event, RedirectAttributes rttr) {
//  	log.info("modify:" + event);
// 
//  	if (service.modify(event)) {
//  		rttr.addFlashAttribute("result", "success");
//  	}
//  	return "redirect:/eventboard/list";
//  }

    
//  @PostMapping("/delete")		// 삭제에 대한 처리
//  public String EventDelete(@RequestParam("bno") Long bno, RedirectAttributes rttr)
//  {
//
//  	log.info("remove..." + bno);
//  	if (service.remove(bno)) {
//  		rttr.addFlashAttribute("result", "success");
//  	}
//  	return "redirect:/eventboard/list";
//  }
  
    
}
