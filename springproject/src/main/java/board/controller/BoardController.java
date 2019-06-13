package board.controller;
g
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;

@Controller
@RequestMapping(value="/board")
public class BoardController {
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private BoardPaging boardPaging;
	
	@RequestMapping(value="/boardWriteForm.do", method=RequestMethod.GET)
	public String boardWriteForm(Model model) {
		model.addAttribute("display","/board/boardWriteForm.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="/boardWrite.do", method=RequestMethod.POST)
	@ResponseBody
	public void boardWrite(@RequestParam Map<String, String> map, HttpSession session) {
		String id = (String)session.getAttribute("memId");
		String name = (String)session.getAttribute("memName");
		String email = (String)session.getAttribute("memEmail");
		
		map.put("id", id);
		map.put("name", name);
		map.put("email", email);
		
		boardDAO.boardWrite(map);
	}
	
	@RequestMapping(value="/boardList.do", method=RequestMethod.GET)
	public String boardList(@RequestParam(required=false, defaultValue="1") String pg, Model model) {
		model.addAttribute("pg", pg);
		model.addAttribute("display", "/board/boardList.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="/getBoardList.do", method=RequestMethod.POST)
	public ModelAndView getBoardList(@RequestParam(required=false, defaultValue="1") String pg,
									 HttpSession session) {
		String memId = (String)session.getAttribute("memId");
		
		//DB-1페이지당 5개씩
		int endNum = Integer.parseInt(pg)*5;
		int startNum = endNum-4;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		List<BoardDTO> list = boardDAO.getBoardList(map);
		
		//페이징 처리
		int totalA = boardDAO.getTotalA();
		boardPaging.setCurrentPage(Integer.parseInt(pg));
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);
		boardPaging.makePagingHTML();		
				
		ModelAndView mav = new ModelAndView();
		mav.addObject("memId", memId);
		mav.addObject("list", list);
		mav.addObject("boardPaging", boardPaging);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="/boardView.do", method=RequestMethod.GET)
	public String boardView(@RequestParam String seq, @RequestParam String pg, Model model) {
		BoardDTO boardDTO = boardDAO.boardView(seq);
		
		model.addAttribute("pg", pg);
		model.addAttribute("boardDTO", boardDTO);
		model.addAttribute("display", "/board/boardView.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="/boardSearch.do", method=RequestMethod.POST)
	public ModelAndView boardSearch(@RequestParam(required=false) Map<String, String> map) {
		//System.out.println(map.get("pg")+","+map.get("searchOption")+","+map.get("keyword"));
		
		//DB-1페이지당 5개씩
		int endNum = Integer.parseInt(map.get("pg"))*5;
		int startNum = endNum-4;
		
		map.put("startNum", startNum+"");
		map.put("endNum", endNum+"");
		
		List<BoardDTO> list = boardDAO.boardSearch(map);
		
		//페이징 처리
		int totalA = boardDAO.getTotalSearchA(map);
		boardPaging.setCurrentPage(Integer.parseInt(map.get("pg")));
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);
		boardPaging.makeSearchPagingHTML();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("searchOption", map.get("searchOption"));
		mav.addObject("keyword", map.get("keyword"));
		mav.addObject("list", list);
		mav.addObject("boardPaging", boardPaging);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="/boardModifyForm.do", method=RequestMethod.POST)
	public String boardModifyForm(@RequestParam String seq, @RequestParam String pg, Model model) {
		BoardDTO boardDTO = boardDAO.boardView(seq);
		
		model.addAttribute("seq", seq);
		model.addAttribute("pg", pg);
		model.addAttribute("boardDTO", boardDTO);
		model.addAttribute("display", "/board/boardModifyForm.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="/boardModify.do", method=RequestMethod.POST)
	@ResponseBody
	public void boardModify(@RequestParam(required=false) Map<String, String> map) {
		boardDAO.boardModify(map);
	}
	
	@RequestMapping(value="/boardDelete.do", method=RequestMethod.POST)
	public String boardDelete(@RequestParam String seq, Model model) {
		boardDAO.boardDelete(seq);
		model.addAttribute("display", "/board/boardDelete.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="/boardReplyForm.do", method=RequestMethod.POST)
	public String boardReplyForm(@RequestParam String pseq, @RequestParam String pg, Model model) {
		model.addAttribute("pseq", pseq);
		model.addAttribute("pg", pg);
		model.addAttribute("display", "/board/boardReplyForm.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="/boardReply.do", method=RequestMethod.POST)
	@ResponseBody
	public void boardReply(@RequestParam(required=false) Map<String, String> map, 
						   HttpSession session) {
		map.put("id", (String)session.getAttribute("memId"));
		map.put("name", (String)session.getAttribute("memName"));
		map.put("email", (String)session.getAttribute("memEmail"));
		
		BoardDTO pDTO = boardDAO.boardView(map.get("pseq"));
		
		map.put("ref", pDTO.getRef()+"");
		map.put("lev", pDTO.getLev()+"");
		map.put("step", pDTO.getStep()+"");
		
		boardDAO.boardReply(map);
	}
}


















