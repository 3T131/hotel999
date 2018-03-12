package com.accp.biz;

import com.accp.entity.Users;

/**
 * 用户表
 */
public interface  UserBiz {
    /**
     * 登录功能
     * @param users
     * @return
     */
    Users login(Users users);
}
