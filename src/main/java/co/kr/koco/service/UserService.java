package co.kr.koco.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import co.kr.koco.dao.UserDAO;
import co.kr.koco.vo.PageVO;
import co.kr.koco.vo.ProfileImgVO;
import co.kr.koco.vo.UserVO;

@Service
public class UserService {
	@Autowired
	private UserDAO dao;
	
	@Resource(name = "userVO")
	@Lazy
	private UserVO userVO;
	
	private int pageListcnt = 10; // 페이지당 글 개수
	private int pagePaginationcnt = 10;

	public boolean userIdExist(String userId) {
		String exist = dao.userIdExist(userId);

		if (exist == null) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean userNicknameExist(String userNickname) {
		String exist = dao.userNicknameExist(userNickname);
		
		if (exist == null) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean userEmailExist(String userEmail) {
		String exist = dao.userEmailExist(userEmail);
		
		if (exist == null) {
			return true;
		} else {
			return false;
		}
	}

	public void userRegister(UserVO userVo) throws Exception {
		dao.userRegister(userVo);
	}

	public UserVO login(UserVO userVo) throws Exception {
		UserVO loginUserVO = dao.login(userVo);
		if(loginUserVO != null) {
			userVO.setUserLogin(true);
		}
		System.out.println(loginUserVO);
		return loginUserVO;
	}

	public UserVO findIdPw(String userEmail) throws Exception {
		return dao.findIdPw(userEmail);
	}
	
	public void userUpdate(UserVO userVo) throws Exception {
		dao.userUpdate(userVo);
	}
	
	public void pwUpdate(UserVO userVo) throws Exception {
		dao.pwUpdate(userVo);
	}
	
	public UserVO userPage(String userNickname) throws Exception {
		return (UserVO) dao.userPage(userNickname);
	}

	public List<UserVO> userList(UserVO userVo) throws Exception {
		return dao.userList(userVo);
	}
	
	public void imgRegister(ProfileImgVO profileVo) throws Exception {
		dao.imgRegister(profileVo);
	}
	
	//-------------------------------관리자--------------------------------------
	
	public List<UserVO> getAdminUserList(UserVO vo,int page) throws Exception{
		
		int start = (page-1)*pageListcnt;
		RowBounds rowBounds = new RowBounds(start, pageListcnt);//pageListcnt-페이지당 글 개수
		return dao.getAdminUserList(vo, rowBounds);
	}
	
	public PageVO getAdminUserCnt(UserVO vo,int currentPage) throws Exception{
		int contentCnt = dao.getAdminUserCnt(vo);//전체글 갯수
		PageVO pageVO = new PageVO(contentCnt, currentPage, pageListcnt, pagePaginationcnt);
		return pageVO;
	}
	
	public void adminUserDelete(int userNo) throws Exception {
		dao.adminUserDelete(userNo);
	}
	
	public void adminSimpleUpdate(UserVO vo) throws Exception{
		dao.adminSimpleUpdate(vo);
	}
	
	public UserVO adminGetUser(int userNo) throws Exception{
		return dao.adminGetUser(userNo);
	}
	
	public void adminUserUpdate(UserVO vo) throws Exception{
		dao.adminUserUpdate(vo);
	}

}
