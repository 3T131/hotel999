package com.accp.entity;
/**
 * 属性表
 */
public class Attribute {
    private Integer attributeId; //'属性ID',
    private String attributeName; //'属性名称',

    public Integer getAttributeId() {
        return attributeId;
    }

    public void setAttributeId(Integer attributeId) {
        this.attributeId = attributeId;
    }

    public String getAttributeName() {
        return attributeName;
    }

    public void setAttributeName(String attributeName) {
        this.attributeName = attributeName;
    }
}
