package com.accp.controller;

import com.accp.biz.AttributeDetailsBiz;
import com.accp.biz.PredetermineBiz;
import com.accp.biz.ReceiveTargetBiz;
import com.accp.biz.RoomBiz;
import com.accp.entity.*;
import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/Predetermine")
public class PredetermineController {
    @Resource
    private PredetermineBiz predetermineBiz;
    @Resource
    private ReceiveTargetBiz receiveTargetBiz;
    @Resource
    private AttributeDetailsBiz attributeDetailsBiz;
    @Resource
    private RoomBiz roomBiz;

    @RequestMapping("/add.do")
    @ResponseBody
    public String addPredetermine(Predetermine predetermine){
        if(predetermineBiz.insertPredetermine(predetermine)){
            return "<script language=\"javascript\">alert('预定成功！');window.location.href='/Predetermine/select.do'</script>";
        }else{
            return "<script language=\"javascript\">alert('预定失败！请稍候再试..');window.location.href='/Predetermine/toadd.do'</script>";
        }
    }

    /**
     * 安排房间
     * @param model
     * @return
     */
    @RequestMapping("/toPredeterRoom.do")
    public String predeterRoom(Predetermine predetermine,Model model){
        Predetermine predetermine1 = predetermineBiz.selectById(predetermine.getPredetermineId());
        Room room = roomBiz.roomById(predetermine1.getRoomID());
        model.addAttribute("room",room);
        model.addAttribute("p",predetermine1);
        model.addAttribute("listGender", attributeDetailsBiz.listByAttributeName(8));
        model.addAttribute("listNation", attributeDetailsBiz.listByAttributeName(9));
        model.addAttribute("listPassengerLevel", attributeDetailsBiz.listByAttributeName(13));
        model.addAttribute("listPapers", attributeDetailsBiz.listByAttributeName(10));
        model.addAttribute("listRentOutType",attributeDetailsBiz.listByAttributeName(5));
        model.addAttribute("listPassengerType",attributeDetailsBiz.listByAttributeName(7));
        model.addAttribute("listBillUnit",attributeDetailsBiz.listByAttributeName(6));
        model.addAttribute("listPayWay",attributeDetailsBiz.listByAttributeName(4));
        model.addAttribute("listReceiveTarget",receiveTargetBiz.listByParam(new ReceiveTarget()));
        model.addAttribute("listCommodity",attributeDetailsBiz.listByAttributeName(3));
        return "perdeterRoom/zhu";
    }

    /**
     * 跳转新增页面
     * @param model
     * @return
     */
    @RequestMapping("/toadd.do")
    public String toAdd(Model model) {
        model.addAttribute("listRoom",roomBiz.selectRoom());
        model.addAttribute("listReceiveTarget",receiveTargetBiz.listByParam(new ReceiveTarget()));
        model.addAttribute("listOne",attributeDetailsBiz.listByAttributeName(4));
        return "predetermine/add";
    }
    @RequestMapping("/selectTarget.do")
    @ResponseBody
    public String selectTarget(String name) {

        return JSON.toJSONString(receiveTargetBiz.selectReceive(name));
    }

    /**
     * 删除
     * @param id
     * @return
     */
    @RequestMapping("/delete.do")
    public String delete(String[] id) {
        for (int i = 0; i <id.length ; i++) {
            Predetermine predetermine1 = predetermineBiz.selectById(Integer.parseInt(id[i]));
            roomBiz.updateState(1,predetermine1.getRoomID());
        }
        predetermineBiz.delete(id);
        return "redirect:select.do";
    }
    @RequestMapping("/select.do")
    public String select(@RequestParam(required = false) Integer leiXin,
                          @ModelAttribute("name")String name,@ModelAttribute("predetermine")Predetermine predetermine,
                         @ModelAttribute("principal")String principal,@ModelAttribute("receiveTarget")ReceiveTarget receiveTarget,
                         Model model,@ModelAttribute("passenger")Passenger passenger,
                          @RequestParam(name = "currentPage", defaultValue = "1") Integer currentPage){
        Pager<Predetermine> pager = new Pager<Predetermine>();
        pager.setPageNo(currentPage);//设置当前页
        pager.setPageSize(5);//设置页面大小
        pager.setParams(predetermine);//设置参数
        if(predetermine.getPredetermineStateID()<=0){
            predetermine.setPredetermineStateID(66);
        }
        predetermine.setReceivePrincipal(principal);//根据员工名字
        predetermine.setPassengerName(name); //根据旅客姓名
        predetermineBiz.list(pager);
        model.addAttribute("listOne",attributeDetailsBiz.listByAttributeName(16));
        model.addAttribute("list",pager);
        model.addAttribute("leiXin",leiXin);
        return "predetermine/list";
    }

    /**
     * 修改客房预定
     * @return
     */
    @RequestMapping("update.do")
    public String update(@ModelAttribute("predetermine")Predetermine predetermine,@ModelAttribute("roomSetPolist")Room roomSetPolist
    ){
        Predetermine predetermine1 = predetermineBiz.selectById(predetermine.getPredetermineId());
        roomBiz.updateState(1,predetermine1.getRoomID());
        predetermine.setRoomID(roomSetPolist.getRoomId());
        predetermineBiz.update(predetermine);
        roomBiz.updateState(4,roomSetPolist.getRoomId());
        return "redirect:select.do";
    }

    /**
     * ajax查询旅客
     *
     * @return
     */
    @RequestMapping("/selectPassenger.do")
    @ResponseBody
    public String selectPassenger(String name) {
        return JSON.toJSONString(predetermineBiz.listByPassenger(name));
    }

    /**
     * ajax查询旅客
     *
     * @return
     */
    @RequestMapping("/selectRoom.do")
    @ResponseBody
    public String selectRoom(String roomNumber) {
        return JSON.toJSONString(roomBiz.queryRoomList(roomNumber));
    }
    /**
     *去 修改客房预定
     * @param model
     * @param id
     * @return
     */
    @RequestMapping("/toupdate.do")
    public String toupdate(Predetermine predetermine, Model model, int id, HttpServletRequest request){
        predetermine.setRoomNumber(request.getParameter("roomNumber"));
        model.addAttribute("listOne",attributeDetailsBiz.listByAttributeName(4));
        model.addAttribute("predetermine",predetermineBiz.selectById(id));//查询预订
        model.addAttribute("roomSetPolist",roomBiz.queryRoom(predetermine.getRoomNumber()));//查询房间
        return "predetermine/update";
    }
}
