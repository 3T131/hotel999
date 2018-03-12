package com.accp.biz.impl;

import com.accp.biz.StatisticalBiz;
import com.accp.dao.StatisticalDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class StatisticalBizImpl implements StatisticalBiz {

    @Resource
    private StatisticalDao statisticalDao;

    public Float statisticalSumConst() {
        return statisticalDao.statisticalSumConst();
    }

    public Float statisticalConsumptionMoney() {
        return statisticalDao.statisticalConsumptionMoney();
    }

    public int statisticalPassenger() {
        return statisticalDao.statisticalPassenger();
    }

    public int statisticalStayregister() {
        return statisticalDao.statisticalStayregister();
    }
}
