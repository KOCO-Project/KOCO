package co.kr.koco.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.kr.koco.dao.EventBoardDAO;
import co.kr.koco.vo.EventVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class EventBoardServiceImpl implements EventBoardService {

	@Setter(onMethod_ = @Autowired)
	private EventBoardDAO eventDao;
	

	@Override
	public void register(EventVO event) {
		log.info("register......" + event);
		eventDao.boardRegister(event);

	}

	@Override
	public EventVO get(Long bno) {
		log.info("get......" + bno);
		return eventDao.getBoard(bno);
	}

	@Override
	public int modify(EventVO event) {
		return eventDao.boardUpdate(event);
	}

	@Override
	public int remove(Long bno) {
		return eventDao.boardDelete(bno);
	}

	@Override
	public List<EventVO> getList() {

		log.info("getList..........");

		return eventDao.boardList();
	}

//	@Override
//	public List<EventVO> getList(Criteria cri) {
//
//	log.info("get List with criteria: " + cri);
//
//	return mapper.getListWithPaging(cri);
//	}
//	
//	@Override
//	public int getTotal(Criteria cri) {
//		log.info("get total count");
//		return mapper.getTotalCount(cri);
//	}

}
