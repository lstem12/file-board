package com.file.board.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.file.board.service.PhotoBoardService2;
import com.file.board.vo.PhotoBoardVO;

@Service
public class PhotoBoardServiceImpl2 implements PhotoBoardService2 {

	@Override
	public int insertPhotoBoard2(PhotoBoardVO pb, MultipartFile file) {
		System.out.println(file.getOriginalFilename());
		System.out.println(pb);
		return 0;
	}

}
