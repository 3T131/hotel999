package com.accp.biz;

public interface StatisticalBiz {


    /**
     * 统计结账金额总计
     *
     * @return
     */
    Float statisticalSumConst();

    /**
     * 统计消费金额总计
     *
     * @return
     */
    Float statisticalConsumptionMoney();

    /**
     * 统计住宿人数
     *
     * @return
     */
    int statisticalPassenger();

    /**
     * 统计出租房间数
     * @return
     */
    int statisticalStayregister();
}
