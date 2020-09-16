package com.file.board.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.file.board.dao.PhotoBoardDAO;
import com.file.board.vo.PhotoBoardVO;

@Repository
public class PhotoBoardDAOImpl implements PhotoBoardDAO {
	
	@Autowired
	private SqlSessionFactory ssf;

	@Override
	public int insertPhotoBoard(PhotoBoardVO pb, MultipartFile file) {
		
		try(SqlSession ss = ssf.openSession()){
			System.out.println(pb);
			return ss.insert("PhotoBoard.insertPhotoBoard",pb);
		}
	}
	
}
