/**
 * @Copyright:2020
 * @Author:Zero
 * @LastModified:2020-05-01 21:18:19
 * 货品持久层接口类
 */

package com.zero.dao;

import com.zero.domain.Product;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.StatementType;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.List;

@Repository("productDao")
public interface ProductDao {
    /**
     * 查询货品所有信息
     * @return list
     */
    @Select("SELECT * FROM product_view")
    List<Product> findAll();

    /**
     * 根具id查询product，用于invoice一对一查询
     * @param id 单据编号
     * @return
     */
    @Select("SELECT * FROM invoice_product WHERE no=#{id}")
    Product findProductById(String id);

    /**
     * 根据out表no查询product信息，用于out一对多查询
     * @param id 货物序号
     * @return product
     */
    @Select("SELECT * FROM product WHERE id=#{id}")
    Product findProductByOutId(Integer id);

    /**
     * 根据填入的信息查询product
     * @param product_id product_id
     * @param product_name product_name
     * @param color color
     * @param size size
     * @return lists
     */
    @Select("select * from product_view where product_id = #{product_id} OR product_name= #{product_name}" +
            "   OR color = #{color} or size =#{size}")
    List<Product> findProduct(@Param("product_id") String product_id, @Param("product_name") String product_name, @Param("color") String color, @Param("size") int size);


    /**
     * 添加货品
     * @param product Product
     * @throws SQLException sql
     */
    @Insert("CALL pro_product(#{product_id},#{size},#{product_name}, #{color}, #{ex_price},#{price})")
    @Options(statementType = StatementType.CALLABLE)
    void addProduct(Product product) throws SQLException;

    /**
     * 编辑product和product_price表
     * @param id 货品序号
     * @param product Product
     * @throws SQLException sql
     */
    @Update("UPDATE product,product_price SET product_name=#{product.product_name},size=#{product.size},color=#{product.color},ex_price=#{product.ex_price}, price=#{product.price} WHERE product.id = #{product.id};")
    void updateUser(@Param("id") Integer id,@Param("product") Product product) throws SQLException;

    /**
     * 根据id删除货品
     * @param id 货品id
     */
    @Delete("delete from product where id=#{id}")
    void deleteProduct(int id);
}
