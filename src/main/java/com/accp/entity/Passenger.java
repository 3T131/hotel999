package com.accp.entity;

/**
 * 旅客信息表
 */
public class Passenger {

    private Integer pId; //'旅客ID',
    private Integer papersID; //'证件ID',
    private Integer genderID; //'性别ID',
    private Integer passengerLevelID; //'旅客级别ID',
    private Integer nationID; //'民族ID',
    private String name; //'姓名',
    private String papersNumber; //'证件号码',
    private String createDate;//登记时间
    private String birthDate; //'出生日期',
    private String phoneNumber; //'联系电话',
    private String remarks; //'备注',


    private String genderName;//性别
    private String nationName;//民族
    private String passengerLevelName;//'旅客级别
    private String papersName;////'证件',

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }

    public Integer getPapersID() {
        return papersID;
    }

    public void setPapersID(Integer papersID) {
        this.papersID = papersID;
    }

    public Integer getGenderID() {
        return genderID;
    }

    public void setGenderID(Integer genderID) {
        this.genderID = genderID;
    }

    public Integer getPassengerLevelID() {
        return passengerLevelID;
    }

    public void setPassengerLevelID(Integer passengerLevelID) {
        this.passengerLevelID = passengerLevelID;
    }

    public Integer getNationID() {
        return nationID;
    }

    public void setNationID(Integer nationID) {
        this.nationID = nationID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPapersNumber() {
        return papersNumber;
    }

    public void setPapersNumber(String papersNumber) {
        this.papersNumber = papersNumber;
    }

    public String getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getGenderName() {
        return genderName;
    }

    public void setGenderName(String genderName) {
        this.genderName = genderName;
    }

    public String getNationName() {
        return nationName;
    }

    public void setNationName(String nationName) {
        this.nationName = nationName;
    }

    public String getPassengerLevelName() {
        return passengerLevelName;
    }

    public void setPassengerLevelName(String passengerLevelName) {
        this.passengerLevelName = passengerLevelName;
    }

    public String getPapersName() {
        return papersName;
    }

    public void setPapersName(String papersName) {
        this.papersName = papersName;
    }
}
