package co.kr.koco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.koco.dao.TopMenuDao;
import co.kr.koco.vo.BoardInfoVO;

@Service
public class TopMenuService {

	@Autowired
	private TopMenuDao topMenuDao;

	public List<BoardInfoVO> getTopMenuList() {
		List<BoardInfoVO> topMenuList = topMenuDao.getTopMenuList();
//		System.out.println(topMenuList+"Service");
		return topMenuList;
	}
}
