package co.kr.koco.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.koco.vo.CommentVO;

@Repository
public class CommentDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<CommentVO> commentList(CommentVO vo){
		return mybatis.selectList("commentMapper.commentList", vo);
	}
	public CommentVO commentGet(int commentNo) {
		return mybatis.selectOne("commentMapper.commentGet",commentNo);
	}
	
	public void commentRegister(CommentVO vo) {
		mybatis.insert("commentMapper.commentRegister", vo);
	}
	
	public void comcommentRegister(CommentVO vo) {
		mybatis.insert("commentMapper.comcommentRegister", vo);
	}
	public void commentDelete(int groupNo) {
		mybatis.delete("commentMapper.commentDelete", groupNo);
	}
	
	public void comcommentDelete(int commentNo) {
		mybatis.delete("commentMapper.comcommentDelete", commentNo);
	}
	
	public void commentUpdate(CommentVO vo) {
		mybatis.update("commentMapper.commentUpdate", vo);
	}
	
	public Integer commentGetGroupNo() {
		return (Integer)mybatis.selectOne("commentMapper.commentGetGroupNo");
	}
	
}
