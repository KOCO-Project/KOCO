package co.kr.koco.service;

import java.util.List;

import co.kr.koco.vo.BoardVO;
import co.kr.koco.vo.Criteria;
import co.kr.koco.vo.PageVO;

public interface EventBoardService {
	public void eventBoardRegister(BoardVO event);
	public BoardVO getEventBoard(int bno);
	public BoardVO getEventBoardUpdate(int bno);
	public int postEventUpdate(BoardVO event);
	public int eventBoardDelete(int bno);
//	public List<BoardVO> getListWithPaging(Criteria cri);
	public List<BoardVO> getListWithPaging(int page);
	public PageVO getEventBoardCnt(int currentPage);
	public int getTotal(Criteria cri);

}
