package com.accp.entity;
/**
 * 属性明细表
 */

public class AttributeDetails {
    private Integer attributeDetailsId; //'属性明细ID',
    private Integer attributeID; //'属性ID',
    private String attributeDetailsName; //'属性明细名称',
    private Attribute attributeName;//属性名

    public Integer getAttributeDetailsId() {
        return attributeDetailsId;
    }

    public void setAttributeDetailsId(Integer attributeDetailsId) {
        this.attributeDetailsId = attributeDetailsId;
    }

    public Integer getAttributeID() {
        return attributeID;
    }

    public void setAttributeID(Integer attributeID) {
        this.attributeID = attributeID;
    }

    public String getAttributeDetailsName() {
        return attributeDetailsName;
    }

    public void setAttributeDetailsName(String attributeDetailsName) {
        this.attributeDetailsName = attributeDetailsName;
    }
}
