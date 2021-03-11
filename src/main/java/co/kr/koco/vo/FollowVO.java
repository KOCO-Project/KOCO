package co.kr.koco.vo;

public class FollowVO {
	private int followNo;
	private String fromFollow;
	private String toFollow;
	private int followYn;
	private String newNick;
	private String oldNick;

	public int getFollowNo() {
		return followNo;
	}

	public void setFollowNo(int followNo) {
		this.followNo = followNo;
	}

	public String getFromFollow() {
		return fromFollow;
	}

	public void setFromFollow(String fromFollow) {
		this.fromFollow = fromFollow;
	}

	public String getToFollow() {
		return toFollow;
	}

	public void setToFollow(String toFollow) {
		this.toFollow = toFollow;
	}
	
	public int getFollowYn() {
		return followYn;
	}

	public void setFollowYn(int followYn) {
		this.followYn = followYn;
	}

	public String getNewNick() {
		return newNick;
	}

	public void setNewNick(String newNick) {
		this.newNick = newNick;
	}

	public String getOldNick() {
		return oldNick;
	}

	public void setOldNick(String oldNick) {
		this.oldNick = oldNick;
	}

	@Override
	public String toString() {
		return "FollowVO [fromFollow=" + fromFollow + ", toFollow=" + toFollow + "]";
	}

}
