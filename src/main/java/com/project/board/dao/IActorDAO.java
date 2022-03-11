package com.project.board.dao;

import java.lang.reflect.Array;
import java.util.ArrayList;

import com.project.board.model.ActorCastVO;
import com.project.board.model.MusicalVO;
import com.project.board.model.VoteVO;

public interface IActorDAO {

	public int deleteActor(String actorNo);

	public int actorNoCheck(String actorNo);

	public int insertActor(VoteVO voteVO);

	
}
