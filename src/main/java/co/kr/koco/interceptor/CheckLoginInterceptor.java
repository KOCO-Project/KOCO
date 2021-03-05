package co.kr.koco.interceptor;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Lazy;
import org.springframework.web.servlet.HandlerInterceptor;

import co.kr.koco.vo.UserVO;

public class CheckLoginInterceptor implements HandlerInterceptor{

	@Resource(name="userVO")
	@Lazy
	private UserVO userVO;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
		if(userVO.isUserLogin() == false) {
			String contextPath = request.getContextPath();
			response.sendRedirect(contextPath + "/not_login");
			return false;
		}
		return true;
	}
}
