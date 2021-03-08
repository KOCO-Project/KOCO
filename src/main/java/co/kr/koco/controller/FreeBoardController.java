package co.kr.koco.controller;

/*import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;*/
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/*import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;*/

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

/*import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
*/
import co.kr.koco.service.FreeBoardService;
import co.kr.koco.vo.BoardVO;
import co.kr.koco.vo.PageVO;
import co.kr.koco.vo.UserVO;

@Controller
@SessionAttributes("freeBoard") 
public class FreeBoardController {
	
	@Autowired
	private FreeBoardService freeBoardService; 
	
	@Resource(name="userVO")
	@Lazy
	private UserVO userVO;	
	
	//글 등록 폼
	@RequestMapping(value="/freeBoardRegister", method=RequestMethod.GET)
	public String freeBoardRegisterView(@RequestParam("infoNo") int infoNo, BoardVO freeBoardVO) {
		/* freeBoardService.freeBoardRegister(freeBoardVO); */
		freeBoardVO.setBoardCategory(infoNo);
		
		return "freeboard/freeBoardRegister";
	}
	
	//글 등록
	@RequestMapping(value="/freeBoardRegister", method=RequestMethod.POST)
	public String freeBoardRegister(BoardVO freeBoardVO, @RequestParam("userNo") int userNo) {
		freeBoardVO.setUserNo(userNo);
		freeBoardService.freeBoardRegister(freeBoardVO);
		
		return "freeboard/freeBoardRegister_pro";
	}
	
	//글 수정 폼
	@RequestMapping(value="/freeBoardUpdate", method=RequestMethod.GET)
	public String freeBoardUpdateView(@RequestParam("infoNo") int infoNo, @RequestParam("boardNo") int boardNo, 
			@ModelAttribute("freeBoard") BoardVO freeBoardVO, @RequestParam("page") int page, Model model) {
		
		model.addAttribute("infoNo", infoNo);
		model.addAttribute("boardNo", boardNo);
		model.addAttribute("page", page);
		
		BoardVO tempBoardVO = freeBoardService.getFreeBoard(boardNo);
		freeBoardVO.setUserNo(tempBoardVO.getUserNo());
		freeBoardVO.setBoardRegdate(tempBoardVO.getBoardRegdate());
		freeBoardVO.setBoardTitle(tempBoardVO.getBoardTitle());
		freeBoardVO.setBoardContent(tempBoardVO.getBoardContent());
		freeBoardVO.setWriter(tempBoardVO.getWriter());
		freeBoardVO.setBoardNo(boardNo);
		freeBoardVO.setBoardCategory(infoNo);
		
		/* freeBoardService.freeBoardUpdate(freeBoardVO); */
		
		return "freeboard/freeBoardList";
	}
	
	//글 수정 
	@RequestMapping(value="/freeBoardUpdate", method=RequestMethod.POST)
	public String freeBoardUpdate(@ModelAttribute("freeBoard") BoardVO freeBoardVO, @RequestParam("page") int page, Model model) {
		model.addAttribute("page", page);
		freeBoardService.freeBoardUpdate(freeBoardVO);
		
		return "freeboard/freeBoardUpdate_pro";
	}
	
	// 글 삭제 
	@RequestMapping("/freeBoardDelete")
	public String freeBoardDelete(@RequestParam("infoNo") int infoNo, @RequestParam("boardNo") int boardNo, Model model) {
		freeBoardService.freeBoardDelete(boardNo);
		model.addAttribute("infoNo", infoNo);
		
		return "freeboard/freeBoardDelete";
	}
	
	// 글 상세 조회
	@RequestMapping("/getFreeBoard")
	public String getFreeBoard(@RequestParam("infoNo") int infoNo, @RequestParam("boardNo") int boardNo, BoardVO freeBoardVO,  @RequestParam("page") int page, Model model) {
		model.addAttribute("infoNo", infoNo);
		model.addAttribute("boardNo", boardNo);
		
		BoardVO readContent = freeBoardService.getFreeBoard(boardNo);
		model.addAttribute("readContentBean", readContent);
		
		model.addAttribute("userVO", userVO);
		model.addAttribute("page", page);
		
		/* model.addAttribute("freeBoard", freeBoardService.getFreeBoard(boardNo)); */
		
		return "freeboard/getFreeBoard";
	}
	
