package com.accp.biz.impl;

import com.accp.biz.CommodityBiz;
import com.accp.dao.CommodityDao;
import com.accp.entity.Commodity;
import com.accp.entity.Pager;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("commodityBiz")
public class CommodityBizImpl implements CommodityBiz {
    @Resource
    private CommodityDao commodityDao;

    public List<Commodity> listByIds(String[] ids) {
        if(ids!=null&&ids.length>0){
            return commodityDao.listByIds(ids);
        }
        return null;
    }

    public List<Commodity> listByParam(Commodity commodity) {
        return commodityDao.listByParam(commodity);
    }

    /**
     * 查询商品信息(分页)
     * @param pager
     */
    public void listByCommodityNameNew(Pager<Commodity> pager) {
        pager.setTotalRows(commodityDao.totalRows(pager));
        pager.setDatas(commodityDao.queryByCommodityName(pager));
    }

    /**
     * 新增商品信息
     * @param commodity
     * @return
     */
    public Integer add(Commodity commodity) {
        return commodityDao.insert(commodity);
    }

    /**
     * 获得商品信息id
     * @param commodityId
     * @return
     */
    public Commodity getCommodityId(Integer commodityId) {
        return commodityDao.getId(commodityId);
    }

    /**
     * 修改商品信息
     * @param commodity
     * @return
     */
    public Boolean updatenew(Commodity commodity) {
        return commodityDao.update(commodity)>0;
    }

    /**
     * 删除商品信息
     * @param commodityId
     * @return
     */
    public Boolean deleteByCommodityId(String[] commodityId) {
        return commodityDao.deleteByCommodityId(commodityId)>0;
    }

}
