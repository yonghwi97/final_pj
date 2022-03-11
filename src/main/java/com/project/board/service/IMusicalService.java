package com.project.board.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.project.board.model.ActorCastVO;
import com.project.board.model.MusicalVO;

@Service
public interface IMusicalService {
	/**뮤지컬 상세 데이터 조회*/
	public MusicalVO getMusical(String muscNo);
	
	public ArrayList<ActorCastVO> getActorCast(String muscNo);
	
	public ArrayList<MusicalVO> getMusicalListByGenre(String genreNo);
	
	ArrayList<MusicalVO> getAllMusical();
	
	public int voteUp(String muscNo);
	
	public ArrayList<MusicalVO> getMusicalAllList();
	
	public int deleteMusical(String muscNo);
	
	public int muscNoCheck(String muscNo);
	
	public int updateMusical(MusicalVO musicalVO);
	
}
