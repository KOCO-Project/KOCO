package co.kr.koco.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.koco.dao.FreeBoardDAO;
import co.kr.koco.vo.BoardVO;
import co.kr.koco.vo.PageVO;

@Service
public class FreeBoardServiceImpl implements FreeBoardService {
	private int pageListcnt = 10;
	private int pagePaginationcnt = 10;
	
	@Autowired
	private FreeBoardDAO freeBoardDAO;
	
	@Override
	public void freeBoardRegister(BoardVO freeBoardVO) {
		
		freeBoardDAO.freeBoardRegister(freeBoardVO);
	}

	@Override
	public void freeBoardUpdate(BoardVO freeBoardVO) {
		
		freeBoardDAO.freeBoardUpdate(freeBoardVO);
	}

	@Override
	public void freeBoardDelete(int boardNo) {
		
		freeBoardDAO.freeBoardDelete(boardNo);
	}

	@Override
	public BoardVO getFreeBoard(int boardNo) {
		freeBoardDAO.setFreeBoardRcnt(boardNo);
		
		return freeBoardDAO.getFreeBoard(boardNo);
	}

	@Override
	public List<BoardVO> freeBoardList(int page, BoardVO freeBoardVO) {
		int start = (page-1)*pageListcnt;
		RowBounds rowBounds = new RowBounds(start, pageListcnt);
		
		return freeBoardDAO.freeBoardList(rowBounds, freeBoardVO);
	}

	@Override
	public String getBoardInfoName(int infoNo) {
		
		return freeBoardDAO.getBoardInfoName(infoNo);
	}

	@Override
	public PageVO getfreeBoardCnt(int currentPage, BoardVO freeBoardVO) {
		int contentCnt = freeBoardDAO.getFreeBoardCnt(freeBoardVO);
		PageVO pageVO = new PageVO(contentCnt, currentPage, pageListcnt, pagePaginationcnt);
		
		return pageVO;
	}

}
