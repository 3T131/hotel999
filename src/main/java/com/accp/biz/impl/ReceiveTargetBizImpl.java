package com.accp.biz.impl;

import com.accp.biz.ReceiveTargetBiz;
import com.accp.dao.ReceiveTargetDao;
import com.accp.entity.Pager;
import com.accp.entity.ReceiveTarget;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class ReceiveTargetBizImpl implements ReceiveTargetBiz {
    @Resource
    private ReceiveTargetDao receiveTargetDao;

    public ReceiveTarget selectLogin(ReceiveTarget receiveTarget) {
        return receiveTargetDao.selectLogin(receiveTarget);
    }

    public List<ReceiveTarget> listByParam(ReceiveTarget receiveTarget) {
        return receiveTargetDao.listByParam(receiveTarget);
    }
    /**
     * 分页
     * @param pager
     */
    public void list(Pager<ReceiveTarget> pager) {
        pager.setTotalRows(receiveTargetDao.totalRow(pager));//总行数
        pager.setDatas(receiveTargetDao.list(pager));//结果集
    }

    /**
     * 新增接待对象
     * @param receiveTarget
     * @return
     */
    public int insertReceiveTarget(ReceiveTarget receiveTarget) {
        return receiveTargetDao.insertReceiveTarget(receiveTarget);
    }

    /**
     * 删除接待对象
     * @param id
     * @return
     */
    public int deleteReceiveTarget(String[] id) {
        return receiveTargetDao.deleteReceiveTarget(id);
    }

    /**
     * 根据id查询单个对象
     * @param receivetargetId
     * @return
     */
    public ReceiveTarget queryByid(int receivetargetId) {
        return receiveTargetDao.queryByid(receivetargetId);
    }

    /**
     * 更改接待对象信息
     * @param receiveTarget
     * @return
     */
    public int updateReceiveTarget(ReceiveTarget receiveTarget) {
        return receiveTargetDao.updateReceiveTarget(receiveTarget);
    }

    public List<ReceiveTarget> selectReceive(String principal) {
        return receiveTargetDao.selectReceive(principal);
    }

    public ReceiveTarget selectReceiveByid(int id) {
        return receiveTargetDao.selectReceiveByid(id);
    }
}
