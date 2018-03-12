package com.accp.dao;

import com.accp.entity.Pager;
import com.accp.entity.ReceiveTarget;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReceiveTargetDao {

    /**
     * 登录
     * @param receiveTarget
     * @return
     */
    ReceiveTarget selectLogin(ReceiveTarget receiveTarget);

    /**
     * 动态查询所有
     * @param receiveTarget
     * @return
     */
    List<ReceiveTarget> listByParam(ReceiveTarget receiveTarget);
    /**
     * 分页查询&&模糊查询
     * @param pager
     * @return
     */
    List<ReceiveTarget> list(Pager<ReceiveTarget> pager);
    /**
     * 查询总行数
     * @param pager
     * @return
     */
    int totalRow(Pager<ReceiveTarget> pager);

    /**
     * 增加
     * @param receiveTarget
     * @return
     */
    int insertReceiveTarget(ReceiveTarget receiveTarget);

    /**
     * 删除
     * @param id
     * @return
     */
    int deleteReceiveTarget(String[] id);

    /**
     * 根据id查询
     * @param receivetargetId
     * @return
     */
    ReceiveTarget queryByid(@Param("receiveTargetId") int receivetargetId);

    /**
     * 修改
     * @param receiveTarget
     * @return
     */
    int updateReceiveTarget(ReceiveTarget receiveTarget);
    /**
     * ajax查询
     */
    List<ReceiveTarget> selectReceive(@Param("principal") String principal);

    /**
     * 根据id查询列表
     * @param id
     * @return
     */
    ReceiveTarget selectReceiveByid(@Param("receiveTargetId") int id);

}
