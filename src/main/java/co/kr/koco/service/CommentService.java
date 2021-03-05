package co.kr.koco.service;

import java.util.List;

import co.kr.koco.vo.CommentVO;

public interface CommentService {
	
	List<CommentVO> commentList(CommentVO vo);
	
	void commentRegister(CommentVO vo);
	
	void commentDelete(int commentNo);
}
