package com.sw.vo;

import java.util.Date;

public class BoardVO {

	private int BoardNum;
	private String BoardTitle;
	private String BoardText;
	private String BoardWriter;
	private Date BoardRegDate;
	
	public int getBoardNum() {
		return BoardNum;
	}
	public void setBoardNum(int boardNum) {
		BoardNum = boardNum;
	}
	public String getBoardTitle() {
		return BoardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		BoardTitle = boardTitle;
	}
	public String getBoardText() {
		return BoardText;
	}
	public void setBoardText(String boardText) {
		BoardText = boardText;
	}
	public String getBoardWriter() {
		return BoardWriter;
	}
	public void setBoardWriter(String boardWriter) {
		BoardWriter = boardWriter;
	}
	public Date getBoardRegDate() {
		return BoardRegDate;
	}
	public void setBoardRegDate(Date boardRegDate) {
		BoardRegDate = boardRegDate;
	}
	
	
	
}
