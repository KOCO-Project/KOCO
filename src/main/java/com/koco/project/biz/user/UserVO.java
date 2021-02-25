package com.koco.project.biz.user;

public class UserVO {
	private int userNo;
	private String userId;
	private String userPw;
	private String userNickname;
	private String userEmail;
	private int userStatus;
	private int userCase;
	private String userRegdate;	
	
	public UserVO() {
		super();
	}

	public UserVO(int userNo, String userId, String userPw, String userNickname, String userEmail, int userStatus,
			int userCase, String userRegdate) {
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

	public int getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(int userStatus) {
		this.userStatus = userStatus;
	}

	public int getUserCase() {
		return userCase;
	}

	public void setUserCase(int userCase) {
		this.userCase = userCase;
	}

	public String getUserRegdate() {
		return userRegdate;
	}

	public void setUserRegdate(String userRegdate) {
		this.userRegdate = userRegdate;
	}

}
