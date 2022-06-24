package com.nngame.support.dao;

import java.sql.Date;

public class SupportDTO {
	private int support_num;		// primary key
	private String support_type;	// 환불, 기타..
	private String support_title;	// 문의 제목
	private String support_content;	// 문의 내용
	private Date support_date;		// 문의 등록 날짜
	private String support_result;	// 완료, 진행중...
	private int user_num;			// 누가 문의를 했는지 가져오기 위해
	private String support_writer;
	
	public int getSupport_num() {
		return support_num;
	}
	public void setSupport_num(int support_num) {
		this.support_num = support_num;
	}
	public String getSupport_type() {
		return support_type;
	}
	public void setSupport_type(String support_type) {
		this.support_type = support_type;
	}
	public String getSupport_title() {
		return support_title;
	}
	public void setSupport_title(String support_title) {
		this.support_title = support_title;
	}
	public String getSupport_content() {
		return support_content;
	}
	public void setSupport_content(String support_content) {
		this.support_content = support_content;
	}
	public Date getSupport_date() {
		return support_date;
	}
	public void setSupport_date(Date support_date) {
		this.support_date = support_date;
	}
	public String getSupport_result() {
		return support_result;
	}
	public void setSupport_result(String support_result) {
		this.support_result = support_result;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public String getSupport_writer() {
		return support_writer;
	}
	public void setSupport_writer(String support_writer) {
		this.support_writer = support_writer;
	}
}
