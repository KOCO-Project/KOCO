package co.kr.koco.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.koco.vo.BoardVO;
import co.kr.koco.vo.Criteria;

@Repository
public class EventBoardDAOImpl implements EventBoardDAO{
	@Autowired
	private SqlSessionTemplate sql;
	
	@Override
	public void eventBoardRegister(BoardVO event){
		sql.insert("evnetDAO.eventBoardRegister", event);
	}
	@Override
	 public List<BoardVO> getListWithPaging(Criteria cri){
		return sql.selectList("evnetDAO.getListWithPaging", cri);
	}
	@Override
	 public BoardVO getEventBoard(int boardNo) {
		return sql.selectOne("evnetDAO.getEventBoard", boardNo);
	 }
	@Override
	 public BoardVO getEventBoardUpdate(int boardNo) {
		return sql.selectOne("evnetDAO.getEventBoardUpdate", boardNo);
	 }
	@Override
	 public int postEventBoardUpdate(BoardVO event) {
		return sql.selectOne("evnetDAO.postEventBoardUpdate", event);
	 }
	@Override
	 public int eventBoardDelete(int boardNo) {
		return sql.selectOne("evnetDAO.eventBoardDelete", boardNo);
	 }
	@Override
	 public int getTotalCount(Criteria cri) {
		return sql.selectOne("evnetDAO.getTotalCount", cri);
	 }
//	 public int boardSearch(Long boardNo);
//	 public void insertSelectKey(EventVO event);
	@Override
	 public String getBoardInfoName(int infoNo) {
		return sql.selectOne("evnetDAO.getBoardInfoName", infoNo);
	 }
}
