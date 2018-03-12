package com.accp.dao;

import com.accp.entity.Depoit;

import java.util.List;

public interface DepoitDao {

    /**
     * 按参数查询
     * @param depoit
     * @return
     */
    List<Depoit> listByParam(Depoit depoit);

    /**
     * 修改押金金额
     * @param depoit
     * @return
     */
    int updateDepositMoney(Depoit depoit);

    /**
     * 新增
     * @param depoit
     * @return
     */
    int insertDepoit(Depoit depoit);
}
