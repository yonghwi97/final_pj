package com.project.board.model;

public class MusicalVO {
	//memberData
	private String muscNo;
	private String muscName;
	private String muscHashtag;
	private String muscPlace;
	private String muscPlaceLink;
	private String muscStartDate;
	private String muscEndDate;
	private String muscQuote;
	private Integer muscReqTime;
	private String muscSynop;
	private String muscGenre;
	private String muscImg;
	private String muscInfo_1;
	private String muscInfo_2;
	private String muscInfo_3;
	private String muscYoutube;
	private Integer musicalVote;
	private String location;

	public MusicalVO(String muscNo, String muscName, String muscHashtag, String muscPlace, String muscPlaceLink,
			String muscStartDate, String muscEndDate, String muscQuote, Integer muscReqTime, String muscSynop,
			String muscGenre, String muscImg, String muscInfo_1, String muscInfo_2, String muscInfo_3,
			String muscYoutube, Integer musicalVote, String location, String genreNo, String genreName) {
		super();
		this.muscNo = muscNo;
		this.muscName = muscName;
		this.muscHashtag = muscHashtag;
		this.muscPlace = muscPlace;
		this.muscPlaceLink = muscPlaceLink;
		this.muscStartDate = muscStartDate;
		this.muscEndDate = muscEndDate;
		this.muscQuote = muscQuote;
		this.muscReqTime = muscReqTime;
		this.muscSynop = muscSynop;
		this.muscGenre = muscGenre;
		this.muscImg = muscImg;
		this.muscInfo_1 = muscInfo_1;
		this.muscInfo_2 = muscInfo_2;
		this.muscInfo_3 = muscInfo_3;
		this.muscYoutube = muscYoutube;
		this.musicalVote = musicalVote;
		this.location = location;
		this.genreNo = genreNo;
		this.genreName = genreName;
	}

	public Integer getMusicalVote() {
		return musicalVote;
	}

	public void setMusicalVote(Integer musicalVote) {
		this.musicalVote = musicalVote;
	}

	private String genreNo;
	private String genreName;
	
	//constructor
	public MusicalVO(){}

	public MusicalVO(String muscNo, String muscName, String muscHashtag, String muscPlace, String muscPlaceLink,
			String muscStartDate, String muscEndDate, String muscQuote, Integer muscReqTime, String muscSynop,
			String muscGenre, String muscImg, String muscInfo_1, String muscInfo_2, String muscInfo_3,
			String muscYoutube, String genreNo, String genreName) {
		super();
		this.muscNo = muscNo;
		this.muscName = muscName;
		this.muscHashtag = muscHashtag;
		this.muscPlace = muscPlace;
		this.muscPlaceLink = muscPlaceLink;
		this.muscStartDate = muscStartDate;
		this.muscEndDate = muscEndDate;
		this.muscQuote = muscQuote;
		this.muscReqTime = muscReqTime;
		this.muscSynop = muscSynop;
		this.muscGenre = muscGenre;
		this.muscImg = muscImg;
		this.muscInfo_1 = muscInfo_1;
		this.muscInfo_2 = muscInfo_2;
		this.muscInfo_3 = muscInfo_3;
		this.muscYoutube = muscYoutube;
		this.genreNo = genreNo;
		this.genreName = genreName;
	}

	
	
	
	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public MusicalVO(String muscNo, String muscName, String muscHashtag, String muscPlace, String muscPlaceLink,
			String muscStartDate, String muscEndDate, String muscQuote, Integer muscReqTime, String muscSynop,
			String muscGenre, String muscImg, String muscInfo_1, String muscInfo_2, String muscInfo_3,
			String muscYoutube) {
		super();
		this.muscNo = muscNo;
		this.muscName = muscName;
		this.muscHashtag = muscHashtag;
		this.muscPlace = muscPlace;
		this.muscPlaceLink = muscPlaceLink;
		this.muscStartDate = muscStartDate;
		this.muscEndDate = muscEndDate;
		this.muscQuote = muscQuote;
		this.muscReqTime = muscReqTime;
		this.muscSynop = muscSynop;
		this.muscGenre = muscGenre;
		this.muscImg = muscImg;
		this.muscInfo_1 = muscInfo_1;
		this.muscInfo_2 = muscInfo_2;
		this.muscInfo_3 = muscInfo_3;
		this.muscYoutube = muscYoutube;
	}

