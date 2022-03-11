package com.project.board.model;

public class ActorCastVO {
	private String actorName;
	private String actorProfile;
	private String roleName;
	
	public ActorCastVO() {}
	
	public ActorCastVO(String actorName, String actorProfile, String roleName) {
		super();
		this.actorName = actorName;
		this.actorProfile = actorProfile;
		this.roleName = roleName;
	}
	
	
	

	public String getActorName() {
		return actorName;
	}

	public String getActorProfile() {
		return actorProfile;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setActorName(String actorName) {
		this.actorName = actorName;
	}

	public void setActorProfile(String actorProfile) {
		this.actorProfile = actorProfile;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	@Override
	public String toString() {
		return "ActorCastVO [actorName=" + actorName + ", actorProfile=" + actorProfile + ", roleName=" + roleName
				+ "]";
	}
	
}
