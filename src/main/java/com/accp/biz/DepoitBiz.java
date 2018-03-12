package com.accp.biz;

import com.accp.entity.Depoit;

public interface DepoitBiz {

    Depoit getDepoit(int id);

    boolean updateDepositMoney(Depoit depoit);

    /**
     * 新增
     * @param depoit
     * @return
     */
    int insertDepoit(Depoit depoit);

}
