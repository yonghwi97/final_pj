package com.project.board.model;

public class VoteVO {
    private String actorNo;
    private String actorName;
    private String actorProfile;
    private int actorVote;


	public void setActorVote(int actorVote) {
		this.actorVote = actorVote;
	}

	public String getActorNo() {
        return actorNo;
    }

    public void setActorNo(String actorNo) {
        this.actorNo = actorNo;
    }

    public String getActorName() {
        return actorName;
    }

    public void setActorName(String actorName) {
        this.actorName = actorName;
    }

    public String getActorProfile() {
        return actorProfile;
    }

    public void setActorProfile(String actorProfile) {
        this.actorProfile = actorProfile;
    }

    public Integer getActorVote() {
        return actorVote;
    }

    public void setActorVote(Integer actorVote) {
        this.actorVote = actorVote;
    }

    @Override
    public String toString() {
        return "VoteVO{" +
                "actorNo=" + actorNo +
                ", actorName='" + actorName + '\'' +
                ", actorProfile='" + actorProfile + '\'' +
                ", actorVote=" + actorVote +
                '}';
    }
}
