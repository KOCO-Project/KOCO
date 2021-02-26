package co.kr.koco.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionFactoryBean;

import co.kr.koco.vo.FreeBoardVO;

public class FreeBoardDAO {
	private SqlSession mybatis;
	
	public FreeBoardDAO() {
		mybatis = SqlSessionFactoryBean.getSqlSessionInstance();
	}
	// 글 등록
	public void boardRegister(FreeBoardVO vo) {
		mybatis.insert("FreeBoardDAO.boardRegister", vo);
		mybatis.commit();
	}
	
	// 글 수정
	public void boardUpdate(FreeBoardVO vo) {
		mybatis.update("FreeBoardDAO.boardUpdate", vo);
		mybatis.commit();
	}
	
	// 글 삭제
	public void boardDelete(FreeBoardVO vo) {
		mybatis.delete("FreeBoardDAO", vo);
		mybatis.commit();
	}
	
	// 글 상세 조회
	public FreeBoardVO getFreeBoard(FreeBoardVO vo) {
		
		return (FreeBoardVO) mybatis.selectOne("FreeBoardDAO", vo);
	}
	
	//  글 목록 조회
	public List<FreeBoardVO> freeBoardList(FreeBoardVO vo) {
		
		return mybatis.selectList("FreeBoardDAO.freeBoardList", vo);
	}
}
