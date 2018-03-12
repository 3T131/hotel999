package com.accp.controller;

import com.accp.biz.ReceiveTargetBiz;
import com.accp.biz.UserBiz;
import com.accp.dao.ReceiveTargetDao;
import com.accp.entity.ReceiveTarget;
import com.accp.entity.Users;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("user")
public class UserController {

    @Resource
    private ReceiveTargetBiz receiveTargetBiz;

    /**
     * 跳转登录页面
     * @return
     */
    @RequestMapping("/login.to")
    public String toLogin(){
        return "login/login";
    }

    /**
     * 用户登录
     * @param receiveTarget
     * @param session
     * @param model
     * @return
     */
    @RequestMapping("/login.do")
    public String doLogin(ReceiveTarget receiveTarget, HttpSession session, Model model){
        ReceiveTarget receiveTarget1 = receiveTargetBiz.selectLogin(receiveTarget);
        if(receiveTarget1!=null){
            session.setAttribute("userSession",receiveTarget1);
            return "main/main";
        }
        model.addAttribute("error","用户名或密码错误");
        return "login/login";
    }


}
