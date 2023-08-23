package com.hobbyfield.app.fnd.paging;

public class PagingHandler {
	
	private int totalCount; //총 게시물 갯수
	private int pageSize; // 한 페이지의 크기
	private int navSize = 5; //페이지 네비게이션의 크기
	private int totalPage; //전체 페이지 갯수
	private int currentPage; //현재 페이지
	private int beginPage; //네비게이션의 첫 번째 페이지
	private int endPage; //네비게이션의 마지막 페이지
	private boolean showPrev; //이전 페이지로 이동하는 링크를 보여줄 것인지의 여부
	private boolean showNext; //이전 페이지로 이동하는 링크를 보여줄 것인지의 여부
	
	public PagingHandler (int totalCount, int currentPage) {
		this(totalCount, currentPage, 5);
	}
	
	public PagingHandler (int totalCount, int currentPage, int pageSize) {
		this.totalCount = totalCount;
		this.currentPage = currentPage;
		this.pageSize = pageSize;
		
		totalPage = (int)Math.ceil(totalCount / (double)pageSize);
		beginPage = (currentPage -1) / navSize * navSize + 1;
		endPage = Math.min(beginPage + navSize - 1, totalPage);
		showPrev = beginPage != 1;
		showNext = endPage != totalPage;
	}
	
	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getNavSize() {
		return navSize;
	}

	public void setNavSize(int navSize) {
		this.navSize = navSize;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isShowPrev() {
		return showPrev;
	}

	public void setShowPrev(boolean showPrev) {
		this.showPrev = showPrev;
	}

	public boolean isShowNext() {
		return showNext;
	}

	public void setShowNext(boolean showNext) {
		this.showNext = showNext;
	}

	@Override
	public String toString() {
		return "PagingDTO [totalCount=" + totalCount + 
				", pageSize=" + pageSize + 
				", navSize=" + navSize + 
				", totalPage=" + totalPage + 
				", currentPage=" + currentPage + 
				", beginPage=" + beginPage + 
				", endPage=" + endPage + 
				", showPrev=" + showPrev + 
				", showNext=" + showNext + "]";
	}
}