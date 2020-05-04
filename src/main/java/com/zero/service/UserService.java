/**
 * @Copyright:2020
 * @Author:Zero
 * @LastModified:2020-04-27 23:29:41
 * 用户服务层接口类
 */

package com.zero.service;

import com.zero.domain.User;

import java.sql.SQLException;
import java.util.List;

public interface UserService {
    /**
     * 查询所有用户
     * @param page 页码
     * @param size 数量
     * @return users
     * @throws Exception 异常
     */
    List<User> findAll(int page, int size) throws Exception;

    /**
     * 根据usernmae，uid查询用户信息
     * @param username 用户名
     * @param uid 登录id
     * @return users
     * @throws SQLException 异常
     */
    List<User> findUserByName(String username, String uid) throws SQLException;

    /**
     * 添加用户
     * @param user 用户
     * @throws Exception 异常
     */
    void addUser(User user) throws Exception;

    /**
     * 跟据用户登录名修改用户信息
     * @param id 序号
     * @param user 修改信息
     */
    void updateUser(int id, User user);

    /**
     * 根据用户id删除用户
     * @param id 用户序号
     */
    void deleteUser(int id);

    /**
     * 根据uid查询password
     * @param uid 用户登录名
     * @return password
     */
    String findPasswordByUid(String uid);
}
