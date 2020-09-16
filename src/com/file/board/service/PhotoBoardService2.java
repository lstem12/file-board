package com.file.board.service;

import org.springframework.web.multipart.MultipartFile;

import com.file.board.vo.PhotoBoardVO;

public interface PhotoBoardService2 {
	int insertPhotoBoard2(PhotoBoardVO pb, MultipartFile file);
}
