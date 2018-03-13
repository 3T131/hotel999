package com.accp.controller;

import com.accp.biz.AttributeDetailsBiz;
import com.accp.biz.CommodityBiz;
import com.accp.entity.AttributeDetails;
import com.accp.entity.Commodity;
import com.accp.entity.Pager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/Commodity")
public class CommodityController {
    @Resource(name = "commodityBiz")
    private CommodityBiz commodityBiz;

    @Resource
    private AttributeDetailsBiz attributeDetailsBiz;

    /**
     * 按商品名称查询(分页)
     * @param
     * @param model
     * @return
     */
    @RequestMapping("/tolist.do")
    public String commodityList( Model model,
                                @ModelAttribute("commodity") Commodity commodity,
                                @RequestParam(name = "currentPage",defaultValue = "1") Integer currentPage){
        Pager<Commodity> commodityPager=new Pager<Commodity>();
        commodityPager.setPageNo(currentPage);
        commodityPager.setPageSize(5);
        commodityPager.setParams(commodity);
        commodityBiz.listByCommodityNameNew(commodityPager);
        List<AttributeDetails> attributeDetailsList = attributeDetailsBiz.listByAttributeName(3);
        model.addAttribute("listOne",attributeDetailsList);
        model.addAttribute("commodityPager",commodityPager);
        return "commodity/list";
    }

    /**
     * 空跳到新增页面
     * @return
     */
    @RequestMapping("/toadd.do")
    public String commodityAdd(Model model){
        model.addAttribute("listTwo",attributeDetailsBiz.listByAttributeName(3));
        model.addAttribute("listOne",attributeDetailsBiz.listByAttributeName(15));
        return "commodity/add";
    }

    /**
     * 新增商品信息
     * @param commodity
     * @param model
     * @return
     */
    @RequestMapping("/add.do")
    public String commodityNewAdd(Commodity commodity, Model model){
        if (commodityBiz.add(commodity)!=null){
            return "redirect:/Commodity/tolist.do";
        }else {
            model.addAttribute("error","新增失败，请稍后再试...!");
            return "redirect:/Commodity/toadd.do";
        }
    }

    /**
     * 空跳到修改商品信息页面
     * @return
     */
    @RequestMapping("/toupdate.do")
    public String commodityUpdate(Integer commodityId,Model model){
        model.addAttribute("listPo",commodityBiz.getCommodityId(commodityId));
        model.addAttribute("listTwo",attributeDetailsBiz.listByAttributeName(3));
        model.addAttribute("listOne",attributeDetailsBiz.listByAttributeName(15));
        return "commodity/update";
    }

    /**
     * 修改商品信息
     * @param commodity
     * @param model
     * @return
     */
    @RequestMapping("/update.do")
    public String commodityNewUpdate(Commodity commodity, Model model){
        if (commodityBiz.updatenew(commodity)){
            return "redirect:/Commodity/tolist.do";
        }else{
            model.addAttribute("error","修改失败，请稍后再试...!");
            return "redirect:/Commodity/toupdate.do";
        }
    }

    /**
     * 删除商品信息
     * @param commodityId
     * @param model
     * @return
     */
    @RequestMapping("/delete.do")
    public String commodityDelete(String[] commodityId,Model model){
        if (commodityBiz.deleteByCommodityId(commodityId)){
            return "redirect:/Commodity/tolist.do";
        }else {
            model.addAttribute("error","删除商品信息失败!...");
            return "redirect:/Commodity/tolist.do";
        }
    }

    /**
     * 新增商品类别信息
     * @param attributeDetails
     * @param model
     * @return
     */
    @RequestMapping("/newadd.do")
    public String attributeDetails(AttributeDetails attributeDetails, Model model){
        if (attributeDetailsBiz.insert(attributeDetails)!=null){
            return "redirect:/Commodity/tolist.do";
        }else {
            model.addAttribute("error","新增商品类别信息失败!");
            return "redirect:/Commodity/newadd.do";
        }
    }

    /**
     * 删除商品类别信息
     * @param attributedetailsId
     * @param model
     * @return
     */
    @RequestMapping("/newdelete.do")
    public String attributeDetailsdelete(String[] attributedetailsId,Model model){
        if (attributeDetailsBiz.deleteAttributeDetails(attributedetailsId)>0){
            return "redirect:/Commodity/newadd.do";
        }else {
            model.addAttribute("error","删除商品类别信息失败!");
            return "redirect:/Commodity/newadd.do";
        }
    }
}
