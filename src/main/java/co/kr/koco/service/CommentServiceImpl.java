package co.kr.koco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.koco.dao.CommentDAO;
import co.kr.koco.vo.CommentVO;

@Service("CommentService")
public class CommentServiceImpl {
	@Autowired
	private CommentDAO commentDAO;
	
	public List<CommentVO> commentList(CommentVO vo){
		
		return commentDAO.CommentList(vo);
		
	}
}