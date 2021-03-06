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
	
	public int followerCnt(String toFollow) throws Exception {
		return dao.followerCnt(toFollow);
	}
	
	public int followingCnt(String fromFollow) throws Exception {
		return dao.followingCnt(fromFollow);
	}
	
	public List<FollowVO> followerList(String toFollow) throws Exception {
		return dao.followerList(toFollow);
	}
	
	public List<FollowVO> followingList(String fromFollow) throws Exception {
		return dao.followingList(fromFollow);
	}
}
