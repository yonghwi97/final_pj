package com.project.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.project.board.model.HallVO;
import com.project.board.model.VoteVO;
import com.project.board.service.ActorService;
import com.project.board.service.HallService;
import com.project.board.service.MediaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.PathVariable;

import com.project.board.model.ActorCastVO;
import com.project.board.model.MusicalVO;
import com.project.board.service.MusicalService;


@Controller
public class ActorController {
	@Autowired
	private ActorService service;

	/** 배우 등록 페이지로 이동*/
	@RequestMapping("/goInsertActor") 
    public String goInsertActor() { 
    	return "/DetailView/insertActor"; 
    }
	
	/** 배우 등록 중복 체크
	 * @throws Exception */
	@ResponseBody
	@RequestMapping(value = "/duplicateActorCheck")
	public String idCheck(@RequestParam String actorNo) throws Exception {
		
		if(actorNo == "") {
			System.out.println("null");
			throw new Exception();
		}
		
		System.out.println(actorNo);
		
		String result = "no_use";

		int actorNo_result = service.actorNoCheck(actorNo);
		
		if(actorNo_result == 1) {

			result = "use";
		}
		return result;
	}
	
	
	/** 배우 등록 페이지에서 INSERT 버튼을 수행했을 시. */
	@RequestMapping("/doInsertActor")
	public String doInsertActor(VoteVO VoteVO, HttpSession session) {
		String result = "redirect:/goInsertActor";
		
		if (VoteVO == null) {
			return result;
		}
		 
		System.out.println(VoteVO);
		
		int insertFlag = service.insertActor(VoteVO);
		
		System.out.println(insertFlag);
		
		if( insertFlag == 1 )  {
			
			result = "redirect:/adminPage";
		}
		return result;
	}
	
	
	// Admin 페이지에서 삭제 버튼을 수행 했을 시
	@RequestMapping("/doDeleteActor/{actorNo}")
	public String doDeleteActor(@PathVariable String actorNo) {
		String result = "redirect:/adminPage";

		System.out.println(actorNo);
		
		int deleteFlag = service.deleteActor(actorNo);
		
		System.out.println(deleteFlag);
		
		if( deleteFlag != 1 )  {
			System.out.println("삭제실패");
		}
		
		
		return result;
	}
	
	/*
	 * 
	 *  
	 * 1) 컨트롤러
	 * 2) 서비스 추가 - 인터페이스, 클래스 
	 * 3) DAO 
	 * 4) 맵퍼
	 * 5) VO
	 * 
	 */
}
