package co.kr.koco.interceptor;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.web.servlet.HandlerInterceptor;

import co.kr.koco.service.TopMenuService;
import co.kr.koco.vo.BoardInfoVO;
import co.kr.koco.vo.UserVO;

public class TopMenuInterceptor implements HandlerInterceptor{

	@Autowired
	private TopMenuService topMenuService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj)
			throws Exception {
		// TODO Auto-generated method stub
		List<BoardInfoVO> topMenuList = topMenuService.getTopMenuList();
		request.setAttribute("topMenuList", topMenuList);

		return true;
	}
}
