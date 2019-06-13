package member.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import member.bean.MemberDTO;
import member.bean.PostDTO;
import member.dao.MemberDAO;

@Controller
public class MemberController {
	@Autowired
	private MemberDAO memberDAO;
	
	@RequestMapping(value="/member/login.do", method=RequestMethod.POST)
	@ResponseBody
	public String login(@RequestParam String id, @RequestParam String pwd, HttpSession session) {
		MemberDTO memberDTO = memberDAO.login(id,pwd);
		if(memberDTO==null)
			return "login_fail";
		else {
			//세션
			session.setAttribute("memName", memberDTO.getName());
			session.setAttribute("memId", id);
			session.setAttribute("memEmail", memberDTO.getEmail1()+"@"+memberDTO.getEmail2());
			
			return "login_success";
		}
	}
	
	@RequestMapping(value="/member/logout.do", method=RequestMethod.GET)
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		return new ModelAndView("redirect:/main/index.do");
	}
	
	@RequestMapping(value="/member/writeForm.do", method=RequestMethod.GET)
	public String writeForm(Model model) {
		model.addAttribute("display", "/member/writeForm.jsp");
		return "/main/index";
	}
	
	@RequestMapping(value="/member/checkId.do", method=RequestMethod.POST)
	@ResponseBody
	public String checkId(@RequestParam String id) {
		MemberDTO memberDTO = memberDAO.checkId(id);
		
		if(memberDTO==null)
			return "not_exist";
		else
			return "exist";
	}
	
	@RequestMapping(value="/member/checkPost.do", method=RequestMethod.GET)
	public String checkPost() {
		return "/member/checkPost";
	}
	
	@RequestMapping(value="/member/postSearch.do", method=RequestMethod.POST)
	public ModelAndView postSearch(@RequestParam Map<String,String> map) {
		List<PostDTO> list = memberDAO.postSearch(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="/member/write.do", method=RequestMethod.POST)
	public String write(@ModelAttribute MemberDTO memberDTO, Model model) {
		int su = memberDAO.write(memberDTO);
		model.addAttribute("su", su);
		model.addAttribute("display", "/member/write.jsp");
		return "/main/index";
	}
}





















