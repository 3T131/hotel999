package com.accp.biz;

import com.accp.entity.Pager;
import com.accp.entity.Room;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoomBiz {


    /**
     * 按id查询集合
     * @param ids
     * @return
     */
    List<Room> listByIds(String[] ids);
    /**
     * 按条件动态查询
     * @param room
     * @return
     */
    List<Room> listByParam(Room room);

    /**
     * 分页查询$$模糊查询
     * @param pager
     */
    void listPage(Pager<Room> pager);
    /**
     * 添加客房
     * @param room
     * @return
     */
    int insertRoom(Room room);
    /**
     * 删除客房
     * @param roomId
     * @return
     */
    int deleteRoom(String[] roomId);
    /**
     * 根据id查询客房
     * @param roomId
     * @return
     */
    Room roomById(@Param("roomId") int roomId);
    /**
     * 修改客房
     * @param room
     * @return
     */
    int updateRoom(Room room);
    /**
     * 查询所有的房间
     * @return
     */
    List<Room> selectRoom();
}
