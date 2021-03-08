package co.kr.koco.service;

import java.util.List;

import co.kr.koco.vo.CommentVO;

public interface CommentService {
	
	List<CommentVO> commentList(CommentVO vo);
	
	void commentRegister(CommentVO vo);
	
	void comcommentRegister(CommentVO vo);
	
	void commentDelete(int groupNo);
	
	void comcommentDelete(int commentNo);
	
	void commentUpdate(CommentVO vo);
	
	CommentVO commentGet(int commentNo);
	
	Integer commentGetGroupNo();
}
