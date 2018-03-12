package com.accp.controller;

import com.accp.biz.PassengerBiz;
import com.accp.biz.impl.AttributeDetailsBizImpl;
import com.accp.entity.Pager;
import com.accp.entity.Passenger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;

@Controller
@RequestMapping("/Passenger")
public class PassengerController {
    @Resource
    private PassengerBiz passengerBiz;
    @Resource
    private AttributeDetailsBizImpl attributeDetailsBiz;

    /**
     * 查询页面$$模糊查询&&分页查询
     * @param model
     * @param passenger
     * @param currentPage
     * @return
     */
    @RequestMapping("/tolist.do")
    public String list(Model model, @ModelAttribute("passenger")Passenger passenger, @RequestParam(name = "currentPage",defaultValue = "1")Integer currentPage) {
        Pager<Passenger> pager=new Pager<Passenger>();
        pager.setPageNo(currentPage);//设置当前页
        pager.setPageSize(10);//设置页面大小
        pager.setParams(passenger);//设置参数
        passengerBiz.listPage(pager);
        model.addAttribute("pager", pager);
        model.addAttribute("passenger", passenger);
        return "passenger/list";
    }

    /**
     * 根据ID勾选删除
     * @param id
     * @param model
     * @param name
     * @param passenger
     * @param currentPage
     * @return
     */
    @RequestMapping("/delete.do")
    public String delete(String[] id,Model model, String name, Passenger passenger, @RequestParam(name = "currentPage",defaultValue = "1")Integer currentPage) {
        System.out.println(id);
        passengerBiz.delete(id);
        return list( model,   passenger, currentPage);
    }

    /**
     * 进入修改页面把需要的下拉框显示数据
     * @param model
     * @param id
     * @return
     */
    @RequestMapping("toupdate.do")
    public String toupdate(Model model, int id) {
        model.addAttribute("list", passengerBiz.queryPassengerId(id));
        model.addAttribute("listGender", attributeDetailsBiz.listByAttributeName(8));
        model.addAttribute("listNation", attributeDetailsBiz.listByAttributeName(9));
        model.addAttribute("listPassengerLevel", attributeDetailsBiz.listByAttributeName(13));
        model.addAttribute("listPapers", attributeDetailsBiz.listByAttributeName(10));

        return "passenger/update";
    }

    /**
     * 添加旅客信息页面
     * @param model
     * @param name
     * @param passenger
     * @param currentPage
     * @return
     */
    @RequestMapping("/toadd.do")
    public String add(Model model, String name, Passenger passenger, @RequestParam(name = "currentPage",defaultValue = "1")Integer currentPage) {
        model.addAttribute("listGender", attributeDetailsBiz.listByAttributeName(8));
        model.addAttribute("listNation", attributeDetailsBiz.listByAttributeName(9));
        model.addAttribute("listPassengerLevel", attributeDetailsBiz.listByAttributeName(13));
        model.addAttribute("listPapers", attributeDetailsBiz.listByAttributeName(10));
        return "passenger/add";
    }

    /**
     * 添加旅客成功，返回旅客详情页面
     * @param model
     * @param name
     * @param passenger
     * @param currentPage
     * @return
     */
    @RequestMapping("/add.do")
    public String addTable(Model model,String name,Passenger passenger, @RequestParam(name = "currentPage",defaultValue = "1")Integer currentPage){
            passengerBiz.add(passenger);

        return list( model,  passenger, currentPage) ;
    }

    /**
     * 修改旅客信息
     * @param model
     * @param passenger
     * @param currentPage
     * @return
     */
    @RequestMapping("/update.do")
    public String update(Model model,Passenger passenger, @RequestParam(name = "currentPage",defaultValue = "1")Integer currentPage) {
        if (passengerBiz.update(passenger)!=null){

        return list(  model, passenger,currentPage);
        }
        else{
            return "error";
        }
    }
}
