package co.kr.koco.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import co.kr.koco.vo.BoardVO;

public interface QnaBoardDAO {

	public void getQnaBoardRegister(BoardVO qnaBoardVO);
	public List<BoardVO> getQnaBoardList(int boardNo, RowBounds rowBounds);
	public BoardVO getQna(int boardNo);
	public void updateQnaBoard(BoardVO boardVO);
	public void deleteQnaBoard(int boardNo);
	public String getBoardInfoName(int boardNo);
	public int getQnaBoardCnt(int boardCategory);
}
