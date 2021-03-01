package co.kr.koco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.koco.dao.CultureDAO;
import co.kr.koco.vo.CultureVO;

@Service("CultureService")
public class CultureServiceImpl implements CultureService {

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
}
