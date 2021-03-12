package co.kr.koco.service;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import co.kr.koco.dao.QnaBoardDAO;
import co.kr.koco.vo.BoardVO;
import co.kr.koco.vo.PageVO;
import co.kr.koco.vo.UserVO;

@Service
public class QnaBoardService {

	String pathUpload="C:/Users/PC/Documents/workspace-sts-3.9.15.RELEASE/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/KOCO/resources/upload";
	private int pageListcnt = 10; // 페이지당 글 개수
	private int pagePaginationcnt = 10;
	
	@Autowired
	private QnaBoardDAO qnaBoardDAO;
	
	@Resource(name="userVO")
	@Lazy
	private UserVO userVO;

	private String saveUploadFile(MultipartFile uploadFile) {
		String file_name = System.currentTimeMillis() + "_" + uploadFile.getOriginalFilename();
		try {
			uploadFile.transferTo(new File(pathUpload + "/" + file_name));
		}catch(Exception e) {
			e.printStackTrace();
		}
		return file_name;
	}
	
	public void getQnaBoardRegister(BoardVO regQnaBoardVO) {
//		System.out.println(regQnaBoardVO.getBoardTitle());
//		System.out.println(regQnaBoardVO.getBoardContent());
//		System.out.println(regQnaBoardVO.getUploadFile().getSize());
		MultipartFile uploadFile = regQnaBoardVO.getUploadFile();
		if(uploadFile.getSize()>0) {
			String fileName = saveUploadFile(uploadFile);
			regQnaBoardVO.setFileName(fileName);
		}
		qnaBoardDAO.getQnaBoardRegister(regQnaBoardVO);
	}
	
	public String getBoardInfoName(int infoNo) {
		return qnaBoardDAO.getBoardInfoName(infoNo);
	}
	
	public List<BoardVO> getQnaBoardList(BoardVO vo, int page) {
		int start = (page-1)*pageListcnt;
		RowBounds rowBounds = new RowBounds(start, pageListcnt);//pageListcnt-페이지당 글 개수
		return qnaBoardDAO.getQnaBoardList(vo, rowBounds);
	}
	
	public BoardVO getQnaBoard(int boardNo) {
		qnaBoardDAO.setQnaBoardRcnt(boardNo);
		return qnaBoardDAO.getQna(boardNo);
	}
	
	public void updateQnaBoard(BoardVO boardVO) {
		MultipartFile uploadFile = boardVO.getUploadFile();
		if(uploadFile.getSize() > 0) {
			String fileName = saveUploadFile(uploadFile);
			boardVO.setFileName(fileName);
		}
		qnaBoardDAO.updateQnaBoard(boardVO);
	}
	
	public void deleteQnaBoard(int boardNo) {
		qnaBoardDAO.deleteQnaBoard(boardNo);
	}
	
	public PageVO getQnaBoardCnt(BoardVO vo, int currentPage) {
		int contentCnt = qnaBoardDAO.getQnaBoardCnt(vo);//전체글 갯수
		PageVO pageVO = new PageVO(contentCnt, currentPage, pageListcnt, pagePaginationcnt);
		return pageVO;
	}

	public void getAnswerRegView(Model model) {
		
		qnaBoardDAO.getAnswerRegView(model);
	}
}





