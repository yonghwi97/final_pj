package com.project.board.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.project.board.dao.IActorDAO;
import com.project.board.model.ActorCastVO;
import com.project.board.model.VoteVO;

@Service
public class ActorService implements IActorService{
	
    @Autowired
    @Qualifier("IActorDAO")
    IActorDAO dao;
    
    @Override
	public int insertActor(VoteVO voteVO) {
		return dao.insertActor(voteVO);
	}
    
    @Override
	public int deleteActor(String actorNo) {
		return dao.deleteActor(actorNo);
	}

    @Override
	public int actorNoCheck(String actorNo) {
		return dao.actorNoCheck(actorNo);
	}
	
}