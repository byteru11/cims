/**
 * @Copyright:2020
 * @Author:Zero
 * @LastModified:2020-05-04 11:37:50
 * 出库单据实体类
 */

package com.zero.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

public class Out{
    private String id;
    private String name;
    @DateTimeFormat(pattern = "YYYY-MM-DD HH:mm:SS")
    private LocalDateTime date;
    private String username;
    private String out;
    private String text;
    private String no;
    private Integer number;
    private Product product;

    public Out() {
    }

    public Out(String id, String name, LocalDateTime date, String username, String out, String text, String no, Integer number, Product product) {
        this.id = id;
        this.name = name;
        this.date = date;
        this.username = username;
        this.out = out;
        this.text = text;
        this.no = no;
        this.number = number;
        this.product = product;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
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

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getOut() {
        return out;
    }

    public void setOut(String out) {
        this.out = out;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    @Override
    public String toString() {
        return "Out{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", date=" + date +
                ", username='" + username + '\'' +
                ", out='" + out + '\'' +
                ", text='" + text + '\'' +
                ", no='" + no + '\'' +
                ", number=" + number +
                ", product=" + product +
                '}';
    }
}
