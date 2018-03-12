package com.accp.controller;

import com.accp.biz.AttributeDetailsBiz;
import com.accp.biz.RoomBiz;
import com.accp.entity.Pager;
import com.accp.entity.Room;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

@Controller
@RequestMapping("/RoomSet")
public class RoomController {
    @Resource
    private RoomBiz roomBiz;
    @Resource
    private AttributeDetailsBiz attributeDetailsBiz;

    /**
     * 分页查询&&模糊查询
     * @param roomNumber
     * @param model
     * @param room
     * @param currentPage
     * @return
     */
    @RequestMapping("/tolist.do")
    public String list(@ModelAttribute("roomNumber") String roomNumber,
                       Model model,
                       @ModelAttribute("room")Room room,
                       @RequestParam(name = "currentPage",defaultValue = "1")Integer currentPage){
        Pager<Room> pager=new Pager<Room>();
        pager.setPageNo(currentPage);
        pager.setPageSize(5);
        pager.setParams(room);
        room.setRoomNumber(roomNumber);
        roomBiz.listPage(pager);
        model.addAttribute("list",pager);
        model.addAttribute("room", room);
        return "roomset/roomset";
    }

    /**
     * 进入增加客房页面
     * @param model
     * @return
     */
    @RequestMapping("/toadd.do")
    public  String toAdd(Model model){
            model.addAttribute("listTwo",attributeDetailsBiz.listByAttributeName(1));
            model.addAttribute("listOne",attributeDetailsBiz.listByAttributeName(2));
        return "roomset/add";
    }

    /**
     * 增加客房并重定向到客房查询
     * @param room
     * @return
     */
    @RequestMapping("/add.do")
    public String add(@ModelAttribute("room")Room room) {
            roomBiz.insertRoom(room);
        return "redirect:tolist.do";
    }

    /**
     * 删除客房
     * @param id
     * @return
     */
    @RequestMapping("/delete.do")
    public String delete(String[] id){
        roomBiz.deleteRoom(id);
        return "redirect:tolist.do";
    }

    /**
     * 根据id查询客房信息
     * @param model
     * @param id
     * @return
     */
    @RequestMapping("/toupdate.do")
    public String toUpdate(Model model, int id){
        Room room = roomBiz.roomById(id);
        model.addAttribute("listPo",room);
        model.addAttribute("listTwo",attributeDetailsBiz.listByAttributeName(1));
        model.addAttribute("listOne",attributeDetailsBiz.listByAttributeName(2));
        return "roomset/update";
    }
    /**
     * 修改客房信息并重定向到查询客房页面
     * @return
     */
    @RequestMapping("/update.do")
    public String updateRoom(Room room){
        roomBiz.updateRoom(room);
        return "redirect:tolist.do";
    }
}
