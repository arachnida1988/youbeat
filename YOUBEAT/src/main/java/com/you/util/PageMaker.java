package com.you.util;

public class PageMaker {
	
	private int startRowNum;
	private int lastRowNum;
	private int curBlock;
	private int totalBlock;
	private int startNum;
	private int lastNum;
	private int curPage;
	private int perPage;
	
	// ROWNUM
	public void makeRow() {
		this.startRowNum = (this.curPage-1)*this.perPage + 1;
		this.lastRowNum = this.curPage*this.perPage;
	}
	
	// PAGEING
	public void makePage(int totalCount) {
		// 1. 전체 게시물 수 - 매개변수
		// 2. 전체 Page수
		int totalPage = 0;
		if(totalCount % perPage == 0) {
			totalPage = totalCount / perPage;
		} else {
			totalPage = totalCount / perPage + 1;
		}
		
		// 3. 전체 Block수
		int perBlock = 5;
		this.totalBlock = 0;
		if(totalPage % perBlock == 0) {
			this.totalBlock = totalPage / perBlock;
		} else {
			this.totalBlock = totalPage / perBlock + 1;
		}
		
		this.curBlock = 0;
		// 4. curBlock 구하기
		if(this.curPage % perBlock == 0) {
			this.curBlock = this.curPage / perBlock;
		} else {
			this.curBlock = this.curPage / perBlock + 1;
		}
		
		// 5. startNum, lastNum 구하기
		this.startNum = (this.curBlock-1)*perBlock + 1;
		this.lastNum = this.curBlock*perBlock;
		
		if(this.curBlock == this.totalBlock) {
			this.lastNum = totalPage;
		}
	}
	
	public int getStartRowNum() {
		return startRowNum;
	}
	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}
	public int getLastRowNum() {
		return lastRowNum;
	}
	public void setLastRowNum(int lastRowNum) {
		this.lastRowNum = lastRowNum;
	}
	public int getCurBlock() {
		return curBlock;
	}
	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}
	public int getTotalBlock() {
		return totalBlock;
	}
	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getLastNum() {
		return lastNum;
	}
	public void setLastNum(int lastNum) {
		this.lastNum = lastNum;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

}
