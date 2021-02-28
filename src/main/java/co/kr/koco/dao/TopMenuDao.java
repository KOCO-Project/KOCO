package co.kr.koco.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ModelAttribute;

import co.kr.koco.vo.BoardInfoVO;

@Repository
public class TopMenuDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@ModelAttribute("BoardInfoVO")
	public List<BoardInfoVO> getTopMenuList(){
		List<BoardInfoVO> topMenuList = sqlSessionTemplate.selectList("topmenu.getlist");
//		System.out.println(topMenuList+"dao");
		return topMenuList;
	}
}
