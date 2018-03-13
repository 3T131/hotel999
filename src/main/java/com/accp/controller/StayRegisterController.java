package com.accp.controller;

import com.accp.biz.*;
import com.accp.entity.*;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/StayRegister")
public class StayRegisterController {
    @Resource
    private StayRegisterBiz stayRegisterBiz;

    @Resource
    private AttributeDetailsBiz attributeDetailsBiz;

    @Resource
    private DepoitBiz depoitBiz;

    @Resource
    private ConsumptionDetailsBiz consumptionDetailsBiz;

    @Resource
    private PassengerBiz passengerBiz;

    @Resource
    private RoomBiz roomBiz;

    @Resource
    private ReceiveTargetBiz receiveTargetBiz;

    @Resource
    public CommodityBiz commodityBiz;


    /**
     * 新增预定开房
     * @return
     */
    @RequestMapping("/predetermineKaiFang.do")
    @ResponseBody
    public  String predetermineKaiFang(String passengerIdRoomId
            ,String commodityNumber
            ,StayRegister stayRegister){
        int dId = depoitBiz.insertDepoit(stayRegister.getDepoit());
        stayRegister.setDpId(dId);
        Map map = new HashMap();
        if(commodityNumber!=""){
            try {
                map = JSON.parseObject(commodityNumber, Map.class);
            }catch (Exception e){
                System.out.println("格式错误！");
            }
        }
        JSONArray jsonArray=new JSONArray();
        if(passengerIdRoomId!=""){
            try {
                jsonArray = JSON.parseArray(passengerIdRoomId);
            }catch (Exception e){
                System.out.println("格式错误！");
            }
        }
        if(stayRegisterBiz.addPredetermineKaiFang(stayRegister,map,jsonArray)){
            return "<script language=\"javascript\">alert('操作成功！');window.location.href='/Predetermine/select.do'</script>";
        }else{
            return "<script language=\"javascript\">alert('操作失败！请稍候再试..');window.location.href='/Predetermine/select.do'</script>";
        }
    }

    /**
     * 修改
     * @param stayRegister
     * @param passengerIds
     * @return
     */
    @RequestMapping("/modify.do")
    @ResponseBody
    public String modify(StayRegister stayRegister,String[] passengerIds){
        if(this.stayRegisterBiz.modifyStayRegister(stayRegister,passengerIds)){
            return "<script language=\"javascript\">alert('保存成功！');window.location.href='/StayRegister/tolist.do'</script>";
        }else{
            return "<script language=\"javascript\">alert('保存失败！请稍候再试..');window.location.href='/StayRegister/tolist.do?stayRegisterId="+stayRegister.getStayRegisterId()+"'</script>";
        }
    }
    /**
     * 跳转修改页面
     * @param stayRegister
     * @param model
     * @return
     */
    @RequestMapping("/toModify.do")
    public String toModify(StayRegister stayRegister,Model model){
        StayRegister stayRegister1 = this.stayRegisterBiz.getStayRegister(stayRegister);
        model.addAttribute("stayRegister2",stayRegister1);
        model.addAttribute("listRentOutType",attributeDetailsBiz.listByAttributeName(5));
        model.addAttribute("listBillUnit",attributeDetailsBiz.listByAttributeName(6));
        model.addAttribute("listPayWay",attributeDetailsBiz.listByAttributeName(4));
        model.addAttribute("isBillList",attributeDetailsBiz.listByAttributeName(17));
        model.addAttribute("listReceiveTarget",receiveTargetBiz.listByParam(new ReceiveTarget()));
        return "stayregister/modify";
    }

    /**
     * 换房
     * @param stayRegister
     * @return
     */
    @RequestMapping("/confirmChangRoom.do")
    @ResponseBody
    public String confirmChangRoom(StayRegister stayRegister){
        if(this.stayRegisterBiz.confirmChangRoom(stayRegister)){
            return "<script language=\"javascript\">alert('换房成功！');window.location.href='/StayRegister/tolist.do'</script>";
        }else{
            return "<script language=\"javascript\">alert('换房失败！请稍候再试..');window.location.href='/StayRegister/tolist.do'</script>";
        }
    }
    /**
     * ajax加载现有客房
     * @return
     */
    @RequestMapping("/selectAjaxRoom.do")
    @ResponseBody
    public String selectAjaxRoom(Room room){
        room.setRoomStateID(1);
        return JSON.toJSONString(roomBiz.listByParam(room));
    }

    /**
     * 跳转换行页面
     * @param stayRegister
     * @param model
     * @return
     */
    @RequestMapping("/tochangroom.do")
    public String toChangroom(StayRegister stayRegister,Model model){
        StayRegister stayRegister1 = stayRegisterBiz.getStayRegister(stayRegister);
        model.addAttribute("stayRegister",stayRegister1);
        return "stayregister/changroom";
    }

    /**
     * 退房成功
     * @param stayRegister
     * @return
     */
    @RequestMapping("/tuiFang.do")
    @ResponseBody
    public String tuiFang(StayRegister stayRegister){
        if(stayRegisterBiz.tuiFang(stayRegister)){
            return "<script language=\"javascript\">alert('退房成功！');window.location.href='/StayRegister/tolist.do'</script>";
        }else{
            return "<script language=\"javascript\">alert('退房失败！请稍候再试..');window.location.href='/StayRegister/tolist.do'</script>";
        }
    }

