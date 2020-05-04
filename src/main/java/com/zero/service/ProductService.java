/**
 * @Copyright:2020
 * @Author:Zero
 * @LastModified:2020-05-01 21:26:15
 * 货品服务层接口类
 */

package com.zero.service;

import com.zero.domain.Product;

import java.sql.SQLException;
import java.util.List;

public interface ProductService {
    /**
     * 查询货品所有信息
     * @param page 当前页面
     * @param size 每页数量
     * @return list
     */
    List<Product> findAll(int page, int size);

    /**
     * 根据填入的信息查询product
     * @param product_id product_id
     * @param product_name product_name
     * @param color color
     * @param size size
     * @return lists
     */
    List<Product> findProduct(String product_id, String product_name, String color, int size);

    /**
     * 添加货品
     * @param product Product
     * @throws SQLException sql
     */
    void addProduct(Product product) throws SQLException;

    /**
     * 更新product和product_price表
     * @param id 货品序号
     * @param product Product
     * @throws SQLException sql
     */
    void updateProduct(Integer id,Product product) throws SQLException;

    /**
     * 根据id删除货品
     * @param id 货品id
     */
    void deleteProduct(int id);
}
