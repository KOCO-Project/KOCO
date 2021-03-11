package co.kr.koco.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.koco.dao.SeasonDAO;
import co.kr.koco.vo.PageVO;
import co.kr.koco.vo.SeasonVO;


@Service("SeasonService")
public class SeasonServiceImpl implements SeasonService{
	
	private int pageListcnt = 10; // �럹�씠吏��떦 湲� 媛쒖닔
	private int pagePaginationcnt = 10;
	
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
	
	public List<SeasonVO> getSeasonBoardList(SeasonVO vo,int page) {
		int start = (page-1)*pageListcnt;
		RowBounds rowBounds = new RowBounds(start, pageListcnt);//pageListcnt-�럹�씠吏��떦 湲� 媛쒖닔
		return seasonDAO.getSeasonBoardList(vo, rowBounds);
	}
	
	public PageVO getSeasonBoardCnt(SeasonVO vo, int currentPage) {
		int contentCnt = seasonDAO.getSeasonBoardCnt(vo);//�쟾泥닿� 媛��닔
		PageVO pageVO = new PageVO(contentCnt, currentPage, pageListcnt, pagePaginationcnt);
		return pageVO;
	}
	
	public List<SeasonVO> getSeasonMainList(SeasonVO vo){
		return seasonDAO.getSeasonMainList(vo);
	}

}
