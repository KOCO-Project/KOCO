package co.kr.koco.vo;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class UserVO {
	private int userNo;
	
	@NotBlank
	@Size(min = 4, max = 20)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	private String userId;
	
	@NotBlank
	@Size(min = 8, max = 20)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	private String userPw;
	
	@NotBlank
	@Size(min = 1, max = 20)
	private String userNickname;
	
	@NotBlank
	@Email
	private String userEmail;
	
	private String userStatus;
	private String userCase;
	private String userRegdate;	
	
	private boolean userIdExist;
	private boolean userLogin;
	private String currentPw;
	private String newPw;
	
	public UserVO() {
		this.userIdExist = false;
	}

	public UserVO(int userNo, String userId, String userPw, String userNickname, String userEmail, String userStatus,
			String userCase, String userRegdate) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPw = userPw;
		this.userNickname = userNickname;
		this.userEmail = userEmail;
		this.userStatus = userStatus;
		this.userCase = userCase;
		this.userRegdate = userRegdate;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserNickname() {
		return userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}

	public String getUserCase() {
		return userCase;
	}

	public void setUserCase(String userCase) {
		this.userCase = userCase;
	}

	public String getUserRegdate() {
		return userRegdate;
	}

	public void setUserRegdate(String userRegdate) {
		this.userRegdate = userRegdate;
	}

	public boolean isUserIdExist() {
		return userIdExist;
	}

	public void setUserIdExist(boolean userIdExist) {
		this.userIdExist = userIdExist;
	}

	public String getCurrentPw() {
		return currentPw;
	}

	public void setCurrentPw(String currentPw) {
		this.currentPw = currentPw;
	}

	public String getNewPw() {
		return newPw;
	}

	public void setNewPw(String newPw) {
		this.newPw = newPw;
	}
	
	public boolean isUserLogin() {
		return userLogin;
	}
	
	public void setUserLogin(boolean userLogin) {
		this.userLogin = userLogin;
		
	}

}
