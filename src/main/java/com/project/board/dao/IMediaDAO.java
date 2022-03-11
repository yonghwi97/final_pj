package com.project.board.dao;

import com.project.board.model.MediaVO;
import com.project.board.model.VoteVO;

import java.util.ArrayList;

public interface IMediaDAO {
    /* 뮤지컬 넘버 나오는 곳 */
    ArrayList<MediaVO> listAllMedia();

    /* 뮤지컬 배우 리스트 */
    ArrayList<VoteVO> listAllActor();

    VoteVO detailActor(String actorNo);

    public int voteUp(String actorNo);

    public int voteCount(String memId);
    
    public int voteCountB(String memId);
}