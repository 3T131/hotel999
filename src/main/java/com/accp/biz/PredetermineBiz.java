package com.accp.biz;

import com.accp.entity.Pager;
import com.accp.entity.Passenger;
import com.accp.entity.Predetermine;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PredetermineBiz {

    /**
     * 新增
     * @param predetermine
     * @return
     */
    boolean insertPredetermine(Predetermine predetermine);
    /**
     * 分页查询&&模糊查询
     * @param pager
     * @return
     */
    void list(Pager<Predetermine> pager);
    /**
     * ajax查询旅客信息
     * @param name
     * @return
     */
    List<Passenger> listByPassenger(@Param("name") String name);
    /**
     * 删除
     * @param id
     * @return
     */
    int delete(String[] id);
    /**
     * 查询单条信息，修改用
     * @param predetermineId
     * @return
     */
    Predetermine selectById(@Param("predetermineId") int predetermineId);
    /**
     * 修改
     * @param predetermine
     * @return
     */
    int update(Predetermine predetermine);

}
