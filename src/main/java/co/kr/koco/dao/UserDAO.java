package co.kr.koco.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.koco.vo.BookMarkVO;
import co.kr.koco.vo.ProfileImgVO;
import co.kr.koco.vo.UserVO;

@Repository
public class UserDAO {
	@Autowired
	private SqlSessionTemplate sql;

	// 유효성 검사(ID, 닉네임, 이메일) -----------------------------------------------
	public String userIdExist(String userId) {
		return sql.selectOne("userMapper.userIdExist", userId);
	}
	
	public String userNicknameExist(String userNickname) {		
		return sql.selectOne("userMapper.userNicknameExist", userNickname);
	}
	
	public String userEmailExist(String userEmail) {
		return sql.selectOne("userMapper.userEmailExist", userEmail);
	}
	// ----------------------------------------------------------------------

	// 회원가입
	public void userRegister(UserVO userVo) throws Exception {
		sql.insert("userMapper.register", userVo);
	}

	// 로그인
	public UserVO login(UserVO userVo) throws Exception {
		return (UserVO) sql.selectOne("userMapper.loginCheck", userVo);
	}

	// ID, PW 찾기
	public UserVO findIdPw(String userEmail) throws Exception {
		return (UserVO) sql.selectOne("userMapper.findIdPw", userEmail);
	}
	
	// 회원정보수정(닉네임)
	public void userUpdate(UserVO userVo) throws Exception {
		sql.update("userMapper.userUpdate", userVo);
	}
	
	// 회원정보수정(비밀번호)
	public void pwUpdate(UserVO userVo) throws Exception {
		sql.update("userMapper.pwUpdate", userVo);
	}
	
	// 휴면계정 활성화
	public void sleepUserActivate(String userEmail) throws Exception {
		sql.update("userMapper.sleepUserActivate", userEmail);
	}
	
	// 유저페이지
	public UserVO userPage(String userNickname) throws Exception{
		return (UserVO) sql.selectOne("userMapper.userPage", userNickname);
	}

	public List<UserVO> userList(UserVO userVo) throws Exception {
		return sql.selectList("userMapper.userList", userVo);
	}
	
	public void imgRegister(ProfileImgVO profileVo) throws Exception {
		sql.insert("userMapper.imgRegister", profileVo);
	}
	
	//-------------------------------------관리자-----------------------------------------
	
	public List<UserVO> getAdminUserList(UserVO vo,RowBounds rowBounds) throws Exception{
		if (vo.getSearchCondition() == null || vo.getSearchCondition().equals("검색"))
			vo.setSearchCondition("ID");
		
		if (vo.getSearchKeyword() == null)
			vo.setSearchKeyword("");
		
		System.out.println("DAO에서 보는 유저 컨디션 값 : " + vo.getSearchCondition());
		System.out.println("DAO에서 보는 유저 키워드 값 : " + vo.getSearchKeyword());
		
		return sql.selectList("userMapper.getAdminUserList",vo,rowBounds);
	}

	public int getAdminUserCnt(UserVO vo) {
		if (vo.getSearchCondition() == null || vo.getSearchCondition().equals("검색"))
			vo.setSearchCondition("ID");
		
		if (vo.getSearchKeyword() == null)
			vo.setSearchKeyword("");
		return sql.selectOne("userMapper.getAdminUserCnt",vo);
	}
	
	public void adminUserDelete(int userNo) {
		System.out.println(userNo);
		sql.delete("userMapper.adminUserDelete",userNo);
	}
	
	public void adminSimpleUpdate(UserVO vo) {
		sql.update("userMapper.adminSimpleUpdate",vo);
	}
	
	public UserVO adminGetUser(int userNo) {
		return (UserVO) sql.selectOne("userMapper.adminGetUser",userNo);
	}
	
	public void adminUserUpdate(UserVO vo) {
//		System.out.println(vo.getUserNo());
//		System.out.println(vo.getUserId());
//		System.out.println(vo.getUserNickname());
//		System.out.println(vo.getUserPw());
//		System.out.println(vo.getUserEmail());
//		System.out.println(vo.getUserStatus());
//		System.out.println(vo.getUserCase());
		sql.update("userMapper.adminUserUpdate",vo);
	}
	public List<UserVO> bookmarkList(BookMarkVO bookmark) {
		return sql.selectList("userMapper.bookmarkList",bookmark);
	}
}

