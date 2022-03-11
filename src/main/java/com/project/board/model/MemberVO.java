package com.project.board.model;

public class MemberVO {
	private String memId;
	private String memPw;
	private String memName;
	private String memEmail;
	private String memPhone;
	private String memAddress;
	private String memAddressDetail;
	private String genre;
	private int voteA;
	private int voteB;
	
	public int getVoteB() {
		return voteB;
	}
	public void setVoteB(int voteB) {
		this.voteB = voteB;
	}
	public int getVoteA() {
		return voteA;
	}
	public void setVoteA(int voteA) {
		this.voteA = voteA;
	}
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPw() {
		return memPw;
	}
	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemEmail() {
		return memEmail;	
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getMemPhone() {
		return memPhone;
	}
	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}
	public String getMemAddress() {
		return memAddress;
	}
	public void setMemAddress(String memAddress) {
		this.memAddress = memAddress;
	}
	public String getMemAddressDetail() {
		return memAddressDetail;
	}
	public void setMemAddressDetail(String memAddressDetail) {
		this.memAddressDetail = memAddressDetail;
	}
	public String getgenre() {
		return genre;
	}
	public void setgenre(String genre) {
		this.genre = genre;
	}
	
	@Override
	public String toString() {
		return "MemberVO [memId=" + memId + ", memPw=" + memPw + ", memName=" + memName + ", memEmail=" + memEmail
				+ ", memPhone=" + memPhone + ", memAddress=" + memAddress + ", memAddressDetail=" + memAddressDetail + ", genre=" + genre + "]";
	}
	
	
}
