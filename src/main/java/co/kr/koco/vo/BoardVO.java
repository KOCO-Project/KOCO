package co.kr.koco.vo;

import javax.validation.constraints.NotBlank;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {
	private int boardNo; // 게시글 번호
	private int boardCategory; // 게시판 번호
	
	@NotBlank
	private String boardTitle;
	@NotBlank
	private String boardContent;
	
	private String boardRegdate;

//	클라에서 보내는 파일 데이터
	private MultipartFile uploadFile;
//	서버에있는 파일이름
	private String fileName;
	private String thumbnail;
	private int userNo;
	private String writer;
	private int boardReadcount;
	private String searchCondition;
	private String searchKeyword;
	
	@Override
	public String toString() {
		return "BoardVO [boardNo=" + boardNo + ", boardCategory=" + boardCategory + ", boardTitle=" + boardTitle
				+ ", boardContent=" + boardContent + ", boardRegdate=" + boardRegdate + ", uploadFile=" + uploadFile
				+ ", fileName=" + fileName + ", thumbnail=" + thumbnail + ", userNo=" + userNo + ", boardReadcount="
				+ boardReadcount + ", searchCondition=" + searchCondition + ", searchKeyword=" + searchKeyword + "]";
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
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
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getBoardRegdate() {
		return boardRegdate;
	}
	public void setBoardRegdate(String boardRegdate) {
		this.boardRegdate = boardRegdate;
	}
	public int getBoardReadcount() {
		return boardReadcount;
	}
	public void setBoardReadcount(int boardReadcount) {
		this.boardReadcount = boardReadcount;
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
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	
	
}
