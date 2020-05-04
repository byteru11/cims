/**
 * @Copyright:2020
 * @Author:Zero
 * @LastModified:2020-04-20 13:46:02
 * 用户实体类
 */
package com.zero.domain;

import javax.validation.constraints.NotNull;

public class User {
    private Integer id;
    @NotNull(message = "用户姓名不能为空！")
    private String username;
    @NotNull(message = "用户登录名不能为空！")
    private String uid;
    @NotNull(message = "用户登录名不能为空！")
    private String password;

    public User() {
    }

    public User(String username, String uid, String password) {
        this.username = username;
        this.uid = uid;
        this.password = password;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "User{" +
                "username='" + username + '\'' +
                ", uid='" + uid + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}