	public String getMuscNo() {
		return muscNo;
	}

	public String getMuscName() {
		return muscName;
	}

	public String getMuscHashtag() {
		return muscHashtag;
	}

	public String getMuscPlace() {
		return muscPlace;
	}

	public String getMuscPlaceLink() {
		return muscPlaceLink;
	}

	public String getMuscStartDate() {
		return muscStartDate;
	}

	public String getMuscEndDate() {
		return muscEndDate;
	}

	public String getMuscQuote() {
		return muscQuote;
	}

	public Integer getMuscReqTime() {
		return muscReqTime;
	}

	public String getMuscSynop() {
		return muscSynop;
	}

	public String getMuscGenre() {
		return muscGenre;
	}

	public String getMuscImg() {
		return muscImg;
	}

	public String getMuscInfo_1() {
		return muscInfo_1;
	}

	public String getMuscInfo_2() {
		return muscInfo_2;
	}

	public String getMuscInfo_3() {
		return muscInfo_3;
	}

	public String getMuscYoutube() {
		return muscYoutube;
	}

	public String getGenreNo() {
		return genreNo;
	}

	public String getGenreName() {
		return genreName;
	}

	public void setMuscNo(String muscNo) {
		this.muscNo = muscNo;
	}

	public void setMuscName(String muscName) {
		this.muscName = muscName;
	}

	public void setMuscHashtag(String muscHashtag) {
		this.muscHashtag = muscHashtag;
	}

	public void setMuscPlace(String muscPlace) {
		this.muscPlace = muscPlace;
	}

	public void setMuscPlaceLink(String muscPlaceLink) {
		this.muscPlaceLink = muscPlaceLink;
	}

	public void setMuscStartDate(String muscStartDate) {
		this.muscStartDate = muscStartDate;
	}

	public void setMuscEndDate(String muscEndDate) {
		this.muscEndDate = muscEndDate;
	}

	public void setMuscQuote(String muscQuote) {
		this.muscQuote = muscQuote;
	}

	public void setMuscReqTime(Integer muscReqTime) {
		this.muscReqTime = muscReqTime;
	}

	public void setMuscSynop(String muscSynop) {
		this.muscSynop = muscSynop;
	}

	public void setMuscGenre(String muscGenre) {
		this.muscGenre = muscGenre;
	}

	public void setMuscImg(String muscImg) {
		this.muscImg = muscImg;
	}

	public void setMuscInfo_1(String muscInfo_1) {
		this.muscInfo_1 = muscInfo_1;
	}

	public void setMuscInfo_2(String muscInfo_2) {
		this.muscInfo_2 = muscInfo_2;
	}

	public void setMuscInfo_3(String muscInfo_3) {
		this.muscInfo_3 = muscInfo_3;
	}

	public void setMuscYoutube(String muscYoutube) {
		this.muscYoutube = muscYoutube;
	}

	public void setGenreNo(String genreNo) {
		this.genreNo = genreNo;
	}

	public void setGenreName(String genreName) {
		this.genreName = genreName;
	}

	@Override
	public String toString() {
		return "MusicalVO [muscNo=" + muscNo + ", muscName=" + muscName + ", muscHashtag=" + muscHashtag
				+ ", muscPlace=" + muscPlace + ", muscPlaceLink=" + muscPlaceLink + ", muscStartDate=" + muscStartDate
				+ ", muscEndDate=" + muscEndDate + ", muscQuote=" + muscQuote + ", muscReqTime=" + muscReqTime
				+ ", muscSynop=" + muscSynop + ", muscGenre=" + muscGenre + ", muscImg=" + muscImg + ", muscInfo_1="
				+ muscInfo_1 + ", muscInfo_2=" + muscInfo_2 + ", muscInfo_3=" + muscInfo_3 + ", muscYoutube="
				+ muscYoutube + ", genreNo=" + genreNo + ", genreName=" + genreName + "]";
	}
	
	
	
}