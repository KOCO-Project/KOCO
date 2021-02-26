package co.kr.koco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.koco.dao.FreeBoardDAO;
import co.kr.koco.vo.FreeBoardVO;

@Service("freeBoardService")
public class FreeBoardServiceImpl implements FreeBoardService {

	@Autowired
	private FreeBoardDAO freeBoardDAO;
	
	@Override
	public void boardRegister(FreeBoardVO vo) {
		
		freeBoardDAO.boardRegister(vo);
	}

	@Override
	public void boardUpdate(FreeBoardVO vo) {
		
		freeBoardDAO.boardUpdate(vo);
	}

	@Override
	public void boardDelete(FreeBoardVO vo) {
	
		freeBoardDAO.boardDelete(vo);
	}

	@Override
	public FreeBoardVO getFreeBoard(FreeBoardVO vo) {
		
		return freeBoardDAO.getFreeBoard(vo);
	}

	@Override
	public List<FreeBoardVO> freeBoardList(FreeBoardVO vo) {
		
		return freeBoardDAO.freeBoardList(vo);
	}

}
