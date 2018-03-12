package com.accp.biz;

import com.accp.entity.AttributeDetails;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AttributeDetailsBiz {

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
    Integer insert(AttributeDetails attributeDetails);

    /**
     * 删除商品信息
     * @param attributedetailsId
     * @return
     */
    Integer deleteAttributeDetails(String[] attributedetailsId);

}
