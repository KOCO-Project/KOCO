package co.kr.koco.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.ui.Model;

import co.kr.koco.vo.BoardVO;

public interface QnaBoardDAO {

	public void getQnaBoardRegister(BoardVO qnaBoardVO);
	public List<BoardVO> getQnaBoardList(BoardVO vo, RowBounds rowBounds);
	public BoardVO getQna(int boardNo);
	public void updateQnaBoard(BoardVO boardVO);
	public void deleteQnaBoard(int boardNo);
	public String getBoardInfoName(int infoNo);
	public int getQnaBoardCnt(BoardVO vo);
	public void setQnaBoardRcnt(int boardNo);
	public void getAnswerRegister(BoardVO ansQnaBoardVO);

}
