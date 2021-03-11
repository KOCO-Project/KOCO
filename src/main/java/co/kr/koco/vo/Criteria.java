package co.kr.koco.vo;

//import lombok.Getter;
//import lombok.Setter;
//import lombok.ToString;

//@ToString
//@Setter
//@Getter
public class Criteria {

	private int pageNum;
	private int amount;

	private String type;
	private String keyword;

	public Criteria() {
		this(1, 3);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum; // 현재 보여주고 있는 페이지
		this.amount = amount; // 페이지 마다의 게시글 수
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", type=" + type + ", keyword=" + keyword + "]";
	}

//  public String[] getTypeArr() {
//    
//    return type == null? new String[] {}: type.split("");
//  }

}
