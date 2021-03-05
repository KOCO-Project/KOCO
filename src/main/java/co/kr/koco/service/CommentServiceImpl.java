package co.kr.koco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.koco.dao.CommentDAO;
import co.kr.koco.vo.CommentVO;
import co.kr.koco.vo.SeasonVO;

@Service("CommentService")
public class CommentServiceImpl implements CommentService{
	@Autowired
	private CommentDAO commentDAO;
	
	public List<CommentVO> commentList(CommentVO vo){
		
		return commentDAO.commentList(vo);
		
	}
	
	public CommentVO commentGet(int commentNo) {
			return commentDAO.commentGet(commentNo);
	}

	public void commentRegister(CommentVO vo) {
		commentDAO.commentRegister(vo);
	}
	
	public void commentDelete(int commentNo) {
		commentDAO.commentDelete(commentNo);
	}
	
	
	public void commentUpdate(CommentVO vo) {
		commentDAO.commentUpdate(vo);
	}
}
