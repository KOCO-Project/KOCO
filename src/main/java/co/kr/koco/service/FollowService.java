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
	
	public void unfollow(FollowVO followVo) throws Exception {
		dao.unfollow(followVo);
	}
	
	public void updateFromFollow(FollowVO followVo) throws Exception {
		dao.updateFromFollow(followVo);
	}
	
	public void updateToFollow(FollowVO followVo) throws Exception {
		dao.updateToFollow(followVo);
	}
	
	public int followyn(FollowVO followVo) throws Exception {
		return dao.followyn(followVo);
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
