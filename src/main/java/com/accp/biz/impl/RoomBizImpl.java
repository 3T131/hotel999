package com.accp.biz.impl;

import com.accp.biz.RoomBiz;
import com.accp.dao.RoomDao;
import com.accp.entity.Pager;
import com.accp.entity.Room;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class RoomBizImpl implements RoomBiz {
    @Resource
    private RoomDao roomDao;

    /**
     * 按id数组查询集合
     * @param ids
     * @return
     */
    public List<Room> listByIds(String[] ids) {
        if(ids!=null&&ids.length>0) {
            return roomDao.listByIds(ids);
        }
        return null;
    }

    /**
     * 按条件动态查询
     * @param room
     * @return
     */
    public List<Room> listByParam(Room room) {
        return roomDao.listByParam(room);
    }

    /**
     * 分页查询$$模糊查询
     * @param pager
     */
    public void listPage(Pager<Room> pager) {
        pager.setTotalRows(roomDao.totalRow(pager));//总行数
        pager.setDatas(roomDao.listPage(pager));//结果集
    }

    /**
     * 增加客房
     * @param room
     * @return
     */
    public int insertRoom(Room room) {
            return  roomDao.insertRoom(room);
    }

    /**
     * 删除客房
     * @param roomId
     * @return
     */
    public int deleteRoom(String[] roomId) {
        return roomDao.deleteRoom(roomId);
    }

    /**
     * 根据id查询客房
     * @param roomId
     * @return
     */
    public Room roomById(int roomId) {
        return roomDao.roomById(roomId);
    }

    /**
     * 修改客房信息
     * @param room
     * @return
     */
    public int updateRoom(Room room) {
        return roomDao.updateRoom(room);
    }

    public List<Room> selectRoom() {
        return roomDao.selectRoom();
    }
}
