package com.project.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.board.dao.Board;
import com.project.board.dao.Reply;
import com.project.board.service.BoardService;

@Controller
public class BoardController {
	 @Autowired
	    private BoardService s;
	    
	    @RequestMapping(value="/board", method=RequestMethod.GET)
	    public String board() {
	        return "board/board";
	    }
		
	    @RequestMapping(value="/boardList", method=RequestMethod.GET)
	    @ResponseBody
	    public List<Board> boardList(){
	        return s.getBoard();
	    }
	    
	    @RequestMapping(value="/write", method=RequestMethod.GET)
	    public String write() {
	        return "board/write";
	    }
		
	    @RequestMapping(value="/writeAction", method=RequestMethod.POST)
	    public String writeAction(
	            HttpServletRequest req,@RequestParam("file") MultipartFile file,
	            @RequestParam("title")String title, 
	            @RequestParam("contents")String contents, String hits,Date writedate) throws IllegalStateException, IOException {
	        String PATH = req.getSession().getServletContext().getRealPath("/") + "resources/";
	        if (!file.getOriginalFilename().isEmpty()) {
	            file.transferTo(new File(PATH + file.getOriginalFilename()));
	        }
	        s.addBoard(new Board(0, title, contents, file.getOriginalFilename(), hits,writedate));
	        return "board/board";
	    }

	    @RequestMapping(value="/view", method=RequestMethod.GET)
	    public String view() {
	        return "board/view";
	    }
		
	    @RequestMapping(value="/boardView", method=RequestMethod.GET)
	    @ResponseBody
	    public Board boardList(@RequestParam("idx")int idx) throws Exception{
	       
	    	s.updatereviewcnt(idx);
	    	
	    	return s.getBoardOne(idx);
	    }
	    
	    
	    
	    @RequestMapping(value="/replyList", method=RequestMethod.GET)
	    @ResponseBody
	    public List<Reply> replyList(@RequestParam("idx")int boardIdx){
	        return s.getReply(boardIdx);
	    }
	    @RequestMapping(value="/writeReply", method=RequestMethod.POST)
	    public String writeReply(
	            @RequestParam("idx")int idx,
	            @RequestParam("replyIdx")int replyIdx,
	            @RequestParam("contents")String contents) {
	        s.addReply(new Reply(0, idx,replyIdx, contents));
	        return "redirect:view?idx=" + idx;
	    }
	   
	    @RequestMapping(value="/boardListView", method=RequestMethod.GET)
	    public String boardListView() {
	        return "board/boardListView";
	    }
}
