package com.accp.biz.impl;

import com.accp.biz.StayRegisterBiz;
import com.accp.dao.*;
import com.accp.entity.*;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.util.*;

@Service
public class StayRegisterBizImpl implements StayRegisterBiz {

    @Resource
    private StayRegisterDao stayRegisterDao;

    @Resource
    private RoomDao roomDao;

    @Resource
    private PassengerDao passengerDao;

    @Resource
    private CommodityDao commodityDao;

    @Resource
    private ConsumptionDetailsDao consumptionDetailsDao;

    @Resource
    private DepoitDao depoitDao;

    @Resource
    private PredetermineDao predetermineDao;

    public List<StayRegister> selectShuJuTongJi(Timestamp min, Timestamp max) {
        return this.stayRegisterDao.selectShuJuTongJi(min, max);
    }

    /**
     * 新增预定开房
     * @return
     */
    public boolean addPredetermineKaiFang(StayRegister stayRegister, Map map, JSONArray jsonArray) {
        //改变预定客房的状态
        Predetermine predetermine = predetermineDao.selectById(stayRegister.getPredetermineID());
        roomDao.updateState(1,predetermine.getRoomID());
        predetermineDao.updateState(67,predetermine.getPredetermineId());
        return this.insertStayRegisters(stayRegister,map,jsonArray);
    }
    /**
     * 修改单条住宿登记
     * @param stayRegister
     * @param pId
     * @return
     */
    public boolean modifyStayRegister(StayRegister stayRegister, String[] pId) {
        int error=0;
        StayRegister stayRegister1 = this.getStayRegister(stayRegister);
        if(pId.length>1){
            stayRegister1.setLvKeLeiXingId(56);
        }
        //删除StayRegisterDetails表有stayRegisterID的列
        error=stayRegisterDao.deleteStayRegisterDetailsByStayRegisterID(stayRegister.getStayRegisterId());
        //循环新增StayRegisterDetails的新的旅客
        for (int i = 0; i <pId.length ; i++) {
            StayRegisterDetails stayRegisterDetails=new StayRegisterDetails(stayRegister.getStayRegisterId(),Integer.parseInt(pId[i]));
            error=stayRegisterDao.insertStayRegisterDetails(stayRegisterDetails);
        }
        //修改押金
        Depoit depoit=stayRegister1.getDepoit();
        depoit.setDepositMoney(stayRegister.getDepoit().getDepositMoney());
        error=depoitDao.updateDepositMoney(depoit);
        //修改住房记录
        stayRegister1.setSumConst(stayRegister.getSumConst());
        stayRegister1.setChangRoomMoney(stayRegister.getChangRoomMoney());
        stayRegister1.setChangRoomTime(stayRegister.getChangRoomTime());
        stayRegister1.setChangingRoomNumber(stayRegister.getChangingRoomNumber());
        stayRegister1.setIsBillID(stayRegister.getIsBillID());
        if(stayRegister.getPayTime()!=null){
            stayRegister1.setPayTime(stayRegister.getPayTime());
        }
        stayRegister1.setPayWayID(stayRegister.getPayWayID());
        stayRegister1.setRemarks(stayRegister.getRemarks());
        stayRegister1.setBillUnitID(stayRegister.getBillUnitID());
        stayRegister1.setReceiveTargetID(stayRegister.getReceiveTargetID());
        stayRegister1.setRentOutTypeID(stayRegister.getRentOutTypeID());
        error=stayRegisterDao.updateByParam(stayRegister1);
        if(error>0){
            return true;
        }
        return false;
    }

    /**
     * 换房
     * @param stayRegister
     * @return
     */
    public boolean confirmChangRoom(StayRegister stayRegister) {
        int error=0;
        StayRegister stayRegister1=new StayRegister();
        stayRegister1.setStayRegisterId(stayRegister.getStayRegisterId());
        StayRegister stayRegister2 = this.getStayRegister(stayRegister1);
        int yuan=stayRegister2.getRoomID();
        //判断几次换房
        if(stayRegister2.getChangingRoomNumber()!=null&&stayRegister2.getChangingRoomNumber()>0){
            stayRegister2.setChangingRoomNumber(stayRegister2.getChangingRoomNumber()+1);
        }else{
            stayRegister2.setChangingRoomNumber(1);
        }
        stayRegister2.setSumConst(stayRegister2.getSumConst()+stayRegister.getChangRoomMoney());
        stayRegister2.setRoomID(stayRegister.getRoomID());
        stayRegister2.setChangRoomTime(new Date());
        stayRegister2.setChangRoomMoney(stayRegister.getChangRoomMoney());
        //修改住房记录
        error=stayRegisterDao.updateByParam(stayRegister2);
        //修改房间状态
        error=roomDao.updateState(1,yuan);
        error=roomDao.updateState(65,stayRegister.getRoomID());
        if(error>0){
            return true;
        }
        return false;
    }

    /**
     * 退房
     * @param stayRegister
     * @return
     */
    public boolean tuiFang(StayRegister stayRegister) {
        int error=0;
        StayRegister stayRegister2 = this.getStayRegister(stayRegister);
        stayRegister2.setPayTime(new Date());
        stayRegister2.setIsBillID(69);
        //修改住房记录
        error=stayRegisterDao.updateByParam(stayRegister2);
        //修改房间状态
        error=roomDao.updateState(1,stayRegister2.getRoomID());
        if(error>0){
            return true;
        }
        return false;
    }

    /**
     * 删除多行
     * @param ids
     * @return
     */
    public boolean deleteStayRegister(String[] ids) {
        return stayRegisterDao.deleteStayRegister(ids)>0;
    }

