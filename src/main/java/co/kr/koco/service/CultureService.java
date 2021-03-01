package co.kr.koco.service;

import java.util.List;

import co.kr.koco.vo.CultureVO;

public interface CultureService {

	// 글 목록 조회
	List<CultureVO> getCultureList(CultureVO vo);

	void cultureRegister(CultureVO vo);

	CultureVO getCultureBoard(int cultureNo);

	void deleteCultureBoard(int cultureNo);

	void cultureUpdate(CultureVO vo);
}
