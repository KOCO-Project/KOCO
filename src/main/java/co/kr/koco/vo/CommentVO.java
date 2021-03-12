package co.kr.koco.vo;

import java.sql.Date;

import javax.validation.constraints.NotBlank;

public class CommentVO {
	
	private int commentNo;
	private int boardCategory;
	private int boardNo;
	private int depth;
	@NotBlank
	private String commentContent;
	private Date commentRegdate;
	private int replyNo;
	private int groupNo;
	private int userNo;
	private String userNickname;
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public String getUserNickname() {
		return userNickname;
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	public int getBoardCategory() {
		return boardCategory;
	}
	public void setBoardCategory(int boardCategory) {
		this.boardCategory = boardCategory;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public Date getCommentRegdate() {
		return commentRegdate;
	}
	public void setCommentRegdate(Date commentRegdate) {
		this.commentRegdate = commentRegdate;
	}
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	@Override
	public String toString() {
		return "CommentVO [commentNo=" + commentNo + ", boardCategory=" + boardCategory + ", boardNo=" + boardNo
				+ ", depth=" + depth + ", commentContent=" + commentContent + ", commentRegdate=" + commentRegdate
				+ ", replyNo=" + replyNo + ", groupNo=" + groupNo + ", userNo=" + userNo + "]";
	}
	
	
}
