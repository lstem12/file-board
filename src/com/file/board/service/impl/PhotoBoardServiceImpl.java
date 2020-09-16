package com.file.board.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import com.file.board.dao.PhotoBoardDAO;
import com.file.board.service.PhotoBoardService;
import com.file.board.vo.PhotoBoardVO;

public class PhotoBoardServiceImpl implements PhotoBoardService {

	@Autowired
	private PhotoBoardDAO pbdao;
	@Override
	public int insertPhotoBoard(PhotoBoardVO pb, MultipartFile file) {
		return pbdao.insertPhotoBoard(pb, file);
	}

}
