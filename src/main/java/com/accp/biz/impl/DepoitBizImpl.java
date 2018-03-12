package com.accp.biz.impl;

import com.accp.biz.DepoitBiz;
import com.accp.dao.DepoitDao;
import com.accp.dao.PassengerDao;
import com.accp.entity.Depoit;
import com.accp.entity.Passenger;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class DepoitBizImpl implements DepoitBiz {
    @Resource
    private DepoitDao depoitDao;

    @Resource
    private PassengerDao passengerDao;

    /**
     * 按Id查询单个押金
     * @param id
     * @return
     */
    public Depoit getDepoit(int id) {
        Depoit depoit=new Depoit();
        depoit.setDepoitId(id);
        List<Depoit> depoitList = depoitDao.listByParam(depoit);
        if(depoitList!=null){
            return depoitList.get(0);
        }
        return null;
    }

    /**
     * 修改押金
     * @param depoit
     * @return
     */
    public boolean updateDepositMoney(Depoit depoit) {
        Depoit depoit1=null;
        List<Depoit> depoitList = depoitDao.listByParam(depoit);
        if(depoitList!=null){
            depoit1= depoitList.get(0);
        }
        depoit.setDepositMoney(depoit1.getDepositMoney()+depoit.getDepositMoney());
        return depoitDao.updateDepositMoney(depoit)>0;
    }

    /**
     * 新增并且返回新增id
     * @param depoit
     * @return
     */
    public int insertDepoit(Depoit depoit) {
        if(depoitDao.insertDepoit(depoit)>0){
            return passengerDao.last_insert_id();
        }
        return -1;
    }
}
