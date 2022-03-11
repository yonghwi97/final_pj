package com.project.board.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.project.board.dao.IMusicalDAO;
import com.project.board.model.ActorCastVO;
import com.project.board.model.MusicalVO;

@Service
public class MusicalService implements IMusicalService{
	
    @Autowired
    @Qualifier("IMusicalDAO")
    IMusicalDAO dao;
	
    
    @Override
    /**뮤지컬 상세 데이터 조회*/
    public MusicalVO getMusical(String muscNo){
        return dao.getMusical(muscNo);
    }

    @Override
	public ArrayList<ActorCastVO> getActorCast(String muscNo) {
		return dao.getActorCast(muscNo);
	}
    
    @Override
	public ArrayList<MusicalVO> getMusicalListByGenre(String genreNo) {
		return dao.getMusicalListByGenre(genreNo);
	}

    @Override
    public ArrayList<MusicalVO> getAllMusical() {
        return dao.getAllMusical();
    }

    @Override
    public int voteUp(String muscNo) {
        return dao.voteUp(muscNo);
    }


	public int insertMusical(MusicalVO musicalVO) {
		return dao.insertMusical(musicalVO);
	}

	public ArrayList<MusicalVO> getMusicalAllList() {
		return dao.getMusicalAllList();
	}

	public int deleteMusical(String muscNo) {
		return dao.deleteMusical(muscNo);
	}

	public int muscNoCheck(String muscNo) {
		return dao.muscNoCheck(muscNo);
	}

	public int updateMusical(MusicalVO musicalVO) {
		return dao.updateMusical(musicalVO);
	}
    

}