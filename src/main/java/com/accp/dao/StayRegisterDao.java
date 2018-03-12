package com.accp.dao;

import com.accp.entity.Pager;
import com.accp.entity.StayRegister;
import com.accp.entity.StayRegisterDetails;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StayRegisterDao {

    /**
     * 删除StayRegisterDetails表有stayRegisterID的列
     * @param stayRegisterID
     * @return
     */
    int deleteStayRegisterDetailsByStayRegisterID(@Param("stayRegisterID") int stayRegisterID);

    /**
     * 按条件动态查询
     * @return
     */
    List<StayRegister> listByParam();

    /**
     * 删除多行
     * @param ids
     * @return
     */
    int deleteStayRegister(String[] ids);

    /**
     * 按参数分页查询
     * @param pager
     * @return
     */
    List<StayRegister> listByPager(Pager<StayRegister> pager);

    /**
     * 查询总行数
     * @param pager
     * @return
     */
    int totalRow(Pager<StayRegister> pager);

    List<StayRegister> listByParam(StayRegister stayRegister);

    int updateByParam(StayRegister stayRegister);

    /**
     * 新增
     * @param stayRegister
     * @return
     */
    int insertStayRegisters(StayRegister stayRegister);

    /**
     * 新增旅客与登记关系
     * @param stayRegisterDetails
     * @return
     */
    int insertStayRegisterDetails(StayRegisterDetails stayRegisterDetails);

}
