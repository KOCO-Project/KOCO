package co.kr.koco.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import co.kr.koco.service.QnaBoardService;
import co.kr.koco.vo.BoardVO;

public class CheckWriterInterceptor implements HandlerInterceptor{
	
	@Autowired
	private QnaBoardService qnaBoardService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
//		System.out.println(session.getAttribute("userNo"));
//		System.out.println(Integer.parseInt(session.getAttribute("userNo").toString()));
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		BoardVO currBoard = qnaBoardService.getQnaBoard(boardNo);
		if(currBoard.getUserNo() != Integer.parseInt(session.getAttribute("userNo").toString())) {
			response.sendRedirect("not_writer");
			return false;
		}	
		return true;
	}
}