	// 검색 조건 목록 설정
	@ModelAttribute("conditionMap") //2가지 기능이 있는데 그 중 하나가 RequestMapping보다 먼저 실행!
	public Map<String, String> searchConditionMap(){
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		
		return conditionMap;
	}
	
	// 글 목록 검색
	@RequestMapping("/freeBoardList")
	public String freeBoardList(@RequestParam("infoNo") int infoNo, @RequestParam(value = "page", defaultValue = "1") int page, BoardVO freeBoardVO, Model model) {
	
		model.addAttribute("infoNo", infoNo);
		String infoName = freeBoardService.getBoardInfoName(infoNo);
		model.addAttribute("infoName", infoName);
		
		//null check
		//if(freeBoardVO.getSearchCondition() == null) freeBoardVO.setSearchCondition("TITLE");
		//if(freeBoardVO.getSearchKeyword() == null) freeBoardVO.setSearchKeyword("");
		
		//model.addAttribute("freeBoardList", freeBoardService.freeBoardList(freeBoardVO));
		
		List<BoardVO> freeBoardList = freeBoardService.freeBoardList(infoNo, page);
		model.addAttribute("freeBoardList", freeBoardList);
		
		PageVO pageVO = freeBoardService.getfreeBoardCnt(infoNo, page);
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("page", page);
		
		return "freeboard/freeBoardList";
	}
	
	/*
	 * //CKEditor4 이미지 업로드
	 * 
	 * @RequestMapping(value="/main/imageUpload.do", method = RequestMethod.POST)
	 * public void imageUpload(HttpServletRequest request,HttpServletResponse
	 * response, MultipartHttpServletRequest multiFile, @RequestParam MultipartFile
	 * upload) throws Exception{
	 * 
	 * //랜덤 문자 생성 UUID uid = UUID.randomUUID();
	 * 
	 * OutputStream out = null; PrintWriter printWriter = null;
	 * 
	 * //인코딩 response.setCharacterEncoding("utf-8");
	 * response.setContentType("text/html;charset-utf-8");
	 * 
	 * try {
	 * 
	 * //파일 이름 가져오기 String fileName = upload.getOriginalFilename(); byte[] bytes =
	 * upload.getBytes();
	 * 
	 * //이미지 경로 생성 String path = ? "ckImage/"; //fileDir는 전역변수라 그냥 이미지 저장되는 경로 설정해주면
	 * 된다. String ckUploadPath = path + uid + "_" + fileName; File folder = new
	 * File(path);
	 * 
	 * //해당 디렉토리 확인 if(!folder.exists()) { try { folder.mkdirs(); // 폴더 생성
	 * }catch(Exception e) { e.getStackTrace(); } } out = new FileOutputStream(new
	 * File(ckUploadPath)); out.write(bytes); out.flush(); //outputStream에 저장된 데이터를
	 * 전송하고 초기화
	 * 
	 * String callback = request.getParameter("CKEditorFuncNum"); printWriter =
	 * response.getWriter(); String fileUrl = "/ckImgSubmit.do?uid=" + uid +
	 * "&fileName=" + fileName; //작성화면
	 * 
	 * //업로드시 메시지 출력 printWriter.println("{\"+filename\":\""+
	 * fileName+"\",\"uploaded\"+1, \"url\":\""+fileUrl+"\"}"); printWriter.flush();
	 * }catch(IOException e) { e.printStackTrace(); } finally { try { if(out !=
	 * null) {out.close();} if(printWriter != null) {printWriter.close();} }
	 * catch(IOException e) { e.printStackTrace();} } return; }
	 */
}
