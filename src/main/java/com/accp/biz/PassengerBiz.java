package com.accp.biz;

import com.accp.entity.AttributeDetails;
import com.accp.entity.Pager;
import com.accp.entity.Passenger;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PassengerBiz {

    /**
     * 按id数组查询旅客(zeliang)
     * @param ids
     * @return
     */
    List<Passenger> listByIds( String[] ids);

    /**
     * 得到最新insert的一行数据的自动增长
     * @return
     */
    int last_insert_id();

    /**
     *  删除旅客
     * @param pId
     * @return
     */
    int delete(String[] pId);


    /**
     * 根据ID查询旅客
     * @param pId
     * @return
     */
    Passenger queryPassengerId(@Param("pId") int pId);

    /**
     * 修改旅客
     * @param passenger
     * @return
     */
    Integer update(Passenger passenger);
    /**
     * 新增旅客
     * @param passenger
     * @return
     */
    int add(Passenger passenger);

    /**
     * 分页查询$$模糊查询
     * @param pager
     */
    void listPage(Pager<Passenger> pager);
}
