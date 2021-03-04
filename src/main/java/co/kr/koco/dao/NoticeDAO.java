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
		return sql.selectList("noticeBoardMapper.noticeList", noticeVo, rowBounds);
	}
	
	public int getNoticeCnt() {
		return sql.selectOne("noticeBoardMapper.getNoticeCnt");
	}
}
