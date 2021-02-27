package co.kr.koco.dao;



import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.koco.vo.BoardVO;

@Repository
public class FreeBoardDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 글 등록
	public void freeBoardRegister(BoardVO freeBoardVO) {
	
		mybatis.insert("freeBoardMapper.freeBoardRegister", freeBoardVO);
	}
	
	// 글 수정
	public void freeBoardUpdate(BoardVO freeBoardVO) {
		
		mybatis.update("freeBoardMapper.freeBoardUpdate", freeBoardVO);
	}
	
	// 글 삭제
	public void freeBoardDelete(BoardVO freeBoardVO) {
		
		mybatis.delete("freeBoardMapper.freeBoardDelete", freeBoardVO);
	}
	
	// 글 상세 조회
	public BoardVO getFreeBoard(BoardVO freeBoardVO) {
		
		return (BoardVO) mybatis.selectOne("freeBoardMapper.getFreeBoard", freeBoardVO);
	}
	
	//  글 목록 조회
	public List<BoardVO> freeBoardList(BoardVO freeBoardVO) {
		
		return mybatis.selectList("freeBoardMapper.freeBoardList", freeBoardVO);
	}
}
