package com.accp.biz.impl;

import com.accp.biz.AttributeDetailsBiz;
import com.accp.dao.AttributeDetailsDao;
import com.accp.entity.AttributeDetails;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service
public class AttributeDetailsBizImpl implements AttributeDetailsBiz {

    @Resource
    private AttributeDetailsDao attributeDetailsDao;

    public List<AttributeDetails> listByAttributeName(int attributeID) {
        return attributeDetailsDao.listByAttributeName(attributeID);
    }

    /**
     * 新增商品类别信息
     * @param attributeDetails
     * @return
     */
    public Integer insert(AttributeDetails attributeDetails) {
        return attributeDetailsDao.add(attributeDetails);
    }

    /**
     * 删除商品类别信息
     * @param attributedetailsId
     * @return
     */
    public Integer deleteAttributeDetails(String[] attributedetailsId) {
        return attributeDetailsDao.deleteAttributeDetails(attributedetailsId);
    }
}
