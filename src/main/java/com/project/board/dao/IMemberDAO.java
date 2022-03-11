package com.project.board.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.project.board.model.MemberVO;



public interface IMemberDAO {
	MemberVO login(HashMap<String, Object> map);
	String memIdCheck(String memId);
	void signUp(MemberVO vo);
	ArrayList<MemberVO> getAllMember();
	MemberVO getMember(String sid);
}
