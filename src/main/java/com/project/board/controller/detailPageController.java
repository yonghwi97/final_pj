package com.project.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.project.board.model.HallVO;
import com.project.board.model.VoteVO;
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
public class detailPageController {
	@Autowired
	private MusicalService service;

	@Autowired
	HallService hallService;

	@Autowired
	MediaService mediaService;
	
	/*
	 * @RequestMapping("/favorRecommand") public String favorRecommand() { return
	 * "/layout/recommand"; }
	 */

	// 뮤지컬 등록페이지로 이동
	@RequestMapping("/insertMusc") 
    public String insertMusc() { 
    	return "/DetailView/insertMusical"; 
    }
	
	// 뮤지컬 전체 목록 페이지로 이동
		@RequestMapping("/musicalAllgenre")
		public String musicalAllgenre(HttpSession session) {
			
			String result = "";
			
			ArrayList<MusicalVO> vo = service.getMusicalAllList();
			System.out.println(vo);
			if(vo != null) {
				session.setAttribute("musicalData", vo);
				result = "/DetailView/muscAllList";
			}
			return result;
		}
	
	// 뮤지컬 장르별 목록 페이지로 이동
	@RequestMapping("/musicalAllgenre/{genreNo}")
	public String muscGenreView(@PathVariable String genreNo, HttpSession session) {
		System.out.println(genreNo);
		
		String result = "";
		
		ArrayList<MusicalVO> vo = service.getMusicalListByGenre(genreNo);
		
		
		System.out.println(vo);

		
		if(vo != null) {
			session.setAttribute("musicalData", vo);
			
			result = "/DetailView/muscGenreView";
		}
		
		return result;
	}
	
	// 뮤지컬 상세정보 페이지 이동.
	@RequestMapping("/muscDetailView/{muscNo}")
	public String muscDetailView(@PathVariable String muscNo, HttpSession session) {
		System.out.println(muscNo);
		
		String result = "";
		
		MusicalVO vo = service.getMusical(muscNo);
		ArrayList<ActorCastVO> vo2 = service.getActorCast(muscNo);
		
		//System.out.println(vo2.toString());
		
		if(vo != null && vo2 != null) {
			session.setAttribute("musicalData", vo);
			session.setAttribute("actorcastData", vo2);
			
			result = "/DetailView/muscDetailView";
		}
		
		
		return result;
	}
	
	/**뮤지컬 등록 중복 체크
	 * @throws Exception */
	@ResponseBody
	@RequestMapping(value = "/duplicateCheck")
	public String idCheck(@RequestParam String muscNo) throws Exception {
		
		if(muscNo == "") {
			System.out.println("null");
			throw new Exception();
		}
		
		System.out.println(muscNo);
		
		String result = "no_use";

		int muscNo_result = service.muscNoCheck(muscNo);
		
		if(muscNo_result == 1) {

			result = "use";
		}
		return result;
	}
	
	
	// 뮤지컬 등록 페이지에서 INSERT 버튼을 수행했을 시.
	@RequestMapping("/doInsertMusc")
	public String doInsertMusc(MusicalVO MusicalVO, HttpSession session) {
		String result = "redirect:/insertMusc";
		
		if (MusicalVO == null) {
			return result;
		}
		 
		System.out.println(MusicalVO);
		
		
		
		int insertFlag = service.insertMusical(MusicalVO);
		
		System.out.println(insertFlag);
		
		if( insertFlag == 1 )  {
			
			result = "redirect:/adminMusical";
		}
		
		
		return result;
	}
	
	
	// Admin 페이지에서 삭제버튼을 수행 했을 시
	@RequestMapping("/doDeleteMusc/{muscNo}")
	public String doDeleteMusc(@PathVariable String muscNo) {
		String result = "redirect:/adminPage";

		System.out.println(muscNo);
		
		int deleteFlag = service.deleteMusical(muscNo);
		
		System.out.println(deleteFlag);
		
		if( deleteFlag != 1 )  {
			System.out.println("삭제실패");
		}
		
		
		return result;
	}
	
	// 업데이트 페이지로 이동
	@RequestMapping("/goUpdateMusc/{muscNo}") 
    public String goUpdateMusc(@PathVariable String muscNo, HttpSession session) { 
		String result = "redirect:/adminPage";
		
		MusicalVO vo = service.getMusical(muscNo);
		
		if(vo != null) {
			session.setAttribute("muscData", vo);
			result = "/DetailView/updateMusical";
			System.out.println(result);
		}
		
		
    	return result; 
    }
	
	// 뮤지컬 등록 페이지에서 UPDATE 버튼을 수행했을 시.
		@RequestMapping("/doUpdateMusc/{muscNo}")
		public String doUpdateMusc(MusicalVO MusicalVO, HttpSession session) {
			String result = "redirect:/goUpdateMusc/{muscNo}";
			
			if (MusicalVO == null) {
				
				System.out.println("얍");
				return result;
				
			}
			 
			System.out.println(MusicalVO);
			
			/* MusicalVO vo = service.getMusical(muscNo); */
			int updateFlag = service.updateMusical(MusicalVO);
			
			System.out.println(updateFlag);
			
			if( updateFlag == 1 )  {
				
				result = "redirect:/adminPage";
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
