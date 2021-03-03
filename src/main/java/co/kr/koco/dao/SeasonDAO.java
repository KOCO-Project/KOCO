package co.kr.koco.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.koco.vo.SeasonVO;

@Repository
public class SeasonDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<SeasonVO> getSeasonList(SeasonVO vo){
		return mybatis.selectList("SeasonDAO.getSeasonList", vo);
	}
	
	public SeasonVO getSeasonBoard(int seasonNo) {
		return (SeasonVO)mybatis.selectOne("SeasonDAO.getSeasonBoard", seasonNo);
	}
	
	public void seasonRegister(SeasonVO vo) {
		mybatis.insert("SeasonDAO.seasonRegister", vo);
	}
	
	public void deleteSeasonBoard(int seasonNo) {
		mybatis.delete("SeasonDAO.deleteSeasonBoard", seasonNo);
	}

	public void seasonUpdate(SeasonVO vo) {
		mybatis.update("SeasonDAO.seasonUpdate", vo);
	}
}
