package com.accp.dao;

import com.accp.entity.Users;

public interface UsersDao {

    /**
     * 登录
     * @param users
     * @return
     */
    Users login(Users users);

}