    /**
     * 增加消费
     * @param cids
     * @param numbers
     * @param stayRegister
     * @param model
     * @return
     */
    @RequestMapping("/consumption.do")
    public String consumption(String[] cids,String[] numbers,StayRegister stayRegister,Model model){
        consumptionDetailsBiz.addConsumptionDetails(cids,numbers,stayRegister.getStayRegisterId());
        return this.toConsumtion(stayRegister,model);
    }

    /**
     * 删除多行
     * @param ids
     * @param model
     * @return
     */
    @RequestMapping("/delete.do")
    @ResponseBody
    public String delete(String [] ids,Model model){
        if(stayRegisterBiz.deleteStayRegister(ids)){
            return "<script language=\"javascript\">alert('删除成功！');window.location.href='/StayRegister/tolist.do'</script>";
        }else{
            return "<script language=\"javascript\">alert('删除失败！请稍候再试..');window.location.href='/StayRegister/tolist.do'</script>";
        }
    }

    /**
     * 登记开房
     * @param passengerIdRoomId
     * @param commodityNumber
     * @param stayRegister
     * @param model
     * @return
     */
    @RequestMapping("/kaifang.do")
    @ResponseBody
    public String toArrangeRoom(String passengerIdRoomId
            ,String commodityNumber
            ,StayRegister stayRegister,Model model){
        int dId = depoitBiz.insertDepoit(stayRegister.getDepoit());
        stayRegister.setDpId(dId);
        Map map = new HashMap();
        if(commodityNumber!=""){
            try {
                map = JSON.parseObject(commodityNumber, Map.class);
            }catch (Exception e){
                System.out.println("格式错误！");
            }
        }
        JSONArray jsonArray=new JSONArray();
        if(passengerIdRoomId!=""){
            try {
                jsonArray = JSON.parseArray(passengerIdRoomId);
            }catch (Exception e){
                System.out.println("格式错误！");
            }
        }
        if(stayRegisterBiz.insertStayRegisters(stayRegister,map,jsonArray)){
            return "<script language=\"javascript\">alert('操作成功！');window.location.href='/StayRegister/tolist.do'</script>";
        }else{
            return "<script language=\"javascript\">alert('操作失败！请稍候再试..');window.location.href='/StayRegister/toStay.do'</script>";
        }
    }


    /**
     * ajax添加商品
     * @param ids
     * @return
     */
    @RequestMapping("/consumptionByIds.do")
    @ResponseBody
    public String consumptionByIds(String[] ids){
        List<Commodity> commodityList = commodityBiz.listByIds(ids);
        String s = JSON.toJSONString(commodityList);
        return s;
    }

    /**
     * ajax查询商品动态查询
     * @param commodity
     * @return
     */
    @RequestMapping("/tianJiaShangPin.do")
    @ResponseBody
    public String tianJiaShangPin(Commodity commodity){
        List<Commodity> commodityList = commodityBiz.listByParam(commodity);
        return JSON.toJSONString(commodityList);
    }

    /**
     * 用id集合查询房屋集合
     * @param roomIds
     * @return
     */
    @RequestMapping("/confirmRoom.do")
    @ResponseBody
    public String confirmRoom(String[] roomIds){
        List<Room> roomList = roomBiz.listByIds(roomIds);
        return JSON.toJSONString(roomList);
    }

    /**
     * 查询房屋按状态查询
     * @param room
     * @return
     */
    @RequestMapping("/guestRoomLevelSelectRoom.do")
    @ResponseBody
    public String guestRoomLevelSelectRoom(Room room){
        List<Room> roomList = roomBiz.listByParam(room);
        return JSON.toJSONString(roomList);
    }

    /**
     * 查询，分页查询
     * @param model
     * @param stayRegister
     * @param currentPage
     * @return
     */
    @RequestMapping("/tolist.do")
    public String list(Model model
                     , @ModelAttribute("stayRegister") StayRegister stayRegister
                ,@RequestParam(name = "currentPage",defaultValue = "1")Integer currentPage
                ){
        Pager<StayRegister> pager=new Pager<StayRegister>();//创建分页对象
        pager.setPageNo(currentPage);//设置当前页
        pager.setPageSize(10);//设置页面大小
        //设置查询条件
        if(stayRegister.getLvKeLeiXingId()==null){
            stayRegister.setLvKeLeiXingId(55);
        }
        if(stayRegister.getIsBillID()==null){
            stayRegister.setIsBillID(68);
        }
        pager.setParams(stayRegister);//设置参数
        stayRegisterBiz.listByPager(pager);//调用biz的方法
        List<AttributeDetails> attributeDetailsList = attributeDetailsBiz.listByAttributeName(17);
        model.addAttribute("listOne",attributeDetailsList);
        model.addAttribute("pager",pager);
        return "stayregister/list";
    }

