package com.accp.dao;

import com.accp.entity.Pager;
import com.accp.entity.Passenger;
import com.accp.entity.Predetermine;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PredetermineDao {

    /**
     * 新增
     * @param predetermine
     * @return
     */
    int insertPredetermine(Predetermine predetermine);

    /**
     * 修改预定状态
     * @param state
     * @param id
     * @return
     */
    int updateState(@Param("state") int state,@Param("id") int id);

    /**
     * 分页查询&&模糊查询
     * @param pager
     * @return
     */
    List<Predetermine> list(Pager<Predetermine> pager);
    /**
     * 查询总行数
     * @param pager
     * @return
     */
    int totalRow(Pager<Predetermine> pager);

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
