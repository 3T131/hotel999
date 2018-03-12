package com.accp.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 住宿登记表
 */
public class StayRegister {

    private Integer stayRegisterId; //住宿登记ID
    private Date registerTime; //登记时间
    private Integer stayNumber; //住店天数/小时
    private Float sumConst; //住宿总费用
    private Float sumConst2;//总费用
    private Integer changingRoomNumber; //换房次数
    private Float changRoomMoney; //换房费
    private String remarks; //备注
    private Date payTime; //结账时间
    private Date changRoomTime; //换房时间
    private Integer remind; //提醒结账

    private Integer predetermineID;  //预定表ID
    private Integer rentOutTypeID;//出租方式ID
    private Integer roomID;//房间ID
    private Integer payWayID;//结账方式ID
    private Integer billUnitID;//结账单位ID
    private Integer receiveTargetID;//接待对象ID
    private Integer passengerTypeID;//旅客类型ID
    private Integer isBillID;//是否结账ID
    private Integer dpId;

    /*----------------------拓展属性---------------------------------*/
    private Predetermine predetermine;  //预定表
    private Room room;//房间
    private ReceiveTarget receiveTarget;//接待对象
    private Depoit depoit;

    private String passengerType;//旅客类型
    private String isBill;//是否结账
    private String payWay;//结账方式
    private String billUnit;//结账单位
    private String rentOutType;//出租方式

    private String passengerName;//旅客姓名
    private String roomNumber;//房间号
    private Integer LvKeLeiXingId; //旅客类型
    private Float otherConsumer=0f;//其他消费
    private Float accommodation=0f;//房费

    private Date dateMin;//条件时间
    private Date dateMax;//条件时间

    private List<Passenger> passengerList=new ArrayList<Passenger>();//旅客集合
    private List<ConsumptionDetails> consumptionDetailsList=new ArrayList<ConsumptionDetails>();//消费集合

    public Date getDateMin() {
        return dateMin;
    }

    public void setDateMin(Date dateMin) {
        this.dateMin = dateMin;
    }

    public Date getDateMax() {
        return dateMax;
    }

    public void setDateMax(Date dateMax) {
        this.dateMax = dateMax;
    }

    public Float getSumConst2() {
        if(rentOutTypeID==26){
            sumConst2=room.getStandardPriceDay()*this.stayNumber;
        }
        if(rentOutTypeID==25){
            sumConst2=room.getStandardPrice()*this.stayNumber;
        }
        if(this.depoit!=null&&this.depoit.getDepositMoney()!=null){
            sumConst2-=this.depoit.getDepositMoney();
        }
        sumConst2+=this.getOtherConsumer();
        return sumConst2;
    }

    public void setSumConst2(Float sumConst2) {
        this.sumConst2 = sumConst2;
    }

    public Float getAccommodation() {
        if(rentOutTypeID==26){
            accommodation=room.getStandardPriceDay()*this.stayNumber;
        }
        if(rentOutTypeID==25){
            accommodation=room.getStandardPrice()*this.stayNumber;
        }
        return accommodation;
    }

    public void setAccommodation(Float accommodation) {
        this.accommodation = accommodation;
    }

    public List<ConsumptionDetails> getConsumptionDetailsList() {
        return consumptionDetailsList;
    }

    public void setConsumptionDetailsList(List<ConsumptionDetails> consumptionDetailsList) {
        this.consumptionDetailsList = consumptionDetailsList;

    }

    public Float getOtherConsumer() {
        if(consumptionDetailsList!=null&&consumptionDetailsList.size()>0
                &&consumptionDetailsList.get(0).getConsumptionDetailsId()!=null){
            this.otherConsumer=0f;
            for (ConsumptionDetails consumptionDetails:consumptionDetailsList){
                this.otherConsumer=consumptionDetails.getConsumptionMoney()+otherConsumer;
            }
        }
        return otherConsumer;
    }

    public void setOtherConsumer(Float otherConsumer) {
        this.otherConsumer = otherConsumer;
    }

    public Integer getDpId() {
        return dpId;
    }

    public void setDpId(Integer dpId) {
        this.dpId = dpId;
    }

    public Depoit getDepoit() {
        return depoit;
    }

    public void setDepoit(Depoit depoit) {
        this.depoit = depoit;
    }

