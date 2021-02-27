package co.kr.koco.service;

import java.util.List;

import co.kr.koco.vo.EventVO;


public interface EventBoardService {
	public abstract void register(EventVO event);
	public abstract List<EventVO> getList();
	 public abstract EventVO get(Long bno);
	 public abstract int modify(EventVO board);
	 public abstract int remove(Long bno);
//	 public abstract List<BoardVO> getList(Criteria cri);
//	 public abstract int getTotal(Criteria cri);

}
