/**
 * @Copyright:2020
 * @Author:Zero
 * @LastModified:2020-05-04 16:49:07
 * 库存实体类
 */

package com.zero.domain;

public class Reserve {
    private String id;
    private String name;
    private String no;
    private String number;

    public Reserve() {
    }

    public Reserve(String id, String name, String no, String number) {
        this.id = id;
        this.name = name;
        this.no = no;
        this.number = number;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }
}
