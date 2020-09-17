package com.file.board.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public List<PhotoBoardVO> selectPhotoBoardList(PhotoBoardVO pb) {
		try(SqlSession ss = ssf.openSession()){
			/*
			 * Map<String,Object> map = new HashMap<>(); map.put("startNum", 211);
			 * map.put("endNum", 220);
			 */
			return ss.selectList("PhotoBoard.selectPhotoBoardList", pb);
		}
	}

	@Override
	public int selectPhotoBoardCount(PhotoBoardVO pb) {
		try(SqlSession ss = ssf.openSession()){
			return ss.selectOne("PhotoBoard.selectPhotoBoardCount", pb);
		}
	}
}
