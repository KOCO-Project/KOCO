package co.kr.koco.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.koco.vo.BoardVO;

@Repository
public class QnaBoardDAOImpl implements QnaBoardDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void register(BoardVO boardVO) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.insert("qnaBoard.getQnaBoardRegister",boardVO);
	}

	@Override
	public List<BoardVO> getQnaList(int infoNo) {
		List<BoardVO> list = sqlSessionTemplate.selectList("qnaBoard.getQnaBoardList", infoNo);
		System.out.println(list);
		return list;
	}

	@Override
	public BoardVO getQna(int boardNo) {
		return sqlSessionTemplate.selectOne("qnaBoard.getQnaBoard", boardNo);
	}

	@Override
	public void update(int boardNo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int boardNo) {
		// TODO Auto-generated method stub
		
	}

	

}
