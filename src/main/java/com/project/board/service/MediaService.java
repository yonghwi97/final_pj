package com.project.board.service;


import java.util.ArrayList;


import com.project.board.dao.IMediaDAO;
import com.project.board.model.MediaVO;
import com.project.board.model.VoteVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.project.board.dao.IMediaDAO;
import com.project.board.model.MediaVO;

@Service
public class MediaService implements IMediaService{
    @Autowired
    @Qualifier("IMediaDAO")
    IMediaDAO dao;

    @Override
    public ArrayList<MediaVO> listAllMedia() {
        return dao.listAllMedia();
    }

    @Override
    public ArrayList<VoteVO> listAllActor() {
        return dao.listAllActor();
    }

    @Override
    public VoteVO detailActor(String actorNo) {
        return dao.detailActor(actorNo);
    }

    @Override
    public int voteUp(String actorNo) {
        return dao.voteUp(actorNo);
    }
    
    @Override
    public int voteCount(String memId) {
        return dao.voteCount(memId);
    }
    
    @Override
    public int voteCountB(String memId) {
        return dao.voteCountB(memId);
    }


}
