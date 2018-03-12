package com.accp.biz.impl;

import com.accp.biz.UserBiz;
import com.accp.dao.UsersDao;
import com.accp.entity.Users;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * 用户表
 */
@Service
public class UserBizImpl implements UserBiz {

    @Resource
    private UsersDao usersDao;

    /**
     * 登录
     * @param users
     * @return
     */
    public Users login(Users users) {
        if(users!=null){
            return usersDao.login(users);
        }
        return null;
    }
}
