package co.kr.koco.dao;

import java.util.Map;

import co.kr.koco.vo.UserVO;

public interface UserDAO {
	// 아이디 중복검사
	public String userIdExist(String userId);

	// 닉네임 중복검사
	public String userNicknameExist(String userNickname);
	
	// 이메일 중복검사
	public String userEmailExist(String userEmail);

	// 회원가입
	public void userRegister(UserVO userVo) throws Exception;

	// 로그인
	public Map<String, UserVO> login(UserVO userVo) throws Exception;
	
	// id, password 찾기
	public UserVO findIdPw(String userEmail) throws Exception;

}
