package co.kr.koco.service;

import java.util.List;

import co.kr.koco.vo.BoardVO;
import co.kr.koco.vo.Criteria;

public interface EventBoardService {
	public void eventBoardRegister(BoardVO event);
	public BoardVO getEventBoard(int bno);
	public BoardVO getEventBoardUpdate(int bno);
	public int postEventBoardUpdate(BoardVO event);
	public int eventBoardDelete(int bno);
	public List<BoardVO> getListWithPaging(Criteria cri);
	public int getTotal(Criteria cri);
	public String getBoardInfoName(int infoNo);

}
