package co.kr.koco.dao;

import java.util.List;

import co.kr.koco.vo.EventVO;

public interface EventBoardDAO {

	 public abstract void boardRegister(EventVO event);
//	 public abstract void insertSelectKey(BoardVO board);
	 public List<EventVO> boardList();
	 public abstract int boardUpdate(EventVO event);
	 public abstract int boardDelete(Long boardNo);
	 public abstract EventVO getBoard(Long boardNo);
//	 public abstract int boardSearch(Long boardNo);
}
