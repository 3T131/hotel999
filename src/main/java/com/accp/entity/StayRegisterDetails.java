package com.accp.entity;


/**
 * z住宿登记明细表
 */
public class StayRegisterDetails {
    private Integer stayRegisterDetailsId;  // '住宿登记明细id'
    private Integer stayRegisterID ;//'住宿登记id'
    private Integer passengerID;// '旅客id'

    private StayRegister stayRegister;//住宿登记
    private Passenger passenger;//旅客

    public StayRegisterDetails(Integer stayRegisterID, Integer passengerID) {
        this.stayRegisterID = stayRegisterID;
        this.passengerID = passengerID;
    }

    public Integer getStayRegisterDetailsId() {
        return stayRegisterDetailsId;
    }

    public void setStayRegisterDetailsId(Integer stayRegisterDetailsId) {
        this.stayRegisterDetailsId = stayRegisterDetailsId;
    }

    public StayRegister getStayRegister() {
        return stayRegister;
    }

    public void setStayRegister(StayRegister stayRegister) {
        this.stayRegister = stayRegister;
    }

    public Passenger getPassenger() {
        return passenger;
    }

    public void setPassenger(Passenger passenger) {
        this.passenger = passenger;
    }


    public Integer getStayRegisterID() {
        return stayRegisterID;
    }

    public void setStayRegisterID(Integer stayRegisterID) {
        this.stayRegisterID = stayRegisterID;
    }

    public Integer getPassengerID() {
        return passengerID;
    }

    public void setPassengerID(Integer passengerID) {
        this.passengerID = passengerID;
    }
}
