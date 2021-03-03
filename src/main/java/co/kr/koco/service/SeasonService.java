package co.kr.koco.service;

import java.util.List;

import co.kr.koco.vo.SeasonVO;

public interface SeasonService {

	List<SeasonVO> getSeasonList(SeasonVO vo);
	
	SeasonVO getSeasonBoard(int seasonNo);
	
	void seasonRegister(SeasonVO vo);
	
	void deleteSeasonBoard(int seasonNo);
	
	void seasonUpdate(SeasonVO vo);
	

}
