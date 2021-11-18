package com.care.root.mybatis.board;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.care.root.board.dto.BoardDTO;

@Repository
public interface BoardMapper {

	public List<BoardDTO> selectAllBoardList();
	public int writeSave(BoardDTO dto);
	public BoardDTO contentView(int writeNo);
	public void upHit(int writeNo);
}
