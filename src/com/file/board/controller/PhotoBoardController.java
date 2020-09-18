package com.file.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.file.board.service.PhotoBoardService;
import com.file.board.vo.PageVO;
import com.file.board.vo.PhotoBoardVO;

@Controller
public class PhotoBoardController {
	@Autowired
	private PhotoBoardService pbService;
	
	@RequestMapping(value="/photo/list",method=RequestMethod.GET)
	public String goList(@ModelAttribute PhotoBoardVO pb, Model model) {
		if(pb.getPage()==null) {
			pb.setPage(new PageVO());
			pb.getPage().setPageNum(1);
		}
		pbService.selectPhotoBoardList(pb,model);
		return "photo/list";
	}
	@RequestMapping(value="/photo/view",method=RequestMethod.GET)
	public String goView(@ModelAttribute PhotoBoardVO pb, Model model) {
		int pbNum = pb.getPbNum();
		model.addAttribute("pbView",pbService.selectPhotoBoard(pbNum));
		return "photo/view";
	}
	
	@RequestMapping(value="/photo/write",method=RequestMethod.GET)
	public String goWrite() {
		return "photo/write";
	}
	
	@RequestMapping(value="/photo/write",method=RequestMethod.POST)
	public String doWrite(@ModelAttribute PhotoBoardVO pb, @RequestParam("pbFile") MultipartFile file, Model model) {
		if(pbService.insertPhotoBoard(pb, file) == 1) {
			model.addAttribute("msg", "글 작성 성공");
			return "redirect:/photo/list";
		}else {
			model.addAttribute("msg", "글 작성 실패");
		}
		return "photo/write";
	}
	@RequestMapping(value="/photo/update",method=RequestMethod.POST)
	public String doUpdate(@ModelAttribute PhotoBoardVO pb, @RequestParam("pbFile") MultipartFile file, Model model) {
		if(pbService.updatePhotoBoard(pb, file) == 1) {
			model.addAttribute("msg", "글 수정 성공");
			return "redirect:/photo/list";
		}else {
			model.addAttribute("msg", "글 수정 실패");
		}
		return "photo/write";
	}
	
	@RequestMapping(value="/photo/delete",method=RequestMethod.POST)
	public String deletePhotoBoards(@RequestParam("pbNums")int[] pbNums) {
		pbService.deletePhotoBoards(pbNums);
		return "redirect:/photo/list?page.pageNum=1";
	}

}
