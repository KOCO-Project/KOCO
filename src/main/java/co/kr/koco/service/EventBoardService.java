package co.kr.koco.service;

import java.util.List;
import org.springframework.stereotype.Component;

import co.kr.koco.vo.BoardVO;
import co.kr.koco.vo.Criteria;
import co.kr.koco.vo.EventVO;

public interface EventBoardService {
	public void register(BoardVO event);
	public BoardVO get(int bno);
	public BoardVO getUpdate(int bno);
	public int postUpdate(BoardVO event);
	public int delete(int bno);
	public List<BoardVO> getList(Criteria cri);
	public int getTotal(Criteria cri);

}
