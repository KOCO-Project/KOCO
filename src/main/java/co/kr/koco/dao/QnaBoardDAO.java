package co.kr.koco.dao;

import java.util.List;

import co.kr.koco.vo.BoardVO;

public interface QnaBoardDAO {

	public void register(BoardVO boardVO);
	public List<BoardVO> getQnaList(int infoNo);
	public BoardVO getQna(int boardNo);
	public void update(int boardNo);
	public void delete(int boardNo);
}
