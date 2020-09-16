package com.file.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.file.board.service.PhotoBoardService2;
import com.file.board.vo.PhotoBoardVO;

@Controller
public class PhotoBoardController2 {
	@Autowired
	private PhotoBoardService2 pbService2;
	
	@RequestMapping(value="/photo/list2", method=RequestMethod.GET)
	public String goList() {
		return "photo/list2";
	}
	@RequestMapping(value="/photo/write2", method=RequestMethod.GET)
	public String goWrite() {
		return "photo/write2";
	}
	@RequestMapping(value="/photo/write2", method=RequestMethod.POST)
	public String doWrite(@RequestParam("pbFile") MultipartFile file, @ModelAttribute PhotoBoardVO pb) {
		pbService2.insertPhotoBoard2(pb, file);
		return "photo/write2";
	}
}
