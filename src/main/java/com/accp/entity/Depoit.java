package com.accp.entity;

import java.util.Date;
/**
 * 押金表
 */
public class Depoit {

    private Integer depoitId;
    private Integer payID; //'支付方式ID',
    private Date registerDate; //'登记时间',
    private Float depositMoney; //'押金',
    private String remarks;//备注

    private String payFs;//支付方式

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getPayFs() {
        return payFs;
    }

    public void setPayFs(String payFs) {
        this.payFs = payFs;
    }

    public Integer getDepoitId() {
        return depoitId;
    }

    public void setDepoitId(Integer depoitId) {
        this.depoitId = depoitId;
    }

    public Integer getPayID() {
        return payID;
    }

    public void setPayID(Integer payID) {
        this.payID = payID;
    }

    public Date getRegisterDate() {
        return registerDate;
    }

    public void setRegisterDate(Date registerDate) {
        this.registerDate = registerDate;
    }

    public Float getDepositMoney() {
        return depositMoney;
    }

    public void setDepositMoney(Float depositMoney) {
        this.depositMoney = depositMoney;
    }
}
