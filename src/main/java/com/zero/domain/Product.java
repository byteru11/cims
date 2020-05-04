/**
 * @Copyright:2020
 * @Author:Zero
 * @LastModified:2020-05-01 21:01:40
 * 货品实体类
 */

package com.zero.domain;

import java.math.BigDecimal;

public class Product {
    private int id;
    private String product_id;
    private int size;
    private String product_name;
    private String color;
    private BigDecimal price;
    private BigDecimal ex_price;
    private String no;
    private Integer number;

    public Product() {
    }

    public Product(String product_id, int size, String product_name, String color) {
        this.product_id = product_id;
        this.size = size;
        this.product_name = product_name;
        this.color = color;
    }

    public Product(String product_id, BigDecimal price, BigDecimal ex_price) {
        this.product_id = product_id;
        this.price = price;
        this.ex_price = ex_price;
    }

    public Product(String product_id, int size, String product_name, String color, String no, Integer number) {
        this.product_id = product_id;
        this.size = size;
        this.product_name = product_name;
        this.color = color;
        this.no = no;
        this.number = number;
    }

    public Product(int id, String product_id, int size, String product_name, String color, BigDecimal price, BigDecimal ex_price, String no, Integer number) {
        this.id = id;
        this.product_id = product_id;
        this.size = size;
        this.product_name = product_name;
        this.color = color;
        this.price = price;
        this.ex_price = ex_price;
        this.no = no;
        this.number = number;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getEx_price() {
        return ex_price;
    }

    public void setEx_price(BigDecimal ex_price) {
        this.ex_price = ex_price;
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
        return "Product{" +
                "id=" + id +
                ", product_id='" + product_id + '\'' +
                ", size=" + size +
                ", product_name='" + product_name + '\'' +
                ", color='" + color + '\'' +
                ", price=" + price +
                ", ex_price=" + ex_price +
                ", no='" + no + '\'' +
                ", number=" + number +
                '}';
    }
}
