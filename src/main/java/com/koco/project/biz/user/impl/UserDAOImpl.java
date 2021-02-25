package com.koco.project.biz.user.impl;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koco.project.biz.user.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {
	@Autowired
	private SqlSessionTemplate sql;

	@Override
	public void userRegister(UserVO userVo) throws Exception {
		sql.insert("userMapper.register", userVo);
	}

	@Override
	public Map<String, UserVO> login(UserVO userVo) throws Exception {
		return sql.selectOne("userMapper.loginCheck", userVo);
	}

}
