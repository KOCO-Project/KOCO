package co.kr.koco.dao;



import java.util.List;

import org.apache.ibatis.session.RowBounds;
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
	public void freeBoardDelete(int boardNo) {
		
		mybatis.delete("freeBoardMapper.freeBoardDelete", boardNo);
	}
	
	// 글 상세 조회
	public BoardVO getFreeBoard(int boardNo) {
		
		return (BoardVO) mybatis.selectOne("freeBoardMapper.getFreeBoard", boardNo);
	}
	
	//  글 목록 조회
	public List<BoardVO> freeBoardList(int infoNo, RowBounds rowBounds) {
		
		return mybatis.selectList("freeBoardMapper.freeBoardList", infoNo, rowBounds);
	}
	
	public String getBoardInfoName(int infoNo) {
		
		return mybatis.selectOne("freeBoardMapper.getBoardInfoName", infoNo);
	}
	
	public int getFreeBoardCnt(int infoNo) {
		
		return mybatis.selectOne("freeBoardMapper.getFreeBoardCnt", infoNo);
	}
	
	public void setFreeBoardRcnt(int boardNo) {
		mybatis.selectOne("freeBoardMapper.updateRcnt", boardNo);
	}
}
