package co.kr.koco.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.koco.dao.NoticeDAO;
import co.kr.koco.vo.NoticeVO;
import co.kr.koco.vo.PageVO;

@Service
public class NoticeService {
	@Autowired
	private NoticeDAO dao;

	private int pageListcnt = 10;
	private int pagePaginationcnt = 10;

	public List<NoticeVO> getNoticeList(NoticeVO noticeVo, int page) {
		int start = (page - 1) * pageListcnt;
		RowBounds rowBounds = new RowBounds(start, pageListcnt);
		
		return dao.getNoticeList(noticeVo, rowBounds);
	}

	public PageVO getNoticeCnt(int currentPage) {
		int cnt = dao.getNoticeCnt();
		PageVO pageVO = new PageVO(cnt, currentPage, pageListcnt, pagePaginationcnt);

		return pageVO;
	}
}