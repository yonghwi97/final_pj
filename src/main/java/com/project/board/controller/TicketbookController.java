package com.project.board.controller;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.board.model.HallVO;

import com.project.board.model.MusicalByGenreVO;
import com.project.board.model.MusicalVO;


import com.project.board.model.TicketbookVO;

import com.project.board.service.TicketbookService;

@Controller
public class TicketbookController {

    @Autowired
    private TicketbookService service;


    @RequestMapping("/favorRecommand/{memId}")
    public String favorRecommand(@PathVariable String memId, HttpSession session) {
        System.out.println(memId);

        String result = "";

        ArrayList<MusicalByGenreVO> vo = service.getMusicalByGenre(memId);


        System.out.println(vo);

        if (vo != null) {
            session.setAttribute("mByg", vo);

            result = "/layout/recommand";
        }

        return result;
    }

    @RequestMapping("/ticketbook/{memId}")
    public String detailView(@PathVariable String memId, HttpSession session) {
        System.out.println(memId);

        String result = "";

        ArrayList<MusicalByGenreVO> vo = service.getMusicalByGenre(memId);


        System.out.println(vo);

        if (vo != null) {
            session.setAttribute("mByg", vo);

            result = "/ticketbook/ticketbook";
        }

        return result;
    }


    
    
    @RequestMapping("/ticketbook")
    public String ticketbook() {

        return "ticketbook/ticketbook";
    }


    @RequestMapping("/ticketDetailView") // 전체 리스트
    public String ticketDetailView(Model model, HttpSession session) {
    	
    	String memId = (String)session.getAttribute("sid1");
    	
        ArrayList<TicketbookVO> ticketList = service.listTicketByID(memId);
        model.addAttribute("ticketList", ticketList); // 2


        return "ticketbook/ticketDetailView";
    }
    
    @RequestMapping("/ticketbook/ticketDetailView/{no}")
	public String detailViewticket(@PathVariable("no") String no, Model model ) {
		
    	TicketbookVO ticketbook = service.detailViewticket(no);
		model.addAttribute("ticketbook", ticketbook);
	
		
		return "ticketbook/ticketDetailView";
	}
   
    
    
    

    @RequestMapping("/ticketbook/ticketInsertForm")
    public String insertform() {


        return "ticketbook/ticketInsertForm";
    }


    @RequestMapping("/ticketbook/insertticket") //추가 페이지
    public String insertticket(TicketbookVO ticketbookVo) {
        service.insertticket(ticketbookVo);
        return "redirect:../ticketDetailView";
    }
    
    @RequestMapping("/ticketbook/updateticketform/{no}") // 수정할페이지 번호
	public String updateform( @PathVariable("no") String no, Model model) {
		TicketbookVO ticketbook = service.listTicketByNO(no);
		model.addAttribute("ticketbook", ticketbook);
		
		return "ticketbook/ticketUpdateForm";
	}
    @RequestMapping("/ticketbook/updateticket") //수정 페이지
    public String updateticket(TicketbookVO ticketbookVo) {
        service.updateticket(ticketbookVo);
        
        return "redirect:../ticketDetailView";
    }
    
    @RequestMapping("/ticketbook/deleteticketform/{no}") // 삭제할 페이지 번호
	public String deleteform( @PathVariable("no") String no, Model model) {
    	service.deleteticket(no );
		return "redirect:../../ticketDetailView"; //DB저장 컨트롤러
	}
	
}