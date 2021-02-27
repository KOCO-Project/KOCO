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
	public void freeBoardRegister(BoardVO freeBoardVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void freeBoardUpdate(BoardVO freeBoardVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void freeBoardDelete(BoardVO freeBoardVO) {
		// TODO Auto-generated method stub
		
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
