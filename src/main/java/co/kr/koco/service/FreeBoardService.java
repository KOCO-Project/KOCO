package co.kr.koco.service;

import java.util.List;

import co.kr.koco.vo.BoardVO;

public interface FreeBoardService {

	//CRUD 기능의 메소드 구현
	// 글 등록
	void boardRegister(BoardVO vo);
	
	// 글 수정
	void boardUpdate(BoardVO vo);
	
	// 글 삭제
	void boardDelete(BoardVO vo);
	
	// 글 상세 조회
	BoardVO getFreeBoard(BoardVO vo);
	
	// 글 목록 조회
	List<BoardVO> freeBoardList(BoardVO vo);
}
