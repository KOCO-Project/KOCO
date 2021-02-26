package co.kr.koco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.koco.dao.FreeBoardDAO;
import co.kr.koco.vo.BoardVO;

@Service
public class FreeBoardServiceImpl implements FreeBoardService {

	@Autowired
	private FreeBoardDAO freeBoardDAO;
	
	@Override
	public void boardRegister(BoardVO freeBoardVO) {
		
		freeBoardDAO.boardRegister(freeBoardVO);
	}

	@Override
	public void boardUpdate(BoardVO freeBoardVO) {
		
		freeBoardDAO.boardUpdate(freeBoardVO);
	}

	@Override
	public void boardDelete(BoardVO freeBoardVO) {
	
		freeBoardDAO.boardDelete(freeBoardVO);
	}

	@Override
	public BoardVO getFreeBoard(BoardVO freeBoardVO) {
		
		return freeBoardDAO.getFreeBoard(freeBoardVO);
	}

	@Override
	public List<BoardVO> freeBoardList(BoardVO freeBoardVO) {
		
		return freeBoardDAO.freeBoardList(freeBoardVO);
	}

}
