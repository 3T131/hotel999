package com.accp.biz.impl;

import com.accp.biz.ConsumptionDetailsBiz;
import com.accp.dao.CommodityDao;
import com.accp.dao.ConsumptionDetailsDao;
import com.accp.entity.Commodity;
import com.accp.entity.ConsumptionDetails;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ConsumptionDetailsBizImpl implements ConsumptionDetailsBiz {

    @Resource
    private ConsumptionDetailsDao consumptionDetailsDao;

    @Resource
    private CommodityDao commodityDao;


    /**
     * 新增多行消费
     * @param cid
     * @param numbers
     * @param stayRegisterId
     * @return
     */
    public boolean addConsumptionDetails(String[] cid, String[] numbers, int stayRegisterId) {
        int error=0;
        for (int i = 0; i <cid.length ; i++) {
            Commodity commodity = commodityDao.getId(Integer.parseInt(cid[i]));
            Float total=commodity.getSalePrice()*Integer.parseInt(numbers[i]);
            ConsumptionDetails consumptionDetails=new ConsumptionDetails();
            consumptionDetails.setStayRegisterID(stayRegisterId);
            consumptionDetails.setConsumptionMoney(total);
            consumptionDetails.setcID(Integer.parseInt(cid[i]));
            consumptionDetails.setConsumptionNumber(Integer.parseInt(numbers[i]));
            error=consumptionDetailsDao.insertConsumptionDetails(consumptionDetails);
        }
        if(error>0){
            return true;
        }
        return false;
    }

    /**
     * 新增一个消费
     * @param consumptionDetails
     * @return
     */
    public boolean insertConsumptionDetails(ConsumptionDetails consumptionDetails) {
        return consumptionDetailsDao.insertConsumptionDetails(consumptionDetails)>0;
    }

    /**
     * 按stayRegisterId查询
     * @param stayRegisterId
     * @return
     */
    public List<ConsumptionDetails> listByStayRegister(int stayRegisterId) {
        ConsumptionDetails consumptionDetails=new ConsumptionDetails();
        consumptionDetails.setStayRegisterID(stayRegisterId);
         return consumptionDetailsDao.listByParam(consumptionDetails);
    }

    /**
     * 删除多项
     * @param ids
     * @return
     */
    public boolean deleteByIds(String[] ids) {
        return consumptionDetailsDao.deleteByIds(ids)>0;
    }
}
