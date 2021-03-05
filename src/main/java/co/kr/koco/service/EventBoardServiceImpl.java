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

//@Repository
@Service
public class EventBoardServiceImpl implements EventBoardService {

	@Autowired
	private EventBoardDAO eventBoardDAO;
	
	@Resource(name="userVO")
	@Lazy
	private UserVO userVO;

	@Override
	public void eventBoardRegister(BoardVO event) {
//		String userNickname = userVO.getUserNickname();
		event.setUserNo(userVO.getUserNo());
		eventBoardDAO.eventBoardRegister(event);
	}	

	@Override
	public BoardVO getEventBoard(int bno) {
		return eventBoardDAO.getEventBoard(bno);
	}

	@Override
	public BoardVO getEventBoardUpdate(int bno) {
		return eventBoardDAO.getEventBoardUpdate(bno);
	}


	@Override
	public int postEventBoardUpdate(BoardVO event) {
		return eventBoardDAO.postEventBoardUpdate(event);

	}

	@Override
	public int eventBoardDelete(int bno) {
		return eventBoardDAO.eventBoardDelete(bno);

	}
	
	@Override
	public List<BoardVO> getListWithPaging(Criteria cri) {
		return eventBoardDAO.getListWithPaging(cri);
	}
	
	public String getBoardInfoName(int infoNo) {
		return eventBoardDAO.getBoardInfoName(infoNo);
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