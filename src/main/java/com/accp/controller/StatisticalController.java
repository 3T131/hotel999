package com.accp.controller;

import com.accp.biz.StatisticalBiz;
import com.accp.biz.StayRegisterBiz;
import com.accp.entity.Pager;
import com.accp.entity.StayRegister;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import javax.annotation.Resource;
import java.util.Date;


@Controller
@RequestMapping("/FinancialStatistics")
public class StatisticalController {

    @Resource
    private StatisticalBiz statisticalBiz;

    @Resource
    private StayRegisterBiz stayRegisterBiz;

    @RequestMapping("/toinformation.do")
    public String toInformation(StayRegister stayRegister,Model model){
        model.addAttribute("stayRegister",stayRegisterBiz.getStayRegister(stayRegister));
        return "financialstatistics/particulars";
    }

    /**
     * 查看统计列表
     * @param model
     * @param currentPage
     * @param min
     * @param max
     * @return
     */
    @RequestMapping("/tolist")
    public String financialStatistics(Model model
            , @RequestParam(name = "currentPage",defaultValue = "1")Integer currentPage
            ,@RequestParam(name = "datemin",required = false)Date min
            , @RequestParam(name = "datemax",required = false)Date max){
        Float xiaoFeiJinE = statisticalBiz.statisticalConsumptionMoney();
        Float JieZhangJinE = statisticalBiz.statisticalSumConst();
        int zhuSuRenShu = statisticalBiz.statisticalPassenger();
        int chuZuFangJianShu = statisticalBiz.statisticalStayregister();
        model.addAttribute("xiaoFeiJinE",xiaoFeiJinE);
        model.addAttribute("JieZhangJinE",JieZhangJinE);
        model.addAttribute("zhuSuRenShu",zhuSuRenShu);
        model.addAttribute("chuZuFangJianShu",chuZuFangJianShu);

        Pager<StayRegister> pager=new Pager<StayRegister>();//创建分页对象
        pager.setPageNo(currentPage);//设置当前页
        pager.setPageSize(20);//设置页面大小
        StayRegister stayRegister = new StayRegister();
        if(max!=null){
            stayRegister.setDateMax(max);
        }
        if(min!=null){
            stayRegister.setDateMin(min);
        }
        pager.setParams(stayRegister);
        stayRegisterBiz.listByPager(pager);//调用biz的方法
        model.addAttribute("pager",pager);
        model.addAttribute("datemin",min);
        model.addAttribute("datemax",max);
        return "financialstatistics/financialstatistics";
    }

}
