package com.accp.entity;
import java.util.Date;
/**
 * 消费明细表
 */
public class ConsumptionDetails {

    private Integer consumptionDetailsId; //'消费明细ID',
    private Integer stayRegisterID; //'住宿登记ID',
    private Integer cID; //'商品ID',
    private Integer consumptionNumber; //'消费数量',
    private Float consumptionMoney; //'消费金额',
    private Date consumptionTime; //'消费时间',

    private Commodity commodity;//商品

    public Commodity getCommodity() {
        return commodity;
    }

    public void setCommodity(Commodity commodity) {
        this.commodity = commodity;
    }

    public Integer getConsumptionDetailsId() {
        return consumptionDetailsId;
    }

    public void setConsumptionDetailsId(Integer consumptionDetailsId) {
        this.consumptionDetailsId = consumptionDetailsId;
    }

    public Integer getStayRegisterID() {
        return stayRegisterID;
    }

    public void setStayRegisterID(Integer stayRegisterID) {
        this.stayRegisterID = stayRegisterID;
    }

    public Integer getcID() {
        return cID;
    }

    public void setcID(Integer cID) {
        this.cID = cID;
    }

    public Integer getConsumptionNumber() {
        return consumptionNumber;
    }

    public void setConsumptionNumber(Integer consumptionNumber) {
        this.consumptionNumber = consumptionNumber;
    }

    public Float getConsumptionMoney() {
        return consumptionMoney;
    }

    public void setConsumptionMoney(Float consumptionMoney) {
        this.consumptionMoney = consumptionMoney;
    }

    public Date getConsumptionTime() {
        return consumptionTime;
    }

    public void setConsumptionTime(Date consumptionTime) {
        this.consumptionTime = consumptionTime;
    }
}
