package com.accp.controller;

import com.accp.biz.AttributeDetailsBiz;
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

    @Resource
    private AttributeDetailsBiz attributeDetailsBiz;

    /**
     * 跳转登录页面
     * @return
     */
    @RequestMapping("/login.to")
    public String toLogin(){
        return "login/login2";
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
            return "redirect:/Main/main";
        }
        model.addAttribute("error","用户名或密码错误");
        return "login/login2";
    }

    @RequestMapping("/exit.do")
    public String exit(HttpSession session){
        session.invalidate();
        return "login/login2";
    }

    /**
     * 修改个人信息
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/toModifyMy.do")
    public String toModifyMy(Model model, HttpSession session){
        ReceiveTarget receiveTarget=(ReceiveTarget) session.getAttribute("userSession");
        model.addAttribute("listOne",attributeDetailsBiz.listByAttributeName(14));
        model.addAttribute("list",receiveTarget);

        return "receivetarget/update";
    }

    /**
     * 更改接待对象信息
     * @param receiveTarget
     * @return
     */
    @RequestMapping("/update.do")
    public String update(ReceiveTarget receiveTarget,HttpSession session){
        receiveTargetBiz.updateReceiveTarget(receiveTarget);
        session.setAttribute("userSession",receiveTargetBiz.queryByid(receiveTarget.getReceiveTargetId()));
        return "redirect:/user/toModifyMy.do";
    }

    /**
     * 跳转403页面
     * @return
     */
    @RequestMapping("/user403")
    public String user403(){
        return "error/page_403";
    }


}
