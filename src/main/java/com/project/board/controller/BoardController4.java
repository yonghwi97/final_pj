package com.project.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.board.model.BoardVO;
import com.project.board.model.MemberVO;
import com.project.board.model.ReplyVO;
import com.project.board.service.BoardService4;
import com.project.board.service.MemberService;

@Controller
public class BoardController4 {
	 	@Autowired
	    private BoardService4 s;
		private File none;
	    
		@Autowired
	    MemberService memberService;
		
	    @RequestMapping(value="/board4", method=RequestMethod.GET)
	    public String board4() {
	    	
	        return "board/board4";
	    }
		
	    @RequestMapping(value="/boardList4", method=RequestMethod.GET)
	    @ResponseBody
	    public List<BoardVO> boardList4(){
	    	return s.getBoard4();
	    }
	    
		/*
		 * @RequestMapping(value="/boardList", method=RequestMethod.GET)
		 * 
		 * @ResponseBody public List<BoardVO> boardList(Model model
		 * , @RequestParam(required = false, defaultValue = "1") int page
		 * , @RequestParam(required = false, defaultValue = "1") int range) throws
		 * Exception{ int listCnt = s.getBoardListCnt();
		 * 
		 * //Pagination 객체생성 Pagination pagination = new Pagination();
		 * pagination.pageInfo(page, range, listCnt);
		 * 
		 * model.addAttribute("pagination", pagination); return s.getBoard(); }
		 */
	    
	    @RequestMapping(value="/write4", method=RequestMethod.GET)
	    public String write4(HttpSession session, HttpServletResponse write, BoardVO b) throws Exception{
	    	String memId = (String) session.getAttribute("sid1");
			
	    	b.setMemId(memId);
			
			System.out.println("memId 출력: " + b.getMemId());

			// 로그인 되어있는지 확인하는 부분. 안되어있으면 경고 메시지 출력 -> loginform 이동
			if (memId == null) {
				write.setContentType("text/html; charset=UTF-8");
				PrintWriter out_write = write.getWriter();
				out_write.println("<script>alert('회원만 사용 가능한 기능입니다.');</script>");
				out_write.flush();

				return "login";

			} else {
				// 로그인이 되어있는 경우
				return "board/write4";
			}
	    	
	    }
		
	    @RequestMapping(value="/writeAction4", method=RequestMethod.POST)
	    public String writeAction3(
	            HttpServletRequest req,@RequestParam("file") MultipartFile file,Model model,
	            @RequestParam("title")String title, 
	            @RequestParam("contents")String contents, String hits,Date writedate, String memId) throws IllegalStateException, IOException {
	        
	    	//1. 파일 저장 경로 설정 : 실제 서비스 되는 위치(프로젝트 외부에 저장)
			String uploadPath="/upload/";
			
			//2. 원본 파일 이름 알아오기
			String originalFileName=file.getOriginalFilename();
			System.out.println(memId);
			
			
			 if (!file.getOriginalFilename().isEmpty()) {
		            file.transferTo(new File(uploadPath + file.getOriginalFilename()));
		        }
			//model로 저장
			model.addAttribute("originalFileName",originalFileName);
			
	        s.addBoard4(new BoardVO(0, title, contents, file.getOriginalFilename(), hits,writedate,memId));
	        return "redirect:./board4";
	    }
	    
		/*
		 * @RequestMapping(value="/writeAction", method=RequestMethod.POST) public
		 * String writeAction( HttpServletRequest req,@RequestParam("file")
		 * MultipartFile file,
		 * 
		 * @RequestParam("title")String title,
		 * 
		 * @RequestParam("contents")String contents, String hits,Date writedate) throws
		 * IllegalStateException, IOException { String PATH =
		 * req.getSession().getServletContext().getRealPath("/") + "resources/"; if
		 * (!file.getOriginalFilename().isEmpty()) { file.transferTo(new File(PATH +
		 * file.getOriginalFilename())); } s.addBoard(new BoardVO(0, title, contents,
		 * file.getOriginalFilename(), hits,writedate)); return "board/board"; }
		 */

	    @RequestMapping(value="/view4", method=RequestMethod.GET)
	    public String view4(Model model,HttpSession session) {
	    	
	    	String sid=(String)session.getAttribute("sid1");
	        System.out.println(sid);
	        MemberVO memberList = memberService.getMember(sid);
			model.addAttribute("memberList", memberList);
	        
	    	
	    	
	        return "board/view4";
	    }
		
	    @RequestMapping(value="/boardView4", method=RequestMethod.GET)
	    @ResponseBody
	    public BoardVO boardList4(@RequestParam("idx")int idx) throws Exception{
	        System.out.println("boardView, idx = " + idx);
	    	s.updatereviewcnt4(idx);
	    	BoardVO vo = s.getBoardOne4(idx);
	    	System.out.println(vo.getImage());
	    	return s.getBoardOne4(idx);
	    }
	    
		
	    
	    @RequestMapping(value="/replyList4", method=RequestMethod.GET)
	    @ResponseBody
	    public List<ReplyVO> replyList4(@RequestParam("idx")int boardIdx){
	        return s.getReply4(boardIdx);
	    }
	    
	    @RequestMapping(value="/writeReply4", method=RequestMethod.POST)
	    public String writeReply4(
	            @RequestParam("idx")int idx,
	            @RequestParam("replyIdx")int replyIdx,
	            @RequestParam("contents")String contents) {
	        s.addReply4(new ReplyVO(0, idx,replyIdx, contents));
	        return "redirect:view4?idx=" + idx;
	    }
	   
	    @RequestMapping(value="/boardListView4", method=RequestMethod.GET)
	    public String boardListView4() {
	        return "board/boardListView4";
	    }
	    
	    @RequestMapping("/board/deleteboard4/{idx}")
		public String deleteBoard4(@PathVariable String idx) {
	    	s.deleteBoard4(idx);
			return "redirect:/board4";
		}
	    
	    @RequestMapping("/board/deletereply4/{pageIdx}/{idx}")
		public String deleteReply4(@PathVariable String idx, @PathVariable String pageIdx) {
	    	s.deleteReply4(idx);
	    
			return "redirect:/view4?idx=" + pageIdx;
		}
	    
	    
	    
	    @RequestMapping("/board/update4/{idx}")
		public String updateBoardForm4(@PathVariable int idx, Model model) {
			BoardVO board = s.detailViewBoard4(idx);
			model.addAttribute("board", board);
			return "board/update4";
		}
	    
	    @RequestMapping("/board/updateBoard4")
		public String detailViewBoard3(BoardVO board,@RequestParam("file") MultipartFile file,Model model) throws IllegalStateException, IOException {
	    	
	    	//1. 파일 저장 경로 설정 : 실제 서비스 되는 위치(프로젝트 외부에 저장)
			String uploadPath="C:/springWorkspace/upload/";
			
			//2. 원본 파일 이름 알아오기
			String originalFileName=file.getOriginalFilename();
			
			
			
			 if (!file.getOriginalFilename().isEmpty()) {
		            file.transferTo(new File(uploadPath + file.getOriginalFilename()));
		        }
			 
			//model로 저장
			model.addAttribute("originalFileName",originalFileName);
			board.setImage(file.getOriginalFilename());
			        
	    	
			s.updateBoard4(board);
			return "redirect:/board4";
		}
	    
	    
}
