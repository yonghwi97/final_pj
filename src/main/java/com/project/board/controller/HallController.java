	package com.project.board.controller;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.RequestMapping;

import com.project.board.model.HallVO;
import com.project.board.service.HallService;

@Controller
public class HallController {
	@Autowired
	HallService service;
	
	@RequestMapping("/hall")
	public String hall(Model model) {

		ArrayList<HallVO> seoulHallList = service.listHallByArea("seoul"); // 1
		ArrayList<HallVO> ggHallList = service.listHallByArea("gg");
		ArrayList<HallVO> etcHallList = service.listHallByArea("etc");
		
		model.addAttribute("seoulHallList", seoulHallList); // 2
		model.addAttribute("ggHallList", ggHallList);
		model.addAttribute("etcHallList", etcHallList);
		
		ArrayList<HallVO> hallList = service.listAllHall(); //
		model.addAttribute("hallList", hallList); //
		return "hall/hall"; //
	}
	@RequestMapping("/hall/detailView/{no}")
	public String detailViewhall(@PathVariable("no") String no, Model model ) {
		
		HallVO hall = service.detailViewhall(no);
		model.addAttribute("hall", hall);
	
		
		return "hall/hallDetailView";
	}
	
	@RequestMapping("/hall/insertform")
	public String insertform( ) {
		
		
		return "hall/hallInsertForm";
	}

	// 데이터 추가하면 홀 메인페이지로 가게 해둠 -> 관리자 페이지의 홈으로 가게
	@RequestMapping("/hall/inserthall") //추가 페이지
	public String inserthall(HallVO hallVo ) {
		service.inserthall(hallVo );
		return "redirect:./hall";
	}
	
	@RequestMapping("/hall/updateform/{no}") // 수정할페이지 번호
	public String updateform( @PathVariable("no") String no, Model model) {
		HallVO hall = service.detailViewhall(no);
		model.addAttribute("hall", hall);
		
		return "hall/hallUpdateForm";
	}
	@RequestMapping("/hall/updatehall") // 수정된 페이지
	public String updatehall(HallVO hallVo ) {
		service.updatehall(hallVo );
		return "hall/hallUpdateForm"; //DB저장 컨트롤러
	}
	
	@RequestMapping("/hall/deleteform/{no}") // 삭제할 페이지 번호
	public String deleteform( @PathVariable("no") String no, Model model) {
		HallVO hall = service.detailViewhall(no);
		model.addAttribute("hall", hall);
		
		return "hall/hallDeleteForm";
	}
	@RequestMapping("/hall/deletehall") // 삭제페이지
	public String deletehall(HallVO hallVo ) {
		service.deletehall(hallVo );
		return "hall/hallDeleteForm"; //DB저장 컨트롤러
	}
	
	
	/* 
	 * 홀(/hall/detailView/{no})로 접속했을 때,
	 * 데이터베이스에서 {hallNo}에 해당하는 정보 가져와서
	 * 뷰 페이지에 출력하기
	 * 
	 * 0) VO - HallVO (이미 했음)
	 * 1) 컨트롤러 
	 * 2) 서비스 - 2개 HallService (Class) , IHallService (Interface)
	 * 3) DAO	- 1개 HallDAO
	 * 4) Mapper - HallMapper
	 * --------------------------
	 * 
	 * 5) 뷰 페이 수정 
	 * 
	 * 
	 * hall - CRUD ( Create , Read, Update, Delete )
	 * 
	 * 
	 * hall - create
	 * 
	 * 0) jsp page - view  (hallInsertForm.jsp) //
	 * 1) controller - 		(/hall/insertForm)
	 * 2) 서비스 - 2개 HallService (Class) , IHallService (Interface)
	 * 3) DAO	- 1개 HallDAO
	 * 4) Mapper - HallMapper
	 */
	
	

	/* 
	 * 홀(/hall)로 접속했을 때,
	 * 데이터베이스에서 전체 홀 목록 가져와서
	 * 뷰 페이지에 출력하기
	 * 
	 * 0) VO - HallVO
	 * 1) 컨트롤러
	 * 2) 서비스 - 2개 HallService (Class) , IHallService (Interface)
	 * 3) DAO	- 1개 HallDAO
	 * 4) Mapper - HallMapper
	 * 5) 뷰 페이 수정 
	 */
}
