package co.kr.koco.vo;

public class PageVO {
	
	// 최소 페이지 번호
	private int min;
	// 최대 페이지 번호
	private int max;
	// 이전 버튼의 페이지 번호
	private int prevPage;
	// 다음 버튼의 페이지 번호
	private int nextPage;
	// 전체 페이지 개수
	private int pageCnt;
	// 현재 페이지 번호
	private int currentPage;
//	contentCnt:전체 글 개수, currentPage:현재 글 번호, contentPageCnt:페이지당 글 개수=10, paginationCnt:페이지 버튼 개수=10
	public PageVO(int contentCnt, int currentPage, int contentPageCnt, int paginationCnt) {
//		DB,page파라미터,서비스,서비스(프로퍼티에서 설정하려했으나 value어노테이션 문제,,)
		// 현재 페이지 번호
		this.currentPage = currentPage;
		
		// 전체 페이지 개수 = 전체글/페이지당글(나머지부분을 넣을 추가 페이지+1)
		pageCnt = contentCnt / contentPageCnt; 
		if(contentCnt % contentPageCnt > 0) {
			pageCnt++;
		}
		
		min = ((currentPage - 1) / contentPageCnt) * contentPageCnt + 1;
		max = min + paginationCnt - 1;
		
		if(max > pageCnt) {
			max = pageCnt;
		}
		
		prevPage = min - 1;
		nextPage = max + 1;
		if(nextPage > pageCnt) {
			nextPage = pageCnt;
		}
	}
	
	public int getMin() {
		return min;
	}
	public int getMax() {
		return max;
	}
	public int getPrevPage() {
		return prevPage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public int getPageCnt() {
		return pageCnt;
	}
	public int getCurrentPage() {
		return currentPage;
	}

}
