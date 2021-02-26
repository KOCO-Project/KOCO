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
	public void boardRegister(BoardVO vo) {
		
		freeBoardDAO.boardRegister(vo);
	}

	@Override
	public void boardUpdate(BoardVO vo) {
		
		freeBoardDAO.boardUpdate(vo);
	}

	@Override
	public void boardDelete(BoardVO vo) {
	
		freeBoardDAO.boardDelete(vo);
	}

	@Override
	public BoardVO getFreeBoard(BoardVO vo) {
		
		return freeBoardDAO.getFreeBoard(vo);
	}

	@Override
	public List<BoardVO> freeBoardList(BoardVO vo) {
		
		return freeBoardDAO.freeBoardList(vo);
	}

}
