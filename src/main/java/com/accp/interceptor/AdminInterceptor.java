package com.accp.interceptor;

import com.accp.entity.ReceiveTarget;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        ReceiveTarget user = (ReceiveTarget)request.getSession().getAttribute("userSession");
        if(user!=null){
            return true;
        }else{
            response.sendRedirect(request.getContextPath()+"/user/login.to");
            return false;
        }
    }
}
