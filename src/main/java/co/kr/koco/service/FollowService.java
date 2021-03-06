package co.kr.koco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.koco.dao.FollowDAO;
import co.kr.koco.vo.FollowVO;

@Service
public class FollowService {
	@Autowired
	private FollowDAO dao;
	
	public void follow(FollowVO followVo) throws Exception {
		dao.follow(followVo);
	}
	
	public String follower(String toFollow) throws Exception {
		return dao.follower(toFollow);
	}
	
	public List<FollowVO> followerList(String toFollow) throws Exception {
		return dao.followerList(toFollow);
	}
}
