package co.kr.koco.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.koco.vo.BoardVO;
import co.kr.koco.vo.CultureVO;

@Repository
public class CultureDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public List<CultureVO> getCultureList(CultureVO vo) {

		return mybatis.selectList("CultureDAO.getCultureList", vo);
	}

	public void cultureRegister(CultureVO vo) {
		System.out.println("DAO에서 보는 컬쳐픽! " + vo.getCulturePick());
		mybatis.insert("CultureDAO.cultureRegister", vo);
	}

	public CultureVO getCultureBoard(int cultureNo) {
		System.out.println(cultureNo);
		CultureVO vo = mybatis.selectOne("CultureDAO.getCultureBoard", cultureNo);
		System.out.println(vo);
		return (CultureVO) mybatis.selectOne("CultureDAO.getCultureBoard", cultureNo);
	}
	
	//테스트 삭제
	public void deleteCultureBoard(int cultureNo) {
		mybatis.delete("CultureDAO.deleteCultureBoard",cultureNo);
	}
	
	public void cultureUpdate(CultureVO vo) {
		System.out.println(vo.getCultureNo());
		System.out.println(vo.getCultureTitle());
		System.out.println(vo.getCultureContent());
		mybatis.update("CultureDAO.cultureUpdate",vo);
	}
	
	public List<CultureVO> getCultureBoardList(CultureVO vo, RowBounds rowBounds) {
		if (vo.getSearchCondition() == null || vo.getSearchCondition().equals("검색"))
			vo.setSearchCondition("TITLE");
		
		if (vo.getSearchKeyword() == null)
			vo.setSearchKeyword("");
		
		System.out.println("DAO에서보는 "+ vo.getSearchCondition());
		System.out.println("DAO에서보는 "+ vo.getSearchKeyword());
		
		return mybatis.selectList("CultureDAO.getCultureBoardList", vo, rowBounds);
	}
	public int getCultureBoardCnt(CultureVO vo) {
		if (vo.getSearchCondition() == null || vo.getSearchCondition().equals("검색"))
			vo.setSearchCondition("TITLE");
		
		if (vo.getSearchKeyword() == null)
			vo.setSearchKeyword("");
		
		return mybatis.selectOne("CultureDAO.getCultureBoardCnt", vo);
	}
	
	public List<CultureVO> getCultureMainList(CultureVO vo){
		return mybatis.selectList("CultureDAO.getCultureBoardList", vo);
	}
}
