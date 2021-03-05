package co.kr.koco.dao;

import java.util.List;

import co.kr.koco.vo.BoardVO;
import co.kr.koco.vo.Criteria;

public interface EventBoardDAO {
	 public void eventBoardRegister(BoardVO event);
	 public List<BoardVO> getListWithPaging(Criteria cri);
	 public BoardVO getEventBoard(int boardNo);
	 public BoardVO getEventBoardUpdate(int boardNo);
	 public int postEventBoardUpdate(BoardVO event);
	 public int eventBoardDelete(int boardNo);
	 public int getTotalCount(Criteria cri);
//	 public int boardSearch(Long boardNo);
//	 public void insertSelectKey(EventVO event);
	 public String getBoardInfoName(int infoNo);
}
