package com.project.board.service;



import com.project.board.model.MediaVO;
import com.project.board.model.VoteVO;


import java.util.ArrayList;

import com.project.board.model.MediaVO;

public interface IMediaService {
    ArrayList<MediaVO> listAllMedia();

    /* 뮤지컬 배우 투표 */
    ArrayList<VoteVO> listAllActor();

    VoteVO detailActor(String actorNo);

    public int voteUp(String actorNo);
    
    public int voteCount(String memId);
    
    public int voteCountB(String memId);
}
