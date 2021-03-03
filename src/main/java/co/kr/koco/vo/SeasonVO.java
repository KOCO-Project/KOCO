package co.kr.koco.vo;

import java.sql.Date;

import javax.validation.constraints.NotBlank;

public class SeasonVO {
	
	private int seasonNo;
	@NotBlank
	private String seasonTitle;
	@NotBlank
	private String seasonContent;
	private Date seasonRegdate;
	@NotBlank
	private int seasonStatus;
	@NotBlank
	private int userNo;
	
	public int getSeasonNo() {
		return seasonNo;
	}
	public void setSeasonNo(int seasonNo) {
		this.seasonNo = seasonNo;
	}
	public String getSeasonTitle() {
		return seasonTitle;
	}
	public void setSeasonTitle(String seasonTitle) {
		this.seasonTitle = seasonTitle;
	}
	public String getSeasonContent() {
		return seasonContent;
	}
	public void setSeasonContent(String seasonContent) {
		this.seasonContent = seasonContent;
	}
	public Date getSeasonRegdate() {
		return seasonRegdate;
	}
	public void setSeasonRegdate(Date seasonRegdate) {
		this.seasonRegdate = seasonRegdate;
	}
	public int getSeasonStatus() {
		return seasonStatus;
	}
	public void setSeasonStatus(int seasonStatus) {
		this.seasonStatus = seasonStatus;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	@Override
	public String toString() {
		return "SeasonVO [seasonNo=" + seasonNo + ", seasonTitle=" + seasonTitle + ", seasonContent=" + seasonContent
				+ ", seasonRegdate=" + seasonRegdate + ", seasonStatus=" + seasonStatus + ", userNo=" + userNo + "]";
	}
	
	
}

