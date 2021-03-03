package co.kr.koco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.koco.dao.SeasonDAO;
import co.kr.koco.vo.SeasonVO;


@Service("SeasonService")
public class SeasonServiceImpl implements SeasonService{
	@Autowired
	private SeasonDAO seasonDAO;
	
	public List<SeasonVO> getSeasonList(SeasonVO vo){
		return seasonDAO.getSeasonList(vo);
	}
	
	public SeasonVO getSeasonBoard(int seasonNo) {
		return seasonDAO.getSeasonBoard(seasonNo);
	}
	
	public void seasonRegister(SeasonVO vo) {
		seasonDAO.seasonRegister(vo);
	}
	
	public void deleteSeasonBoard(int seasonNo) {
		seasonDAO.deleteSeasonBoard(seasonNo);
	}
	
	public void seasonUpdate(SeasonVO vo) {
		seasonDAO.seasonUpdate(vo);
	}

}
