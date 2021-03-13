package co.kr.koco.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.koco.dao.CultureDAO;
import co.kr.koco.vo.CultureVO;
import co.kr.koco.vo.PageVO;

@Service("CultureService")
public class CultureServiceImpl implements CultureService {

	//페이징 관련 변수 선언
	private int pageListcnt = 10; // 페이지당 글 개수
	private int pagePaginationcnt = 10;
	
	@Autowired
	private CultureDAO cultureDAO;

	public List<CultureVO> getCultureList(CultureVO vo) {
		return cultureDAO.getCultureList(vo);
	}
	
	public void cultureRegister(CultureVO vo) {
		cultureDAO.cultureRegister(vo);
	}
	
	public CultureVO getCultureBoard(int cultureNo) {
		return cultureDAO.getCultureBoard(cultureNo);
	}
	
	public void deleteCultureBoard(int cultureNo) {
		cultureDAO.deleteCultureBoard(cultureNo);
	}
	
	public void cultureUpdate(CultureVO vo) {
		cultureDAO.cultureUpdate(vo);
	}
	
	public List<CultureVO> getCultureBoardList(CultureVO vo,int page) {
		int start = (page-1)*pageListcnt;
		RowBounds rowBounds = new RowBounds(start, pageListcnt);//pageListcnt-페이지당 글 개수
		return cultureDAO.getCultureBoardList(vo, rowBounds);
	}
	
	public PageVO getCultureBoardCnt(CultureVO vo, int currentPage) {
		int contentCnt = cultureDAO.getCultureBoardCnt(vo);//전체글 갯수
		PageVO pageVO = new PageVO(contentCnt, currentPage, pageListcnt, pagePaginationcnt);
		return pageVO;
	}
	
	public List<CultureVO> getCultureMainList(CultureVO vo){
		return cultureDAO.getCultureMainList(vo);
	}
}
