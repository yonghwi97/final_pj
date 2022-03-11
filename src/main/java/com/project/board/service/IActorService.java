package com.project.board.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.project.board.model.ActorCastVO;
import com.project.board.model.MusicalVO;
import com.project.board.model.VoteVO;

@Service
public interface IActorService {
	
	public int deleteActor(String actorNo);
	
	public int actorNoCheck(String actorNo);

	int insertActor(VoteVO voteVO);
	
}
