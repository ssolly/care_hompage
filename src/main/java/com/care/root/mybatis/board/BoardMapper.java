package com.care.root.mybatis.board;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.care.root.board.dto.BoardDTO;
import com.care.root.board.dto.BoardRepDTO;

@Repository
public interface BoardMapper {

	//public List<BoardDTO> selectAllBoardList();
	public int writeSave(BoardDTO dto);
	public BoardDTO contentView(int writeNo);
	public void upHit(int writeNo);
	public int delete(int writeNo);
	public int modify(BoardDTO dto);
	public int addReply(BoardRepDTO dto);
	public List<BoardRepDTO> getRepList(int write_group);
	public int selectBoardCount();
	public List<BoardDTO> selectAllBoardList(@Param("s") int start, @Param("e") int end);
									//값을 여러개 넘겨줄 때 DB에서 쓸 값은 " @Param("db값") java에서 쓰던 변수명"으로 설정해준다
}