    /**
     * 新增开房记录（新增多条）
     * @param stayRegister
     * @param map 商品k 数量v
     * @param jsonArray 房间k对应旅客v
     * @return
     */
    public boolean insertStayRegisters(StayRegister stayRegister, Map map, JSONArray jsonArray) {
        int error=-1;//错误
        int sid=0;//最后一个登记id,用于新增消费记录
        int gPid=0;//共用的旅客id
        //循环得到一个旅客id
        for (int i = 0; i <jsonArray.size() ; i++) {
            JSONObject jsonObject=jsonArray.getJSONObject(i);
            Map<String, Object> rp = jsonObject.getInnerMap();
            Iterator<Map.Entry<String, Object>> entries = rp.entrySet().iterator();
            while (entries.hasNext()) {
                Map.Entry<String, Object> entry = entries.next();
                JSONArray array= (JSONArray)entry.getValue();
                if(array!=null&&array.size()>0){
                    gPid = Integer.parseInt((String)array.get(0));
                    break;
                }
            }

        }
        //循环新增住房记录
        for (int i = 0; i <jsonArray.size() ; i++) {
            JSONObject jsonObject=jsonArray.getJSONObject(i);
            Map<String, Object> rp = jsonObject.getInnerMap();
            Iterator<Map.Entry<String, Object>> entries = rp.entrySet().iterator();
            while (entries.hasNext()) {
                Map.Entry<String, Object> entry = entries.next();
                int roomId=Integer.parseInt(entry.getKey());
                Room room = roomDao.roomById(roomId);
                Float total=0f;
                //判断出租方式得到房价
                if(stayRegister.getRentOutTypeID()==26){
                    total=room.getStandardPriceDay()*stayRegister.getStayNumber();
                }else if(stayRegister.getRentOutTypeID()==25){
                    total=room.getStandardPrice()*stayRegister.getStayNumber();
                }
                stayRegister.setRoomID(roomId);
                stayRegister.setSumConst(total);
                //判断付款方式--判定是结账还是退房结账
                if(stayRegister.getPayWayID()==72){
                    stayRegister.setIsBillID(68);
                }else{
                    stayRegister.setPayTime(new Date());
                    stayRegister.setIsBillID(73);
                }
                JSONArray array= (JSONArray)entry.getValue();
                error=roomDao.updateState(65,roomId);
                //判断该房间是否有旅客--没有就用gPid
                if(array!=null&&array.size()>0){
                    //判断旅客人数，大于2就是团队
                    if(array.size()>=2){
                        stayRegister.setLvKeLeiXingId(56);
                    }else{
                        stayRegister.setLvKeLeiXingId(55);
                    }
                    //新增住房记录
                    error=stayRegisterDao.insertStayRegisters(stayRegister);
                    sid = passengerDao.last_insert_id();
                    //循环新增stayRegisterDetails
                    for (int j = 0; j <array.size() ; j++) {
                        StayRegisterDetails stayRegisterDetails=new StayRegisterDetails(sid,Integer.parseInt((String)array.get(j)));
                        error=stayRegisterDao.insertStayRegisterDetails(stayRegisterDetails);
                    }
                }else{
                    stayRegister.setLvKeLeiXingId(55);
                    //新增住房记录
                    error=stayRegisterDao.insertStayRegisters(stayRegister);
                    sid = passengerDao.last_insert_id();
                    //新增stayRegisterDetails
                    StayRegisterDetails stayRegisterDetails=new StayRegisterDetails(sid,gPid);
                    error=stayRegisterDao.insertStayRegisterDetails(stayRegisterDetails);
                }
            }
        }
        //循环新增消费记录表
        Iterator entries2 = map.entrySet().iterator();
        while (entries2.hasNext()) {
            Map.Entry entry = (Map.Entry) entries2.next();
            Integer cId=0;
            Integer number=0;
            JSONObject numberJson=(JSONObject) entry.getValue();
            Map<String, Object> innerMap = numberJson.getInnerMap();
            Iterator<Map.Entry<String, Object>> entries = innerMap.entrySet().iterator();
            //循环得到商品id和购买数量
            while (entries.hasNext()) {
                Map.Entry<String, Object> entry2 = entries.next();
                cId=Integer.parseInt(entry2.getKey());
                number=(Integer) entry2.getValue();
            }
            //得到一个商品--计算价格
            Commodity c = commodityDao.getId(cId);
            Float total=c.getSalePrice()*number;
            ConsumptionDetails consumptionDetails=new ConsumptionDetails();
            consumptionDetails.setConsumptionMoney(total);
            consumptionDetails.setStayRegisterID(sid);
            consumptionDetails.setcID(cId);
            consumptionDetails.setConsumptionNumber(number);
            //新增消费表
            error=consumptionDetailsDao.insertConsumptionDetails(consumptionDetails);
        }
        if(error>0){
            return true;
        }
        return false;
    }

    /**
     * 分页查询带参数
     * @param pager
     */
    public void listByPager(Pager<StayRegister> pager) {
        pager.setTotalRows(stayRegisterDao.totalRow(pager));//设置总行数
        pager.setDatas(stayRegisterDao.listByPager(pager));//查询数据放到pager对象的datas中
    }

    public StayRegister getStayRegister(StayRegister stayRegister) {
        List<StayRegister> stayRegistersList = stayRegisterDao.listByParam(stayRegister);
        if(stayRegistersList!=null){
            return stayRegistersList.get(0);
        }
        return null;
    }

    /**
     * 散客结账
     * @param stayRegister
     * @return
     */
    public boolean updateIsBill(StayRegister stayRegister) {
        stayRegister.setIsBillID(69);
        return stayRegisterDao.updateByParam(stayRegister)>0
                &&roomDao.updateState(1,stayRegister.getRoomID())>0;
    }


}