    public String getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }

    public String getPassengerName() {
        return passengerName;
    }

    public void setPassengerName(String passengerName) {
        this.passengerName = passengerName;
    }

    public Integer getLvKeLeiXingId() {
        return LvKeLeiXingId;
    }

    public void setLvKeLeiXingId(Integer lvKeLeiXingId) {
        LvKeLeiXingId = lvKeLeiXingId;
    }



    public Integer getStayRegisterId() {

        return stayRegisterId;
    }

    public void setStayRegisterId(Integer stayRegisterId) {
        this.stayRegisterId = stayRegisterId;
    }

    public Date getRegisterTime() {
        return registerTime;
    }

    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }

    public Integer getStayNumber() {
        return stayNumber;
    }

    public void setStayNumber(Integer stayNumber) {
        this.stayNumber = stayNumber;
    }

    public Float getSumConst() {
        return sumConst;
    }

    public void setSumConst(Float sumConst) {
        this.sumConst = sumConst;
    }

    public Integer getChangingRoomNumber() {
        return changingRoomNumber;
    }

    public void setChangingRoomNumber(Integer changingRoomNumber) {
        this.changingRoomNumber = changingRoomNumber;
    }

    public Float getChangRoomMoney() {
        return changRoomMoney;
    }

    public void setChangRoomMoney(Float changRoomMoney) {
        this.changRoomMoney = changRoomMoney;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public Date getPayTime() {
        return payTime;
    }

    public void setPayTime(Date payTime) {
        this.payTime = payTime;
    }

    public Date getChangRoomTime() {
        return changRoomTime;
    }

    public void setChangRoomTime(Date changRoomTime) {
        this.changRoomTime = changRoomTime;
    }

    public Integer getRemind() {
        return remind;
    }

    public void setRemind(Integer remind) {
        this.remind = remind;
    }


    public Integer getPredetermineID() {
        return predetermineID;
    }

    public void setPredetermineID(Integer predetermineID) {
        this.predetermineID = predetermineID;
    }

    public Integer getRentOutTypeID() {
        return rentOutTypeID;
    }

    public void setRentOutTypeID(Integer rentOutTypeID) {
        this.rentOutTypeID = rentOutTypeID;
    }

    public Integer getRoomID() {
        return roomID;
    }

    public void setRoomID(Integer roomID) {
        this.roomID = roomID;
    }

    public Integer getPayWayID() {
        return payWayID;
    }

    public void setPayWayID(Integer payWayID) {
        this.payWayID = payWayID;
    }

    public Integer getBillUnitID() {
        return billUnitID;
    }

    public void setBillUnitID(Integer billUnitID) {
        this.billUnitID = billUnitID;
    }

    public Integer getReceiveTargetID() {
        return receiveTargetID;
    }

    public void setReceiveTargetID(Integer receiveTargetID) {
        this.receiveTargetID = receiveTargetID;
    }

    public Integer getPassengerTypeID() {
        return passengerTypeID;
    }

    public void setPassengerTypeID(Integer passengerTypeID) {
        this.passengerTypeID = passengerTypeID;
    }

    public Integer getIsBillID() {
        return isBillID;
    }

    public void setIsBillID(Integer isBillID) {
        this.isBillID = isBillID;
    }

    public Predetermine getPredetermine() {
        return predetermine;
    }

    public void setPredetermine(Predetermine predetermine) {
        this.predetermine = predetermine;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public ReceiveTarget getReceiveTarget() {
        return receiveTarget;
    }

    public void setReceiveTarget(ReceiveTarget receiveTarget) {
        this.receiveTarget = receiveTarget;
    }

    public String getPassengerType() {
        return passengerType;
    }

    public void setPassengerType(String passengerType) {
        this.passengerType = passengerType;
    }

    public String getIsBill() {
        return isBill;
    }

    public void setIsBill(String isBill) {
        this.isBill = isBill;
    }

    public String getPayWay() {
        return payWay;
    }

    public void setPayWay(String payWay) {
        this.payWay = payWay;
    }

    public String getBillUnit() {
        return billUnit;
    }

    public void setBillUnit(String billUnit) {
        this.billUnit = billUnit;
    }

    public String getRentOutType() {
        return rentOutType;
    }

    public void setRentOutType(String rentOutType) {
        this.rentOutType = rentOutType;
    }

    public List<Passenger> getPassengerList() {
        return passengerList;
    }

    public void setPassengerList(List<Passenger> passengerList) {
        this.passengerList = passengerList;
    }
}
