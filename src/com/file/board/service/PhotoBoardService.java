package com.file.board.service;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.file.board.vo.PhotoBoardVO;

public interface PhotoBoardService {
	int insertPhotoBoard(PhotoBoardVO pb, MultipartFile file);
	List<PhotoBoardVO> selectPhotoBoardList(PhotoBoardVO pb, Model model);
}
