package com.project.board.dao;

import java.lang.reflect.Array;
import java.util.ArrayList;

import com.project.board.model.ActorCastVO;
import com.project.board.model.MusicalVO;

public interface IMusicalDAO {
	public MusicalVO getMusical(String muscNo);

	public ArrayList<ActorCastVO> getActorCast(String muscNo);

	public ArrayList<MusicalVO> getMusicalListByGenre(String genreNo);

	ArrayList<MusicalVO> getAllMusical();

	public int voteUp(String muscNo);

	public int insertMusical(MusicalVO musicalVO);

	public ArrayList<MusicalVO> getMusicalAllList();

	public int deleteMusical(String muscNo);

	public int muscNoCheck(String muscNo);

	public int updateMusical(MusicalVO musicalVO);

	
}
