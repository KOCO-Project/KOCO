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
	public void boardRegister(BoardVO vo) {
		mybatis.insert("freeBoardMapper.boardRegister", vo);
		mybatis.commit();
	}
	
	// 글 수정
	public void boardUpdate(BoardVO vo) {
		mybatis.update("freeBoardMapper.boardUpdate", vo);
		mybatis.commit();
	}
	
	// 글 삭제
	public void boardDelete(BoardVO vo) {
		mybatis.delete("freeBoardMapper.boardDelete", vo);
		mybatis.commit();
	}
	
	// 글 상세 조회
	public BoardVO getFreeBoard(BoardVO vo) {
		
		return (BoardVO) mybatis.selectOne("freeBoardMapper.getFreeBoard", vo);
	}
	
	//  글 목록 조회
	public List<BoardVO> freeBoardList(BoardVO vo) {
		
		return mybatis.selectList("freeBoardMapper.freeBoardList", vo);
	}
}
