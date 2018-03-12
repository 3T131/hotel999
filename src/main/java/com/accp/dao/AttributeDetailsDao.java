package com.accp.dao;

import com.accp.entity.AttributeDetails;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AttributeDetailsDao {

    /**
     * 按属性名ID查询
     * @param attributeID
     * @return
     */
    List<AttributeDetails> listByAttributeName(@Param("attributeID") int attributeID);


    /**
     * 新增商品类别信息
     * @param attributeDetails
     * @return
     */
    Integer add(AttributeDetails attributeDetails);

    /**
     * 删除商品类别信息
     * @param attributedetailsId
     * @return
     */
    Integer deleteAttributeDetails(String[] attributedetailsId);
}
