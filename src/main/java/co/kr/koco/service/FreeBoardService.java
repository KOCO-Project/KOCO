package co.kr.koco.service;

import java.util.List;

import co.kr.koco.vo.BoardVO;
import co.kr.koco.vo.PageVO;

public interface FreeBoardService {

	//CRUD 기능의 메소드 구현
	// 글 등록
	void freeBoardRegister(BoardVO freeBoardVO);
	
	// 글 수정
	void freeBoardUpdate(BoardVO freeBoardVO);
	
	// 글 삭제
	void freeBoardDelete(int boardNo);
	
	// 글 상세 조회
	BoardVO getFreeBoard(int boardNo);
	
	// 글 목록 조회
	List<BoardVO> freeBoardList(int infoNo, int page, BoardVO freeBoardVO);
	
	//infoName
	String getBoardInfoName(int infoNo);
	
	PageVO getfreeBoardCnt(int infoNo, int currentPage, BoardVO freeBoardVO);
}
