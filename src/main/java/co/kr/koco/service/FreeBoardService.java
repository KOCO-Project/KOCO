package co.kr.koco.service;

import java.util.List;

import co.kr.koco.vo.FreeBoardVO;

public interface FreeBoardService {

	//CRUD 기능의 메소드 구현
	// 글 등록
	void boardRegister(FreeBoardVO vo);
	
	// 글 수정
	void boardUpdate(FreeBoardVO vo);
	
	// 글 삭제
	void boardDelete(FreeBoardVO vo);
	
	// 글 상세 조회
	FreeBoardVO getFreeBoard(FreeBoardVO vo);
	
	// 글 목록 조회
	List<FreeBoardVO> freeBoardList(FreeBoardVO vo);
}
