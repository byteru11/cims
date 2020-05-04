/**
 * @Copyright:2020
 * @Author:Zero
 * @LastModified:2020-04-27 23:23:13
 */

package com.zero.dao;

import com.zero.domain.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.List;

@Repository("userDao")
public interface UserDao {
    /**
     * 查询所有用户
     * @return users
     * @param page 页数
     * @param size 每一页的显示量
     * @throws Exception 查询异常
     */
    @Select("select * from user")
    List<User> findAll(int page, int size) throws Exception;

    /**
     * 根据usernmae，uid查询用户信息
     * @param username 用户名
     * @param uid 登录id
     * @return users
     * @throws SQLException 异常
     */
    @Select("select * from user where username=#{username} or uid=#{uid}")
    List<User> findUserByName(@Param("username") String username, @Param("uid") String uid) throws SQLException;

    /**
     * 添加用户
     * @param user 用户
     * @throws Exception 异常
     */
    @Insert("insert into user(username,uid,password) values(#{username},#{uid},#{password})")
    void addUser(User user) throws Exception;

    /**
     * 跟据用户登录名修改用户信息
     * @param id 序号
     * @param user 修改信息
     */
    @Update("update user set username=#{user.username},uid=#{user.uid},password=#{user.password} where id=#{id}")
    void updateUser(@Param("id") int id,@Param("user") User user);

    /**
     * 根据用户id删除用户
     * @param id 用户序号
     */
    @Delete("delete from user where id=#{id}")
    void deleteUser(int id);

    /**
     * 根据uid查询password
     * @param uid 用户登录名
     * @return password
     */
    @Select("select password from user where uid=#{uid}")
    String findPasswordByUid(String uid);

}
