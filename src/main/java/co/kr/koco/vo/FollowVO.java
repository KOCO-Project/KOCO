package co.kr.koco.vo;

public class FollowVO {
	private int followNo;
	private String fromFollow;
	private String toFollow;

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

	@Override
	public String toString() {
		return "FollowVO [fromFollow=" + fromFollow + ", toFollow=" + toFollow + "]";
	}

}
