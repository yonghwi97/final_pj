package com.project.board.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.project.board.model.MemberVO;

@Service
public interface IMemberService {
	MemberVO login(HashMap<String, Object> map);
	String memIdCheck(String memId);
	void signUp(MemberVO vo);
	ArrayList<MemberVO> getAllMember();
	MemberVO getMember(String sid);
}
