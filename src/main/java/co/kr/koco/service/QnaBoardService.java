package co.kr.koco.service;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import co.kr.koco.dao.QnaBoardDAO;
import co.kr.koco.vo.BoardVO;
import co.kr.koco.vo.PageVO;
import co.kr.koco.vo.UserVO;

@Service
public class QnaBoardService {
	
	private String pathUpload;
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
	
	public void getQnaBoardRegister(BoardVO writerBoardVO) {
//		System.out.println(writerBoardVO.getBoardTitle());
//		System.out.println(writerBoardVO.getBoardContent());
//		System.out.println(writerBoardVO.getUploadFile().getSize());
		
		MultipartFile uploadFile = writerBoardVO.getUploadFile();
		if(uploadFile.getSize()>0) {
			String fileName = saveUploadFile(uploadFile);
			writerBoardVO.setFileName(fileName);;
		}
		writerBoardVO.setUserNo(userVO.getUserNo());
		qnaBoardDAO.getQnaBoardRegister(writerBoardVO);
	}
	
	public String getBoardInfoName(int boardNo) {
		return qnaBoardDAO.getBoardInfoName(boardNo);
	}
	
	public List<BoardVO> getQnaBoardList(int boardNo, int page) {
		int start = (page-1)*pageListcnt;
		RowBounds rowBounds = new RowBounds(start, pageListcnt);
		return qnaBoardDAO.getQnaBoardList(boardNo, rowBounds);
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
	
	public PageVO getQnaBoardCnt(int boardCategory, int currentPage) {
		int boardNo = qnaBoardDAO.getQnaBoardCnt(boardCategory);
		PageVO pageVO = new PageVO(boardNo, currentPage, pageListcnt, pagePaginationcnt);
		return pageVO;
	}
}
