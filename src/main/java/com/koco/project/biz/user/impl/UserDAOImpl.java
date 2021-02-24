package com.koco.project.biz.user.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koco.project.biz.user.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {
	@Autowired
	private SqlSessionTemplate sql;	
	
	@Override
	public void userRegister(UserVO vo) throws Exception {
		sql.insert("userMapper.register", vo);
	}

	@Override
	public UserVO login(UserVO vo) throws Exception {
		return sql.selectOne("userMapper.login", vo);
	}

}
