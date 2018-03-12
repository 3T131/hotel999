package com.accp.controller;

import com.accp.biz.AttributeDetailsBiz;
import com.accp.biz.ReceiveTargetBiz;
import com.accp.entity.Pager;
import com.accp.entity.ReceiveTarget;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;

@Controller
@RequestMapping("/ReceiveTarget")
public class ReceiveTargetController {
    @Resource
    private ReceiveTargetBiz receiveTargetBiz;
    @Resource
    private AttributeDetailsBiz attributeDetailsBiz;

    /**
     * 查询列表
     * @param principal
     * @param model
     * @param receiveTarget
     * @param currentPage
     * @return
     */
    @RequestMapping(value = "/tolist.do")
    public  String list(@ModelAttribute("principal")String principal,
                        Model model,
                        @ModelAttribute("receiveTarget")ReceiveTarget receiveTarget,
                        @RequestParam(name = "currentPage",defaultValue = "1")Integer currentPage){
        Pager<ReceiveTarget> pager=new Pager<ReceiveTarget>();
        pager.setPageNo(currentPage);
        pager.setPageSize(5);//设置分页数
        pager.setParams(receiveTarget);//设置参数
        receiveTarget.setPrincipal(principal);
        receiveTargetBiz.list(pager);
        model.addAttribute("list",pager);
        return "receivetarget/list";

    }

    /**
     * 进入添加页面
     * @param model
     * @return
     */
    @RequestMapping("/toadd.do")
    public String toAdd(Model model){
        model.addAttribute("listOne",attributeDetailsBiz.listByAttributeName(14));

        return "receivetarget/add";
    }

    /**
     * 添加对象
     * @param receiveTarget
     * @return
     */
    @RequestMapping("/add.do")
    public String add(@ModelAttribute("receiveTarget")ReceiveTarget receiveTarget){
            receiveTargetBiz.insertReceiveTarget(receiveTarget);
        return "redirect:tolist.do";
    }

    /**
     * 查询单个对象
     * @param model
     * @return
     */
    @RequestMapping("/toupdate.do")
    public String toUpdate(Model model,int id){
        model.addAttribute("listOne",attributeDetailsBiz.listByAttributeName(14));
        model.addAttribute("list",receiveTargetBiz.queryByid(id));

        return "receivetarget/update";
    }

    /**
     * 更改接待对象信息
     * @param receiveTarget
     * @return
     */
    @RequestMapping("/update.do")
    public String update(ReceiveTarget receiveTarget){
        receiveTargetBiz.updateReceiveTarget(receiveTarget);
        return "redirect:tolist.do";
    }
    /**
     * 删除接待对象
     * @param id
     * @return
     */
    @RequestMapping("/delete.do")
    public String delete(String[] id){
        receiveTargetBiz.deleteReceiveTarget(id);
        return "redirect:tolist.do";
    }
}
