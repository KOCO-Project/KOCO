package co.kr.koco.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.koco.vo.FollowVO;

@Repository
public class FollowDAO {
	@Autowired
	private SqlSessionTemplate sql;

	public void follow(FollowVO followVo) throws Exception {
		sql.insert("followMapper.follow", followVo);
	}
	
	public void unfollow(FollowVO followVo) throws Exception {
		sql.update("followMapper.unfollow", followVo);
	}
	
	public void updateFromFollow(FollowVO followVo) throws Exception {
		sql.update("followMapper.updateFromFollow", followVo);
	}
	
	public void updateToFollow(FollowVO followVo) throws Exception {
		sql.update("followMapper.updateToFollow", followVo);
	}
	
	public int followyn(FollowVO followVO) throws Exception {
		return sql.selectOne("followMapper.followyn", followVO);
	}
	
	public int followerCnt(String toFollow) throws Exception {
		return sql.selectOne("followMapper.followerCnt", toFollow);
	}
	
	public int followingCnt(String fromFollow) throws Exception {
		return sql.selectOne("followMapper.followingCnt", fromFollow);
	}
	
	public List<FollowVO> followerList(String toFollow) throws Exception {
		return sql.selectList("followMapper.followerList", toFollow);
	}
	
	public List<FollowVO> followingList(String fromFollow) throws Exception {
		return sql.selectList("followMapper.followingList", fromFollow);
	}
}
