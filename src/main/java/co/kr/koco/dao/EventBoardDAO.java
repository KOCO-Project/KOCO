package co.kr.koco.dao;

import java.util.List;

import co.kr.koco.vo.BoardVO;
import co.kr.koco.vo.Criteria;
import co.kr.koco.vo.EventVO;

public interface EventBoardDAO {
	 public List<BoardVO> getListWithPaging(Criteria cri);
	 public void boardRegister(BoardVO event);
	 public BoardVO getBoard(int boardNo);
	 public int boardDelete(int boardNo);
	 public BoardVO getUpdate(int boardNo);
	 public int postUpdate(BoardVO event);
	 public int getTotalCount(Criteria cri);
//	 public int boardSearch(Long boardNo);
//	 public void insertSelectKey(EventVO event);
}
