package co.kr.koco.vo;

import java.sql.Date;

import javax.validation.constraints.NotBlank;

public class CultureVO {

	private int cultureNo;

	@NotBlank
	private String cultureTitle;

	@NotBlank
	private String cultureContent;
	private Date cultureRegdate;
	private int userNo;
	private String userNickname;
	private int culturePick;

	private String searchCondition;
	private String searchKeyword;


	
	@Override
	public String toString() {
		return "CultureVO [cultureNo=" + cultureNo + ", cultureTitle=" + cultureTitle + ", cultureContent="
				+ cultureContent + ", cultureRegdate=" + cultureRegdate + ", userNo=" + userNo + ", userNickname="
				+ userNickname + ", culturePick=" + culturePick + "]";
	}


	public int getCulturePick() {
		return culturePick;
	}


	public void setCulturePick(int culturePick) {
		this.culturePick = culturePick;
	}


	public void setCultureNo(int cultureNo) {
		this.cultureNo = cultureNo;
	}


	public int getCultureNo() {
		return cultureNo;
	}

	public void setCultureNO(int cultureNo) {
		this.cultureNo = cultureNo;
	}

	public String getCultureTitle() {
		return cultureTitle;
	}

	public void setCultureTitle(String cultureTitle) {
		this.cultureTitle = cultureTitle;
	}

	public String getCultureContent() {
		return cultureContent;
	}

	public void setCultureContent(String cultureContent) {
		this.cultureContent = cultureContent;
	}

	public Date getCultureRegdate() {
		return cultureRegdate;
	}

	public void setCultureRegdate(Date cultureRegdate) {
		this.cultureRegdate = cultureRegdate;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserNickname() {
		return userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

}
