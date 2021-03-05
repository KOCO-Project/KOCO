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
	
	public void commentRegister(CommentVO vo) {
		mybatis.insert("commentMapper.commentRegister", vo);
	}
	
	public void commentDelete(int commentNo) {
		mybatis.delete("commentMapper.commentDelete", commentNo);
	}
}
