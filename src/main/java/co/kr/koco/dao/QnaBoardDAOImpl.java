package co.kr.koco.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.koco.vo.BoardVO;

@Repository
public class QnaBoardDAOImpl implements QnaBoardDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void getQnaBoardRegister(BoardVO qnaBoardVO) {
		sqlSessionTemplate.insert("qnaBoard.getQnaBoardRegister",qnaBoardVO);
	}

	@Override
	public List<BoardVO> getQnaBoardList(int infoNo, RowBounds rowBounds) {
		return sqlSessionTemplate.selectList("qnaBoard.getQnaBoardList", infoNo, rowBounds);
	}

	@Override
	public BoardVO getQna(int boardNo) {
		return sqlSessionTemplate.selectOne("qnaBoard.getQnaBoard", boardNo);
	}

	@Override
	public void updateQnaBoard(BoardVO boardVO) {
		sqlSessionTemplate.selectOne("qnaBoard.updateQnaBoard",boardVO);
	}

	@Override
	public void deleteQnaBoard(int boardNo) {
		sqlSessionTemplate.selectOne("qnaBoard.deleteQnaBoard", boardNo);
	}

	@Override
	public String getBoardInfoName(int infoNo) {
		return sqlSessionTemplate.selectOne("qnaBoard.getBoardInfoName", infoNo);
	}

	@Override
	public int getQnaBoardCnt(int infoNo) {
		return sqlSessionTemplate.selectOne("qnaBoard.getQnaBoardCnt", infoNo);
	}
	
	@Override
	public void setQnaBoardRcnt(int boardNo) {
		sqlSessionTemplate.selectOne("qnaBoard.updateRcnt",boardNo);
	}
	

}
