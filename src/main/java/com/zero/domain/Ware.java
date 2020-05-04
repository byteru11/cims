/**
 * @Copyright:2020
 * @Author:Zero
 * @LastModified:2020-05-02 17:18:30
 * 仓库实体类
 */

package com.zero.domain;

public class Ware {
    private Integer id;
    private String name;
    private Integer number;

    public Ware() {
    }

    public Ware(Integer id, String name, Integer number) {
        this.id = id;
        this.name = name;
        this.number = number;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    @Override
    public String toString() {
        return "Ware{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", number=" + number +
                '}';
    }
}
