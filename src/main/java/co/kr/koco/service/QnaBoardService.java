package co.kr.koco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.koco.dao.QnaBoardDAO;
import co.kr.koco.vo.BoardVO;
import co.kr.koco.vo.PageVO;
import co.kr.koco.vo.UserVO;

@Service
public class QnaBoardService {
	
	private UserVO loginUser;
	
	@Autowired
	private QnaBoardDAO qnaBoardDAO;

	public List<BoardVO> getQnaList(int infoNo) {
		return qnaBoardDAO.getQnaList(infoNo);
	}

	public void register(BoardVO qnaBoardVO) {
		qnaBoardVO.setUserNo(loginUser.getUserNo());
		qnaBoardDAO.register(qnaBoardVO);
	}
	
// 상세읽기
	public BoardVO getQna(int boardNo) {
		return qnaBoardDAO.getQna(boardNo);
	}

	public String getBoardInfoName(int infoNo) {
		// TODO Auto-generated method stub
		return null;
	}

	public PageVO getQnaCnt(int infoNo, int page) {
		// TODO Auto-generated method stub
		return null;
	}



}
