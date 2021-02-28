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
	

		return true;
	}
}
