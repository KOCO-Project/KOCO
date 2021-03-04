package co.kr.koco.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import co.kr.koco.dao.EventBoardDAO;
import co.kr.koco.vo.BoardVO;
import co.kr.koco.vo.Criteria;
import co.kr.koco.vo.UserVO;

@Service
public class EventBoardServiceImpl implements EventBoardService {

	@Autowired(required=false)
	private EventBoardDAO eventBoardDAO;
	
	@Resource(name="userVO")
	@Lazy
	private UserVO userVO;

	@Override
	public void register(BoardVO event) {
//		String userNickname = userVO.getUserNickname();
		event.setUserNo(userVO.getUserNo());
		eventBoardDAO.boardRegister(event);
	}	

	@Override
	public BoardVO get(int bno) {
		return eventBoardDAO.getBoard(bno);
	}

	@Override
	public BoardVO getUpdate(int bno) {
		return eventBoardDAO.getUpdate(bno);
	}


	@Override
	public int postUpdate(BoardVO event) {
		return eventBoardDAO.postUpdate(event);

	}

	@Override
	public int delete(int bno) {
		return eventBoardDAO.boardDelete(bno);

	}
	
	@Override
	public List<BoardVO> getList(Criteria cri) {
		return eventBoardDAO.getListWithPaging(cri);
	}
	
	@Override
	public int getTotal(Criteria cri) {
		return eventBoardDAO.getTotalCount(cri);
	}

//	@Override
//	public List<EventVO> getList() {
//
//		log.info("getList..........");
//
//		return eventBoardDAO.getList();
//	}


}