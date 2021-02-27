package co.kr.koco.vo;

import java.sql.Date;

import javax.validation.constraints.NotBlank;

public class CultureVO {

	private int cultureNO;

	@NotBlank
	private String cultureTitle;

	@NotBlank
	private String cultureContent;
	private Date cultureRegdate;
	private int userNo;
	private String userNickname;
	private String searchCondition;
	private String searchKeyword;

	@Override
	public String toString() {
		return "CultureVO [cultureNO=" + cultureNO + ", cultureTitle=" + cultureTitle + ", cultureContent="
				+ cultureContent + ", cultureRegdate=" + cultureRegdate + ", userNo=" + userNo + ", userNickname="
				+ userNickname + "]";
	}

	public int getCultureNO() {
		return cultureNO;
	}

	public void setCultureNO(int cultureNO) {
		this.cultureNO = cultureNO;
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
