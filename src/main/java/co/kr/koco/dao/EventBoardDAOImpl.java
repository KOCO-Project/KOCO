package co.kr.koco.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.koco.vo.BoardVO;
import co.kr.koco.vo.BookMarkVO;
import co.kr.koco.vo.Criteria;

@Repository
public class EventBoardDAOImpl implements EventBoardDAO{
	@Autowired
	private SqlSessionTemplate sql;
	
	@Override
	public void eventBoardRegister(BoardVO event){
		sql.insert("evnetDAO.eventBoardRegister", event);
	}
//	@Override
//	 public List<BoardVO> getListWithPaging(Criteria cri){
//		return sql.selectList("evnetDAO.getListWithPaging", cri);
//	}
	@Override
	public List<BoardVO> getListWithPaging(BoardVO event, RowBounds rowBounds) {
		return sql.selectList("evnetDAO.getListWithPaging",event,rowBounds);
	}
	@Override
	public int getEventBoardCnt() {
		return sql.selectOne("evnetDAO.getEventBoardCnt");
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
	 public int postEventUpdate(BoardVO event) {
		return sql.selectOne("evnetDAO.postEventBoardUpdate", event);
	 }
	@Override
	 public void eventBoardDelete(int boardNo) {
		sql.selectOne("evnetDAO.eventBoardDelete", boardNo);
	 }
	@Override
	 public int getTotalCount(Criteria cri) {
		return sql.selectOne("evnetDAO.getTotalCount", cri);
	 }
	@Override
	 public void bookmarkRegister(BookMarkVO book) {
		sql.insert("evnetDAO.bookmarkRegister", book);
	}
	@Override
	 public List<BoardVO> bookmarkList(BoardVO event){
		return sql.selectList("evnetDAO.bookmarkList", event);
	}

	 
//	 public int boardSearch(Long boardNo);
//	 public void insertSelectKey(EventVO event);
}
