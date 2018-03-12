package com.accp.entity;
/**
 * 商品表
 */
public class Commodity {

    private Integer commodityId; //'商品ID',
    private Integer commodityTypeID; //'商品类别ID',
    private Integer uOMID; //'计量单位ID',
    private String commodityName; //'商品名称',
    private Float salePrice; //'销售价格',

    private String commodityType;//商品类别
    private String uOM;//计量单位


    public Integer getCommodityId() {
        return commodityId;
    }

    public void setCommodityId(Integer commodityId) {
        this.commodityId = commodityId;
    }

    public Integer getCommodityTypeID() {
        return commodityTypeID;
    }

    public void setCommodityTypeID(Integer commodityTypeID) {
        this.commodityTypeID = commodityTypeID;
    }

    public Integer getuOMID() {
        return uOMID;
    }

    public void setuOMID(Integer uOMID) {
        this.uOMID = uOMID;
    }

    public String getCommodityName() {
        return commodityName;
    }

    public void setCommodityName(String commodityName) {
        this.commodityName = commodityName;
    }

    public Float getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(Float salePrice) {
        this.salePrice = salePrice;
    }

    public String getCommodityType() {
        return commodityType;
    }

    public void setCommodityType(String commodityType) {
        this.commodityType = commodityType;
    }

    public String getuOM() {
        return uOM;
    }

    public void setuOM(String uOM) {
        this.uOM = uOM;
    }
}
