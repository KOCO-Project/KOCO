package co.kr.koco.dao;

import java.util.List;

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
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert("qnaBoard.getQnaBoardRegister",qnaBoardVO);
	}

	@Override
	public List<BoardVO> getQnaBoardList(int infoNo, RowBounds rowBounds) {
		List<BoardVO> list = sqlSessionTemplate.selectList("qnaBoard.getQnaBoardList", infoNo);
		System.out.println(list);
		return list;
	}

	@Override
	public BoardVO getQna(int boardNo) {
		return sqlSessionTemplate.selectOne("qnaBoard.getQnaBoard", boardNo);
	}

	@Override
	public void updateQnaBoard(BoardVO boardVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteQnaBoard(int boardNo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String getBoardInfoName(int boardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getQnaBoardCnt(int boardCategory) {
		// TODO Auto-generated method stub
		return 0;
	}

}
