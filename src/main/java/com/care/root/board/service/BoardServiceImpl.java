package com.care.root.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.root.mybatis.board.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired BoardMapper mapper;
	
	@Override
	public void selectAllBoardList(Model model) {	//jsp에 전달해줘야하기 떄문에 model 객체 필요
		model.addAttribute("boardList",mapper.selectAllBoardList());
	}

}
