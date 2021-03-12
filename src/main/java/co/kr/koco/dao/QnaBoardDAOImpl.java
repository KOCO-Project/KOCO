package co.kr.koco.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import co.kr.koco.vo.BoardVO;

@Repository
public class QnaBoardDAOImpl implements QnaBoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void getQnaBoardRegister(BoardVO regQnaBoardVO) {
		sqlSessionTemplate.insert("qnaBoard.getQnaBoardRegister", regQnaBoardVO);
	}

	@Override
	public List<BoardVO> getQnaBoardList(BoardVO vo, RowBounds rowBounds) {
		if (vo.getSearchCondition() == null || vo.getSearchCondition().equals("검색"))
			vo.setSearchCondition("TITLE");
		
		if (vo.getSearchKeyword() == null)
			vo.setSearchKeyword("");
		
		return sqlSessionTemplate.selectList("qnaBoard.getQnaBoardList", vo, rowBounds);
	}

	@Override
	public BoardVO getQna(int boardNo) {
		return sqlSessionTemplate.selectOne("qnaBoard.getQnaBoard", boardNo);
	}

	@Override
	public void updateQnaBoard(BoardVO boardVO) {
		sqlSessionTemplate.selectOne("qnaBoard.updateQnaBoard", boardVO);
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
	public int getQnaBoardCnt(BoardVO vo) {
		return sqlSessionTemplate.selectOne("qnaBoard.getQnaBoardCnt", vo);
	}

	@Override
	public void setQnaBoardRcnt(int boardNo) {
		sqlSessionTemplate.selectOne("qnaBoard.updateRcnt", boardNo);
	}

	@Override
	public void getAnswerRegister(Model model) {
		sqlSessionTemplate.insert("qnaBoard.getAnswerRegister", model);
		
	}

	@Override
	public void getAnswerRegView(Model model) {
		sqlSessionTemplate.selectOne("qnaBoard.answerRegView", model);
		
	}

}
