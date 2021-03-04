package co.kr.koco.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import co.kr.koco.vo.BoardVO;
import co.kr.koco.vo.CultureVO;
import co.kr.koco.vo.PageVO;

public interface CultureService {

	// 글 목록 조회
	List<CultureVO> getCultureList(CultureVO vo);

	void cultureRegister(CultureVO vo);

	CultureVO getCultureBoard(int cultureNo);

	void deleteCultureBoard(int cultureNo);

	void cultureUpdate(CultureVO vo);
	
	List<CultureVO> getCultureBoardList(CultureVO vo, int page);
	
	PageVO getCultureBoardCnt(CultureVO vo,int currentPage);
}
