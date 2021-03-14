package co.kr.koco.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
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
import co.kr.koco.vo.BookMarkVO;
import co.kr.koco.vo.PageVO;
import co.kr.koco.vo.UserVO;

@Controller		
//@RequestMapping(value="/eventboard")		
public class EventBoardController {

	@Autowired
	private EventBoardService service;
	
	@Resource(name="userVO")
	@Lazy
	private UserVO userVO;
	
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
    public String register(@RequestParam("userNo") int userNo, @ModelAttribute("event") BoardVO event, MultipartFile uploadFile, RedirectAttributes rttr) throws IOException, Exception {
    	
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
    	event.setUserNo(userNo);
    	service.eventBoardRegister(event);
//    	rttr.addFlashAttribute("result", event.getBoardNo());
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
    
    @GetMapping("/eventList")
	public String list(@RequestParam(value = "page", defaultValue = "1") int page,@ModelAttribute BoardVO event,
						   Model model) {
		
		List<BoardVO> list = service.getListWithPaging(event, page);
		model.addAttribute("list",list);

		PageVO pageVO = service.getEventBoardCnt(page);
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("page", page);

		return "eventboard/list3";
	}

    @GetMapping({"/eventGet"})
    public String eventGet(@RequestParam("boardNo")int bno,@RequestParam("page") int page,Model model) {
//		model.addAttribute("boardNo", bno);
    	model.addAttribute("userVO", userVO);
    	model.addAttribute("page", page);
 	   model.addAttribute("event",service.getEventBoard(bno));
		
 	  return "eventboard/get";
    }
    @GetMapping({"/getEventUpdate"})
    public String update(@RequestParam("boardNo")int bno,
    		@ModelAttribute("event") BoardVO event,
//			 @RequestParam("page") int page,
			 Model model) {
    	model.addAttribute("boardNo", bno);
//		model.addAttribute("page", page);
 	   model.addAttribute("event",service.getEventBoardUpdate(bno));
 	  return "eventboard/update";
    }

    @PostMapping("/postEventUpdate")
	public String postEventUpdate(
//			 @RequestParam("boardNo") int bno,
			@ModelAttribute("event")BoardVO event,
			Model model) {
    	
//    	model.addAttribute("boardNo", bno);
//    	model.addAttribute("page", page);
		service.postEventUpdate(event);
//		return "eventboard/update_pro";
		return "redirect:/eventboard/list3";
//		return "redirect:/eventboard/list?pageNum={pageNum}&amount={amount}";
		
	}

    @PostMapping("/eventDelete")
	public String delete(@ModelAttribute("event") BoardVO event, @RequestParam(value="boardNo") int bno, RedirectAttributes rttr, Model model) {
//		event.setBoardNo(bno);
    	service.eventBoardDelete(bno); 
		return "eventboard/delete";
	}
//    @GetMapping("/eventDelete")
////  @RequestMapping(value="/eventDelete", method=RequestMethod.GET)
//    public String eventDelete(@RequestParam("boardNo") int bno, Model model) {
//		service.eventBoardDelete(bno);
//		return "eventboard/delete";
//	}
   
    
    @PostMapping({"/bookmark"})
    public String bookmark(@RequestParam("userNo") int userNo, @RequestParam("boardCategory") int boardCategory, @ModelAttribute("bookmark") BookMarkVO book, @RequestParam(value="boardNo") int bno, RedirectAttributes rttr){
    	book.setBoardNo(bno);
    	book.setBoardCategory(boardCategory);
    	book.setUserNo(userNo);
    	service.bookmarkRegister(book);
//    	rttr.addFlashAttribute("result", book.getBoardNo());
    	return "eventboard/bookmark";
//    	return "redirect:/userPage";
//    	return "userPage?userNicknameuserNickname#bookmark";
    }
    
    @GetMapping("/bookmarkList")
	public String bookmarkList(@RequestParam(value = "page", defaultValue = "1") int page,@ModelAttribute BoardVO event,
						   Model model) {
		
		List<BoardVO> list = service.bookmarkList(event);
		model.addAttribute("bookmarklist",list);

		PageVO pageVO = service.getEventBoardCnt(page);
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("page", page);

		return "users/userPage";
	}

}
