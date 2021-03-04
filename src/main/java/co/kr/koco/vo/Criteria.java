package co.kr.koco.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@ToString
@Setter
@Getter
public class Criteria {

  private int pageNum;
  private int amount;
  
  private String type;
  private String keyword;

  public Criteria() {
    this(1, 10);
  }

  public Criteria(int pageNum, int amount) {
    this.pageNum = pageNum;		// 현재 보여주고 있는 페이지
    this.amount = amount;		// 페이지 마다의 게시글 수
  }
  
//  public String[] getTypeArr() {
//    
//    return type == null? new String[] {}: type.split("");
//  }
}
