package co.kr.koco.vo;

import lombok.Data;

@Data
public class BookMarkVO {
	private int boardNo;
	private int boardCategory;
	private int userNo;
//	private int bookMarkAdd;
	private String boardTitle;
	private String writer;
	private String categoryName;
}
