package com.accp.interceptor;

import com.accp.entity.ReceiveTarget;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SysInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        ReceiveTarget user = (ReceiveTarget)request.getSession().getAttribute("userSession");
        if(user!=null){
            if(user.getTargetTypeID()==56){
                response.sendRedirect(request.getContextPath()+"/user/user403");
                return false;
            }else{
                return true;
            }
        }else{
            response.sendRedirect(request.getContextPath()+"/user/login.to");
            return false;
        }
    }
}
