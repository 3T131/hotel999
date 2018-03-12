package com.accp.entity;

/**
 * 房间表
 */
public class Room {
    private Integer roomId; //'房间id',
    private Integer guestRoomLevelID ; //'客房等级ID',
    private Integer roomStateID ; //'房态ID',
    private String roomNumber ; //'房间号',
    private String roomAmount ; //'床位数',
    private Float standardPriceDay ; //'标准房价/天',
    private Float standardPrice ; //'标准房价/小时',
    private String maxDuration ; //'时长限制（小时）',
    private String firstDuration ; //'首段时长（小时）',
    private Float firstPrice ; //'首段价格',

    private String roomName; //房态
    private String guestRoomLevelName;//客房等级名字

    public String getGuestRoomLevelName() {
        return guestRoomLevelName;
    }

    public void setGuestRoomLevelName(String guestRoomLevelName) {
        this.guestRoomLevelName = guestRoomLevelName;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public Integer getRoomId() {
        return roomId;
    }

    public void setRoomId(Integer roomId) {
        this.roomId = roomId;
    }

    public Integer getGuestRoomLevelID() {
        return guestRoomLevelID;
    }

    public void setGuestRoomLevelID(Integer guestRoomLevelID) {
        this.guestRoomLevelID = guestRoomLevelID;
    }

    public Integer getRoomStateID() {
        return roomStateID;
    }

    public void setRoomStateID(Integer roomStateID) {
        this.roomStateID = roomStateID;
    }

    public String getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }

    public String getRoomAmount() {
        return roomAmount;
    }

    public void setRoomAmount(String roomAmount) {
        this.roomAmount = roomAmount;
    }

    public Float getStandardPriceDay() {
        return standardPriceDay;
    }

    public void setStandardPriceDay(Float standardPriceDay) {
        this.standardPriceDay = standardPriceDay;
    }

    public Float getStandardPrice() {
        return standardPrice;
    }

    public void setStandardPrice(Float standardPrice) {
        this.standardPrice = standardPrice;
    }

    public String getMaxDuration() {
        return maxDuration;
    }

    public void setMaxDuration(String maxDuration) {
        this.maxDuration = maxDuration;
    }

    public String getFirstDuration() {
        return firstDuration;
    }

    public void setFirstDuration(String firstDuration) {
        this.firstDuration = firstDuration;
    }

    public Float getFirstPrice() {
        return firstPrice;
    }

    public void setFirstPrice(Float firstPrice) {
        this.firstPrice = firstPrice;
    }
}
