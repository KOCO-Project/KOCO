package co.kr.koco.vo;

import java.util.List;

public class BoardInfoVO {

	private int infoNo;
	private String infoName;

	
	public int getInfoNo() {
		return infoNo;
	}
	public void setInfoNo(int infoNo) {
		this.infoNo = infoNo;
	}
	public String getInfoName() {
		return infoName;
	}
	public void setInfoName(String infoName) {
		this.infoName = infoName;
	}

	@Override
	public String toString() {
		return "BoardInfoVO [infoNo=" + infoNo + ", infoName=" + infoName + "]";
	}
	

	
}
