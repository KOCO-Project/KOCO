package co.kr.koco.controller;

/*import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;*/
import java.util.HashMap;
import java.util.Map;
/*import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;*/

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
/*import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
*/
import co.kr.koco.service.FreeBoardService;
import co.kr.koco.vo.BoardVO;

@Controller
public class FreeBoardController {
	@Autowired
	private FreeBoardService freeBoardService; 
	
	@Autowired 
	private SqlSession sqlSession;
	 
	
	//글 등록
	@RequestMapping("/freeBoardRegister.do")
	public String freeBoardRegister(BoardVO freeBoardVO) {
		freeBoardService.freeBoardRegister(freeBoardVO);
		
		return "freeBoardList.do";
	}
	
	//글 수정
	@RequestMapping("/freeBoardUpdate.do")
	public String freeBoardUpdate(@ModelAttribute("board") BoardVO freeBoardVO) {
		freeBoardService.freeBoardUpdate(freeBoardVO);
		
		return "freeBoardList.do";
	}
	
	// 글 삭제 
	@RequestMapping("/freeBoardDelete.do")
	public String freeBoardDelete(BoardVO freeBoardVO) {
		freeBoardService.freeBoardDelete(freeBoardVO);
		
		return "freeBoardList.do";
	}
	
	// 글 상세 조회
	public String getFreeBoard(BoardVO freeBoardVO, Model model) {
		model.addAttribute("board");
		
		return "getFreeBoard.jsp";
	}
	
	// 검색 조건 목록 설정
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap(){
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		
		return conditionMap;
	}
	
	// 글 목록 검색
	public String freeBoardList(BoardVO freeBoardVO, Model model) {
		
		if(freeBoardVO.getSearchCondition() == null) freeBoardVO.setSearchCondition("TITLE");
		if(freeBoardVO.getSearchKeyword() == null) freeBoardVO.setSearchKeyword("");
		
		model.addAttribute("boardList", freeBoardService.freeBoardList(freeBoardVO));
		
		return "freeBoardList.jsp";
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
