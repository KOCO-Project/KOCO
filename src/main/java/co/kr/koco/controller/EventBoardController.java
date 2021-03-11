package co.kr.koco.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import co.kr.koco.service.EventBoardService;
import co.kr.koco.utils.UploadFileUtils;
import co.kr.koco.vo.BoardVO;
import co.kr.koco.vo.Criteria;
import co.kr.koco.vo.PageDTO;

@Controller		
//@RequestMapping(value="/eventboard")		
public class EventBoardController {

	@Autowired
	private EventBoardService service;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@GetMapping("/developer")
	public String developer() {
		return "eventboard/developer";
	}
	
	@GetMapping("/eventRegister")
	public String register() {
		return "eventboard/register";
	}
	
    @PostMapping("/eventRegister")	// 등록에 대한 처리
    public String register(BoardVO event, MultipartFile uploadFile, RedirectAttributes rttr) throws IOException, Exception {
    	
    	String imgUploadPath = uploadPath + File.separator + "imgUpload";
    	String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
    	String thumbFileName = null;

    	if(uploadFile != null) {
    		thumbFileName = UploadFileUtils.fileUpload(imgUploadPath, uploadFile.getOriginalFilename(), uploadFile.getBytes(), ymdPath); 
    	} else {
    		thumbFileName = uploadPath + File.separator + "images" + File.separator + "none.png";
    	}

    	event.setThumbnail("imgUpload" + ymdPath + File.separator + thumbFileName);
    	event.setFileName(thumbFileName);
    	
    	service.eventBoardRegister(event);
    	rttr.addFlashAttribute("result", event.getBoardNo());
    	return "redirect:/eventList";
    }

 // ck 에디터에서 파일 업로드
    @RequestMapping(value = "/ckUpload", method = RequestMethod.POST)
    public void postCKEditorImgUpload(HttpServletRequest req, HttpServletResponse res,
            @RequestParam MultipartFile upload) throws Exception {
     
     // 랜덤 문자 생성
     UUID uid = UUID.randomUUID();
     
     OutputStream out = null;
     PrintWriter printWriter = null;
       
     // 인코딩
     res.setCharacterEncoding("utf-8");
     res.setContentType("text/html;charset=utf-8");
     
     try {
      
      String fileName = upload.getOriginalFilename();// 파일 이름 가져오기
      byte[] bytes = upload.getBytes();
      
      // 업로드 경로
      String ckUploadPath = uploadPath + File.separator + "ckUpload" + File.separator + uid + "_" + fileName;
      
      out = new FileOutputStream(new File(ckUploadPath));
      out.write(bytes);
      out.flush();// out에 저장된 데이터를 전송하고 초기화
      
      String callback = req.getParameter("CKEditorFuncNum");
      printWriter = res.getWriter();
      String fileUrl = "/KOCO/ckUpload/" + uid + "_" + fileName; // 작성화면
      
      // 업로드시 메시지 출력
      printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
      
      printWriter.flush();
      
     } catch (IOException e) { e.printStackTrace();
     } finally {
      try {
       if(out != null) { out.close(); }
       if(printWriter != null) { printWriter.close(); }
      } catch(IOException e) { e.printStackTrace(); }
     }
     
     return; 
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
		return "redirect:eventboard/list";
//		return "redirect:/eventboard/list?pageNum={pageNum}&amount={amount}";
		
	}

//    @PostMapping("/eventDelete")
////    @RequestMapping(value="/eventDelete", method=RequestMethod.POST)
//	public String delete(@RequestParam("boardNo") int bno,Criteria cri, RedirectAttributes rttr) {
//		
//		int count = service.eventBoardDelete(bno);
//		
//		if(count == 1) {
//			rttr.addFlashAttribute("result", "success");
//		}
//		rttr.addAttribute("pageNum",cri.getPageNum());
//		rttr.addAttribute("amount",cri.getAmount());
//		return "redirect:eventboard/list3";
//	}
    
    @GetMapping("/eventDelete")
//  @RequestMapping(value="/eventDelete", method=RequestMethod.POST)
	public String delete(@RequestParam("boardNo") int bno,Criteria cri, RedirectAttributes rttr) {
		
		int count = service.eventBoardDelete(bno);
		
		if(count == 1) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum",cri.getPageNum());
		rttr.addAttribute("amount",cri.getAmount());
		return "eventboard/delete";
	}
}
