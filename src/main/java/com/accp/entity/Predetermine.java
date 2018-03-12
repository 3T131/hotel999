package com.accp.entity;


import java.util.Date;

/**
 * 预定房间表
 */
public class Predetermine {

    private int predetermineId; //'预定ID',
    private int roomID; //'房间ID',
    private int predetermineTargetID; //'预定对象ID',
    private int passengerID; //'旅客ID',
    private int payWayID; //'支付方式 ID',
    private int predetermineStateID; //'预定状态ID',
    private Date arriveTime; //'抵达时间',
    private Float deposit; //'押金',
    private String predetermineDay; //'预定天数',
    private int remind; //'到时提示',
    //-------------------------------------------------------
    private Room room;//房间
    private ReceiveTarget Integer;//预定对象
    private Passenger passenger;//旅客
    private AttributeDetails payWay;//支付方式
    private AttributeDetails predetermineState;//预定状态
    // -----------------------------------------------------
    private String roomNumber; //房间号
    private String passengerName;//旅客姓名
    private String roomGuestRoomLevelName;//房间类别
    private String payWayName;//支付方式
    private String predetermineStateName;//预定状态
    private String receiveContactPhoneNUmber; //接待对象电话
    private String passengerContactPhoneNumber;//旅客电话
    private String receivePrincipal; //负责人
    private String genderName;//性别
    private String papersName;//证件类型

    public String getGenderName() {
        return genderName;
    }

    public void setGenderName(String genderName) {
        this.genderName = genderName;
    }

    public String getPapersName() {
        return papersName;
    }

    public void setPapersName(String papersName) {
        this.papersName = papersName;
    }

    public String getReceivePrincipal() {
        return receivePrincipal;
    }

    public void setReceivePrincipal(String receivePrincipal) {
        this.receivePrincipal = receivePrincipal;
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

    public String getRoomGuestRoomLevelName() {
        return roomGuestRoomLevelName;
    }

    public void setRoomGuestRoomLevelName(String roomGuestRoomLevelName) {
        this.roomGuestRoomLevelName = roomGuestRoomLevelName;
    }

    public String getPayWayName() {
        return payWayName;
    }

    public void setPayWayName(String payWayName) {
        this.payWayName = payWayName;
    }

    public String getPredetermineStateName() {
        return predetermineStateName;
    }

    public void setPredetermineStateName(String predetermineStateName) {
        this.predetermineStateName = predetermineStateName;
    }

    public String getReceiveContactPhoneNUmber() {
        return receiveContactPhoneNUmber;
    }

    public void setReceiveContactPhoneNUmber(String receiveContactPhoneNUmber) {
        this.receiveContactPhoneNUmber = receiveContactPhoneNUmber;
    }

    public String getPassengerContactPhoneNumber() {
        return passengerContactPhoneNumber;
    }

    public void setPassengerContactPhoneNumber(String passengerContactPhoneNumber) {
        this.passengerContactPhoneNumber = passengerContactPhoneNumber;
    }

    public ReceiveTarget getInteger() {
        return Integer;
    }

    public void setInteger(ReceiveTarget integer) {
        Integer = integer;
    }

    public int getPredetermineId() {
        return predetermineId;
    }

    public void setPredetermineId(int predetermineId) {
        this.predetermineId = predetermineId;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public int getPredetermineTargetID() {
        return predetermineTargetID;
    }

    public void setPredetermineTargetID(int predetermineTargetID) {
        this.predetermineTargetID = predetermineTargetID;
    }

    public int getPassengerID() {
        return passengerID;
    }

    public void setPassengerID(int passengerID) {
        this.passengerID = passengerID;
    }

    public int getPayWayID() {
        return payWayID;
    }

    public void setPayWayID(int payWayID) {
        this.payWayID = payWayID;
    }

    public int getPredetermineStateID() {
        return predetermineStateID;
    }

    public void setPredetermineStateID(int predetermineStateID) {
        this.predetermineStateID = predetermineStateID;
    }

    public Date getArriveTime() {
        return arriveTime;
    }

    public void setArriveTime(Date arriveTime) {
        this.arriveTime = arriveTime;
    }

    public Float getDeposit() {
        return deposit;
    }

    public void setDeposit(Float deposit) {
        this.deposit = deposit;
    }

    public String getPredetermineDay() {
        return predetermineDay;
    }

    public void setPredetermineDay(String predetermineDay) {
        this.predetermineDay = predetermineDay;
    }

    public int getRemind() {
        return remind;
    }

    public void setRemind(int remind) {
        this.remind = remind;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public ReceiveTarget getPredetermineTarget() {
        return Integer;
    }

    public void setPredetermineTarget(ReceiveTarget Integer) {
        this.Integer = Integer;
    }

    public Passenger getPassenger() {
        return passenger;
    }

    public void setPassenger(Passenger passenger) {
        this.passenger = passenger;
    }

    public AttributeDetails getPayWay() {
        return payWay;
    }

    public void setPayWay(AttributeDetails payWay) {
        this.payWay = payWay;
    }

    public AttributeDetails getPredetermineState() {
        return predetermineState;
    }

    public void setPredetermineState(AttributeDetails predetermineState) {
        this.predetermineState = predetermineState;
    }
}
