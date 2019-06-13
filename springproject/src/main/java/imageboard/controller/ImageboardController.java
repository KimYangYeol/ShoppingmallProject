package imageboard.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import imageboard.bean.ImageboardDTO;
import imageboard.dao.ImageboardDAO;

@Controller
@RequestMapping(value="/imageboard")
public class ImageboardController {
	@Autowired
	private ImageboardDAO imageboardDAO;
	
	@RequestMapping(value="/imageboardWriteForm.do", method=RequestMethod.GET)
	public String imageboardWriteForm(Model model) {
		model.addAttribute("display", "/imageboard/imageboardWriteForm.jsp");
		return "/main/index";
	}
	/*
	@RequestMapping(value="/imageboardWrite.do", method=RequestMethod.POST)
	public String imageboardWrite(@ModelAttribute ImageboardDTO imageboardDTO,
								  @RequestParam MultipartFile img,
								  Model model) {
		String filePath = "D:\\Spring\\workspace\\springproject\\src\\main\\webapp\\storage";
		String fileName = img.getOriginalFilename();
		File file = new File(filePath,fileName);
		
		try {
			FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		imageboardDTO.setImage1(fileName);
		
		//DB
		imageboardDAO.imageboardWrite(imageboardDTO);
		
		model.addAttribute("display", "/imageboard/imageboardList.jsp");
		return "/main/index";
	}
	*/
	
	@RequestMapping(value="/imageboardWrite.do", method=RequestMethod.POST)
	public String imageboardWrite(@ModelAttribute ImageboardDTO imageboardDTO,
								  @RequestParam MultipartFile[] img,
								  Model model) {
		String filePath = "D:\\Spring\\workspace\\springproject\\src\\main\\webapp\\storage";
		String fileName;
		File file;
		
		if(img[0]!=null) {
			fileName = img[0].getOriginalFilename();
			file = new File(filePath, fileName);
			try {
				FileCopyUtils.copy(img[0].getInputStream(), new FileOutputStream(file));
			} catch (IOException e) {
				e.printStackTrace();
			}
		
			imageboardDTO.setImage1(fileName);
		}else {
			imageboardDTO.setImage1(null);
		}
		//-------------------
		if(img[1]!=null) {
			fileName = img[1].getOriginalFilename();
			file = new File(filePath, fileName);
			try {
				FileCopyUtils.copy(img[1].getInputStream(), new FileOutputStream(file));
			} catch (IOException e) {
				e.printStackTrace();
			}
		
			imageboardDTO.setImage2(fileName);
		}else {
			imageboardDTO.setImage2(null);
		}
		
		//DB
		//imageboardDAO.imageboardWrite(imageboardDTO);
		
		model.addAttribute("display", "/imageboard/imageboardList.jsp");
		return "/main/index";
	}
}
















