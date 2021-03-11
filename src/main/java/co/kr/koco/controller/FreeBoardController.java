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
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
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
import co.kr.koco.vo.HeartVO;
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
	public String freeBoardRegisterView(@RequestParam("infoNo") int infoNo, @ModelAttribute("freeBoardVO") BoardVO freeBoardVO) {
		/* freeBoardService.freeBoardRegister(freeBoardVO); */
		freeBoardVO.setBoardCategory(infoNo);
		
		return "freeboard/freeBoardRegister";
	}
	
	//글 등록
	@RequestMapping(value="/freeBoardRegister", method=RequestMethod.POST)
	public String freeBoardRegister(@Valid @ModelAttribute("freeBoardVO") BoardVO freeBoardVO,  BindingResult result, @RequestParam("userNo") int userNo) {
		freeBoardVO.setUserNo(userNo);
		freeBoardService.freeBoardRegister(freeBoardVO);
		
		return "freeboard/freeBoardRegister_pro";
	}
	
	//글 수정 폼
	@RequestMapping(value="/freeBoardUpdate", method=RequestMethod.GET)
	public String freeBoardUpdateView(@RequestParam("infoNo") int infoNo, @RequestParam("boardNo") int boardNo, 
			@ModelAttribute("freeBoardVO") BoardVO freeBoardVO, @RequestParam("page") int page, Model model) {
		
		model.addAttribute("infoNo", infoNo);
		model.addAttribute("boardNo", boardNo);
		model.addAttribute("page", page);
		
		BoardVO tempBoardVO = freeBoardService.getFreeBoard(boardNo);
		
		model.addAttribute("freeBoardVO", tempBoardVO);
		
		/* freeBoardService.freeBoardUpdate(freeBoardVO); */
		
		return "freeboard/freeBoardUpdate";
	}
	
	//글 수정 
	@RequestMapping(value="/freeBoardUpdate", method=RequestMethod.POST)
	public String freeBoardUpdate(@ModelAttribute("freeBoardVO") BoardVO freeBoardVO, @RequestParam("page") int page, Model model,  @RequestParam(value = "boardNo") int boardNo, @RequestParam(value = "infoNo") int infoNo) {
		model.addAttribute("page", page);
		
		BoardVO updateBoard = new BoardVO();
		
		updateBoard.setBoardCategory(infoNo);
		updateBoard.setBoardNo(boardNo);
		updateBoard.setBoardTitle(freeBoardVO.getBoardTitle());
		updateBoard.setBoardContent(freeBoardVO.getBoardContent());
		
		freeBoardService.freeBoardUpdate(updateBoard);
		
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
		
		/*
		 * HeartVO vo = new HeartVO(); vo.setBoardNO(boardNO); vo.setUserNo(userNo);
		 * 
		 * int boardlike = service.getHeart(vo);
		 */
		
		/* model.addAttribute("freeBoard", freeBoardService.getFreeBoard(boardNo)); */
		
		/*
		 * //좋아요 업데이트 else if(command.equals("/RecUpdate.do")){ try { action = new
		 * RecUpdate(); action.execute(request, response); } catch(Exception e) {
		 * e.printStackTrace(); } }
		 * 
		 * //좋아요 검색 else if(command.equals("/RecCount.do")) { try { action = new
		 * RecCount(); action.execute(request, response); } catch(Exception e) {
		 * e.printStackTrace(); } }
		 */
		
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
	public String freeBoardList(@RequestParam("infoNo") int infoNo, @RequestParam(value = "page", defaultValue = "1") int page, 
								BoardVO freeBoardVO, Model model, @RequestParam(value="searchKeyword" ,required=false)String searchKeyword, @RequestParam(value="searchCondition", defaultValue="TITLE")String searchCondition) {
	
	
		 //null check if(freeBoardVO.getSearchCondition() == null)
		// freeBoardVO.setSearchCondition("TITLE"); 
		// if(freeBoardVO.getSearchKeyword() == null) freeBoardVO.setSearchKeyword("");
		 
		
		model.addAttribute("infoNo", infoNo);
		String infoName = freeBoardService.getBoardInfoName(infoNo);
		model.addAttribute("infoName", infoName);
		
		List<BoardVO> freeBoardList = freeBoardService.freeBoardList(infoNo, page, freeBoardVO);
		model.addAttribute("freeBoardList", freeBoardList);
		
		PageVO pageVO = freeBoardService.getfreeBoardCnt(infoNo, page, freeBoardVO);
		model.addAttribute("pageVO", pageVO);
		model.addAttribute("page", page);
		
		model.addAttribute("searchCondition", searchCondition);
		model.addAttribute("searchKeyword", searchKeyword);
				
		return "freeboard/freeBoardList";
	}
	
	@RequestMapping("/not_login")
	public String regFail() {
		
		return "users/not_login";
	}
	
	@RequestMapping("/not_writer")
	public String fail() {
		
		return "qna/not_writer";
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
