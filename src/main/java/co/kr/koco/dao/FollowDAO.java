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
		sql.insert("userMapper.follow", followVo);
	}
	
	public String follower(String toFollow) throws Exception {
		return sql.selectOne("userMapper.follower", toFollow);
	}
	
	public List<FollowVO> followerList(String toFollow) throws Exception {
		return sql.selectList("userMapper.followerList", toFollow);
	}
}