    /**
     * 跳转结账页面
     * @param stayRegister
     * @param model
     * @return
     */
    @RequestMapping("/topay.do")
    public String pay(StayRegister stayRegister,Model model){
        StayRegister stayRegister2 = stayRegisterBiz.getStayRegister(stayRegister);
        List<AttributeDetails> attributeDetailsList = attributeDetailsBiz.listByAttributeName(4);
        model.addAttribute("listOne",attributeDetailsList);
        model.addAttribute("timestamp",new Date());
        model.addAttribute("stayRegister2",stayRegister2);
        return "stayregister/pay";
    }

    /**
     * 结账
     * @param stayRegister
     * @param model
     * @return
     */
    @RequestMapping("/pay.do")
    public String payDo(StayRegister stayRegister,Model model){
        StayRegister stayRegister2 = stayRegisterBiz.getStayRegister(stayRegister);
        stayRegister2.setRemarks(stayRegister.getRemarks());
        stayRegister2.setPayTime(stayRegister.getPayTime());
        stayRegister2.setPayWayID(stayRegister.getPayWayID());
        stayRegister2.setRoomID(stayRegister.getRoomID());
        if(this.stayRegisterBiz.updateIsBill(stayRegister2)){
            return "redirect:/StayRegister/tolist.do";
        }else{
            model.addAttribute("error","结账失败");
            return "stayregister/pay";
        }
    }
    /**
     * 住宿登记
     * @param model
     * @return
     */
    @RequestMapping("/toStay.do")
    public String toDengji(Model model){
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
        return "dengji/dengji";
    }

    /**
     * 登记旅客
     * @param passenger
     * @param model
     * @return
     */
    @RequestMapping("/register.do")
    @ResponseBody
    public String register(Passenger passenger,Model model){
        passengerBiz.add(passenger);
        int i = passengerBiz.last_insert_id();
        Passenger passenger1 = passengerBiz.queryPassengerId(i);
        return JSON.toJSONString(passenger1);
    }

    /**
     * 查询所有旅客
     * @param passenger
     * @param model
     * @return
     */
    @RequestMapping("/selectPassenger.do")
    @ResponseBody
    public String selectPassenger(Passenger passenger,Model model){
        Pager<Passenger> pager=new Pager<Passenger>();
        pager.setPageNo(1);//设置当前页
        pager.setPageSize(20);//设置页面大小
        pager.setParams(passenger);//设置参数
        passengerBiz.listPage(pager);
        List<Passenger> datas = pager.getDatas();
        return JSON.toJSONString(datas);
    }

    /**
     * 得到选中的旅客
     * @param ids
     * @return
     */
    @RequestMapping("/confirmPassenger.do")
    @ResponseBody
    public String confirmPassenger(String ids[]){
        List<Passenger> passengerList = passengerBiz.listByIds(ids);
        return JSON.toJSONString(passengerList);
    }
    /**
     * 旅客消费
     * @param stayRegister
     * @param model
     * @return
     */
    @RequestMapping("/toconsumption.do")
    public String toConsumtion(StayRegister stayRegister,Model model){

        List<ConsumptionDetails> consumptionDetailsList = consumptionDetailsBiz.listByStayRegister(stayRegister.getStayRegisterId());
        model.addAttribute("stayRegister",stayRegisterBiz.getStayRegister(stayRegister));
        model.addAttribute("listCommodity",attributeDetailsBiz.listByAttributeName(3));
        model.addAttribute("consumptionDetailsList",consumptionDetailsList);
        return "stayregister/consumption";
    }

    /**
     * 删除商品
     * @param id
     * @param consumptionStayRegisterID
     * @param model
     * @return
     */
    @RequestMapping("/consumptionDelete.do")
    public String consumptionDelete(String[] id,int consumptionStayRegisterID,Model model){
        consumptionDetailsBiz.deleteByIds(id);
        StayRegister stayRegister=new StayRegister();
        stayRegister.setStayRegisterId(consumptionStayRegisterID);
        return toConsumtion(stayRegisterBiz.getStayRegister(stayRegister),model);
    }
    /**
     * 押金
     * @return
     */
    @RequestMapping("/todeposit.do")
    public String toDeposit( StayRegister stayRegister,Model model){
        StayRegister stayRegister2 = new StayRegister();
        stayRegister2.setStayRegisterId(stayRegister.getStayRegisterId());
        StayRegister stayRegister1 = stayRegisterBiz.getStayRegister(stayRegister2);
        Depoit depoit = depoitBiz.getDepoit(stayRegister.getDpId());
        model.addAttribute("depoit",depoit);
        model.addAttribute("stayRegister",stayRegister1);
        return "stayregister/deposit";
    }

    /**
     * 追加押金
     * @param depoit
     * @return
     */
    @RequestMapping("/deposit.do")
    @ResponseBody
    public String doDepoit(Depoit depoit){
        if(depoitBiz.updateDepositMoney(depoit)){
            Depoit depoit2 = depoitBiz.getDepoit(depoit.getDepoitId());
            return "{\"success\":\""+depoit2.getDepositMoney()+"\"}";
        }else{
            return "{\"success\":\"false\"}";
        }
    }



}
