package com.accp.biz;

import com.accp.entity.Pager;
import com.accp.entity.StayRegister;
import com.alibaba.fastjson.JSONArray;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

public interface StayRegisterBiz {

    /**
     * 统计数据
     * @param min
     * @param max
     * @return
     */
    public List<StayRegister> selectShuJuTongJi(Timestamp min, Timestamp max);

    /**
     * 新增预定开房
     * @return
     */
    boolean addPredetermineKaiFang(StayRegister stayRegister, Map map, JSONArray jsonArray);

    /**
     * 修改单条住宿登记
     * @param stayRegister
     * @param pId
     * @return
     */
    boolean modifyStayRegister(StayRegister stayRegister,String[] pId);

    /**
     * 换房
     * @param stayRegister
     * @return
     */
    boolean confirmChangRoom(StayRegister stayRegister);

    /**
     * 退房
     * @param stayRegister
     * @return
     */
    boolean tuiFang(StayRegister stayRegister);

    /**
     * 删除多行
     * @param ids
     * @return
     */
    boolean deleteStayRegister(String[] ids);

    /**
     * 新增开房记录（新增多条）
     * @param stayRegister
     * @param map 商品k 数量v
     * @param jsonArray 房间k对应旅客v
     * @return
     */
    boolean insertStayRegisters(StayRegister stayRegister, Map map, JSONArray jsonArray);

    void listByPager(Pager<StayRegister> pager);

    StayRegister getStayRegister(StayRegister stayRegister);

    boolean updateIsBill(StayRegister stayRegister);
}
