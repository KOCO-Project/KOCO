package co.kr.koco.vo;

public class BookMarkVO {
	private int boardNo;
	private int boardCategory;
	private int userNo;
	private String boardTitle;
	private String writer;
	private String categoryName;
	
	public BookMarkVO() {
		super();
		// TODO Auto-generated constructor stub
	}



	public int getBoardNo() {
		return boardNo;
	}



	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}



	public int getBoardCategory() {
		return boardCategory;
	}



	public void setBoardCategory(int boardCategory) {
		this.boardCategory = boardCategory;
	}



	public int getUserNo() {
		return userNo;
	}



	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}



	public String getBoardTitle() {
		return boardTitle;
	}



	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}



	public String getWriter() {
		return writer;
	}



	public void setWriter(String writer) {
		this.writer = writer;
	}



	public String getCategoryName() {
		return categoryName;
	}



	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}



	@Override
	public String toString() {
		return "BookMarkVO [boardNo=" + boardNo + ", boardCategory=" + boardCategory + ", userNo=" + userNo
				+ ", boardTitle=" + boardTitle + ", writer=" + writer + ", categoryName=" + categoryName + "]";
	}
	
	
}
