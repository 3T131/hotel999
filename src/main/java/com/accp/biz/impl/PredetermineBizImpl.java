package com.accp.biz.impl;

import com.accp.biz.PredetermineBiz;
import com.accp.dao.PredetermineDao;
import com.accp.dao.RoomDao;
import com.accp.entity.Pager;
import com.accp.entity.Passenger;
import com.accp.entity.Predetermine;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class PredetermineBizImpl implements PredetermineBiz {
    @Resource
    private PredetermineDao predetermineDao;

    @Resource
    private RoomDao roomDao;

    /**
     * 新增
     * @param predetermine
     * @return
     */
    public boolean insertPredetermine(Predetermine predetermine) {
        roomDao.updateState(4,predetermine.getRoomID());
        return predetermineDao.insertPredetermine(predetermine)>0;
    }

    /**
     * 分页查询&&根据房间号查询
     * @param pager
     */
    public void list(Pager<Predetermine> pager) {
        pager.setTotalRows(predetermineDao.totalRow(pager));//总行数

        pager.setDatas(predetermineDao.list(pager));//结果集
    }
    /**
     * ajax查询旅客信息
     * @param principal
     * @return
     */
    public List<Passenger> listByPassenger(String principal) {
        return predetermineDao.listByPassenger(principal);
    }

    public int delete(String[] id) {
        return predetermineDao.delete(id);
    }
    /**
     * 查询单条信息，修改用
     * @param predetermineId
     * @return
     */
    public Predetermine selectById(int predetermineId) {
        return predetermineDao.selectById(predetermineId);
    }

    public int update(Predetermine predetermine) {
        return predetermineDao.update(predetermine);
    }


}
