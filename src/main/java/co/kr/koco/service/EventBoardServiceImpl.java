package co.kr.koco.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import co.kr.koco.dao.EventBoardDAO;
import co.kr.koco.vo.BoardVO;
import co.kr.koco.vo.BookMarkVO;
import co.kr.koco.vo.Criteria;
import co.kr.koco.vo.PageVO;
import co.kr.koco.vo.UserVO;

//@Repository
@Service
public class EventBoardServiceImpl implements EventBoardService {

	private int pageListcnt = 6; // 페이지당 글 개수
	private int pagePaginationcnt = 6;
	
	@Autowired
	private EventBoardDAO eventBoardDAO;
	
	@Resource(name="userVO")
	@Lazy
	private UserVO userVO;

	@Override
	public void eventBoardRegister(BoardVO event) {
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
	public int postEventUpdate(BoardVO event) {
		return eventBoardDAO.postEventUpdate(event);

	}

	@Override
	public void eventBoardDelete(int bno) {
		eventBoardDAO.eventBoardDelete(bno);

	}
	
	public List<BoardVO> getListWithPaging(BoardVO event, int page) {
		int start = (page-1)*pageListcnt;
		RowBounds rowBounds = new RowBounds(start, pageListcnt);//pageListcnt-페이지당 글 개수
		return eventBoardDAO.getListWithPaging(event, rowBounds);
	}
	
	@Override
	public int getTotal(Criteria cri) {
		return eventBoardDAO.getTotalCount(cri);
	}
	
	public PageVO getEventBoardCnt(int currentPage) {
		int contentCnt = eventBoardDAO.getEventBoardCnt();//전체글 갯수
		PageVO pageVO = new PageVO(contentCnt, currentPage, pageListcnt, pagePaginationcnt);
		return pageVO;
	}

	public void bookmarkRegister(BookMarkVO book){
		eventBoardDAO.bookmarkRegister(book);
	}
	
	public List<BoardVO> bookmarkList(BoardVO event){
		return eventBoardDAO.bookmarkList(event);
	}
	
//	@Override
//	public List<EventVO> getList() {
//
//		log.info("getList..........");
//
//		return eventBoardDAO.getList();
//	}


}