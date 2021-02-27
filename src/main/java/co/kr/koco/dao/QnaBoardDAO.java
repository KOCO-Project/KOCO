package co.kr.koco.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.koco.vo.BoardVO;

@Repository
public class QnaBoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void getQnaBoardRegister(BoardVO writeQnaBoardVO) {
		sqlSessionTemplate.insert("board.getQnaBoardRegister", writeQnaBoardVO);
	}
	
	public String getBoardInfoName(int boardNo) {
		return sqlSessionTemplate.selectOne("board.getBoardInfoName",boardNo);
	}
	
	public List<BoardVO> getQnaBoardList(int boardNo, RowBounds rowBounds) {
		return sqlSessionTemplate.selectList("board.getQnaBoardList",boardNo, rowBounds);
	}
	
	public BoardVO getQnaBoard(int boardNo) {
		return sqlSessionTemplate.selectOne("board.getQnaBoard", boardNo);
	}
	
	public void updateQnaBoard(BoardVO updateQnaBoardVO) {
		sqlSessionTemplate.selectOne("board.updateQnaBoard",updateQnaBoardVO);
	}
	
	public void deleteQnaBoard(int boardNo) {
		sqlSessionTemplate.selectOne("board.deleteQnaBoard",boardNo);
	}
	
	public int getQnaBoardCnt(int boardNo) {
		return sqlSessionTemplate.selectOne("board.getQnaBoardCnt", boardNo);
	}
	
}
