package com.multi.campus;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.lang.Nullable;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


//interceptor
public class LoginInterceptor implements HandlerInterceptor {
	

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception {

		
		HttpSession session=request.getSession();

		String logStatus = (String)session.getAttribute("status");
		
		if(logStatus==null || !logStatus.equals("Y")){
			response.sendRedirect("/users/login");

			//request.getContextPath()+  <springboot는 contextPath설정 안함!!!!>
			return false;
		}
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request,HttpServletResponse response, Object handler,
			@Nullable ModelAndView mav)throws Exception {
		
	}
	//��Ʈ�ѷ��� ������ ȣ��Ǵ� �޼ҵ�
	@Override
	public void afterCompletion(HttpServletRequest request,HttpServletResponse response,Object handler,
			@Nullable Exception e)throws Exception {
		
	}
} 
