/**
 * @Copyright:2020
 * @Author:Zero
 * @LastModified:2020-04-27 23:29:41
 * 用户服务层接口实现类
 */

package com.zero.service.impl;

import com.github.pagehelper.PageHelper;
import com.zero.dao.UserDao;
import com.zero.service.UserService;
import com.zero.domain.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.SQLException;
import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {
    @Resource(name = "userDao")
    private UserDao userDao;
    @Override
    public List<User> findAll(int page, int size) throws Exception {
        PageHelper.startPage(page, size);
        return userDao.findAll(page, size);
    }

    @Override
    public List<User> findUserByName(String username, String uid) throws SQLException {
        return userDao.findUserByName(username, uid);
    }

    @Override
    public void addUser(User user) throws Exception {
        userDao.addUser(user);
    }

    @Override
    public void updateUser(int id, User user) {
        userDao.updateUser(id, user);
    }

    @Override
    public void deleteUser(int id) {
        userDao.deleteUser(id);
    }

    @Override
    public String findPasswordByUid(String uid) {
        return userDao.findPasswordByUid(uid);
    }
}
