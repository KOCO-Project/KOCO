package co.kr.koco.vo;

public class PageDTO {

	private int startPage;
	private int endPage;
	private boolean prev, next; // 이전페이지, 다음페이지

	private int total; // 전체 게시글의 수
	private Criteria cri; // 현재페이지를 보기위한 형태

	public PageDTO(Criteria cri, int total) {

		this.cri = cri;
		this.total = total;

		this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0)) * 10; // cri.getPageNum()는 현제페이지

		this.startPage = this.endPage - 9; // 공식대로 끝페이지를 구하고 시작페이지를 구한다

		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount())); // cri.getAmount()는 데이터건수 = 끝페이지를 알 수 있겠지

		if (realEnd <= this.endPage) {
			this.endPage = realEnd;
		}
		// 게시글 수에 따라서 페이지 수가 달라지는 결정적인 코드
		// ex) 게시글수가 123개이면 페이지수가 20까지가 아닌 13까지 나와야한다, 한페이지에 10게시글씩 나올경우!

//    int pageNum = cri.getPageNum();
//    if(pageNum>1) {
//    	pageNum+=realEnd;
//    }
		this.prev = this.startPage > 1;

		this.next = this.endPage < realEnd;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "PageDTO [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", total=" + total + "]";
	}

}
