package com.accp.dao;

import com.accp.entity.ConsumptionDetails;

import java.util.List;

public interface ConsumptionDetailsDao {

    /**
     * 新增
     * @param consumptionDetails
     * @return
     */
    int insertConsumptionDetails(ConsumptionDetails consumptionDetails);
    /**
     * 按条件查询
     * @param consumptionDetails
     * @return
     */
    List<ConsumptionDetails> listByParam(ConsumptionDetails consumptionDetails);

    /**
     * 删除多项
     * @param ids
     * @return
     */
    int deleteByIds(String[] ids);

}
