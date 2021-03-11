package co.kr.koco.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.kr.koco.vo.NoticeVO;

@Repository
public class NoticeDAO {
	@Autowired
	private SqlSessionTemplate sql;

	public List<NoticeVO> getNoticeList(NoticeVO noticeVo, RowBounds rowBounds) {
		if (noticeVo.getSearchCondition() == null || noticeVo.getSearchCondition().equals("검색"))
			noticeVo.setSearchCondition("TITLE");

		if (noticeVo.getSearchKeyword() == null)
			noticeVo.setSearchKeyword("");

		return sql.selectList("noticeBoardMapper.noticeList", noticeVo, rowBounds);
	}

	public NoticeVO getNoticeBoard(int noticeNo) {
		return (NoticeVO) sql.selectOne("noticeBoardMapper.getNoticeBoard", noticeNo);
	}

	public void noticeRegister(NoticeVO noticeVo) {
		sql.insert("noticeBoardMapper.noticeRegister", noticeVo);
	}

	public int getNoticeCnt(NoticeVO noticeVo) {
		if (noticeVo.getSearchCondition() == null || noticeVo.getSearchCondition().equals("검색"))
			noticeVo.setSearchCondition("TITLE");

		if (noticeVo.getSearchKeyword() == null)
			noticeVo.setSearchKeyword("");

		return sql.selectOne("noticeBoardMapper.getNoticeCnt", noticeVo);
	}

	public void deleteNotice(int noticeNo) {
		sql.delete("noticeBoardMapper.deleteNotice", noticeNo);
	}

	public void updateNotice(NoticeVO noticeVo) {
		sql.update("noticeBoardMapper.updateNotice", noticeVo);
	}
}
