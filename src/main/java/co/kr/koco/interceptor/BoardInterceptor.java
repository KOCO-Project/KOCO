package co.kr.koco.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.web.servlet.HandlerInterceptor;

import co.kr.koco.service.QnaBoardService;
import co.kr.koco.vo.BoardVO;
import co.kr.koco.vo.UserVO;

public class BoardInterceptor implements HandlerInterceptor{
	@Resource(name="userVO")
	@Lazy
	private UserVO userVO;
	
	@Autowired
	private QnaBoardService qnaBoardService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String str1 = request.getParameter("boardNo");
		int boardNo = Integer.parseInt(str1);
		
		BoardVO currentQnaBoardVO = qnaBoardService.getQnaBoard(boardNo);
		
		if(currentQnaBoardVO.getUserNo() != userVO.getUserNo()) {
			String contextPath = request.getContextPath();
			response.sendRedirect(contextPath + "/board/not_writer");
			return false;
		}
		return true;
	}
}
