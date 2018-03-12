package com.accp.biz.impl;

import com.accp.biz.PassengerBiz;
import com.accp.dao.PassengerDao;
import com.accp.entity.Pager;
import com.accp.entity.Passenger;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class PassengerBizImpl implements PassengerBiz {
    @Resource
    private PassengerDao passengerDao;

    public List<Passenger> listByIds(String[] ids) {
        if(ids!=null&&ids.length>0){
            return passengerDao.listByIds(ids);
        }
        return null;
    }

    public int last_insert_id() {
        return passengerDao.last_insert_id();
    }

    /**
     * 删除旅客
     * @param pId
     * @return
     */
    public int delete(String[] pId) {
        return passengerDao.delete(pId);
    }

    /**
     * 查询需要修改的旅客
     * @param pId
     * @return
     */
    public Passenger queryPassengerId(int pId) {
        return passengerDao.queryPassengerId(pId);
    }

    /**
     * 修改旅客
     * @param passenger
     * @return
     */
    public Integer update(Passenger passenger) {
        return passengerDao.update(passenger);
    }

    /**
     * 新增旅客
     * @param passenger
     * @return
     */
    public int add(Passenger passenger) {
        return passengerDao.add(passenger);
    }

    /**
     * 分页查询$$模糊查询
     * @param pager
     */
    public void listPage(Pager<Passenger> pager) {
        pager.setTotalRows(passengerDao.totalRow(pager));//总行数
        pager.setDatas(passengerDao.listPage(pager));//结果集
    }


}
