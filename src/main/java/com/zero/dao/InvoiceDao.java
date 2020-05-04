/**
 * @Copyright:2020
 * @Author:Zero
 * @LastModified:2020-05-02 21:54:50
 * 单据持久层接口
 */

package com.zero.dao;

import com.zero.domain.Invoice;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.List;

@Repository
public interface InvoiceDao {
    /**
     * 查询所有单据信息
     * @return list
     */
    @Select("SELECT * FROM invoice ORDER BY date")
    List<Invoice> findAll();

    /**
     * 一对多 懒加载 查询出库单据信息包含product
     * @param id 单据编号
     * @return invoice
     */
    @Select("SELECT * FROM invoice WHERE id=#{id}")
    @Results({
            @Result(property = "product", column = "no", many = @Many(select = "com.zero.dao.ProductDao.findProductByOutId",fetchType = FetchType.LAZY))
    })
    Invoice findProduct(String id);

    /**
     * 查询单据
     * @param id id
     * @param name name
     * @param time1 起始时间
     * @param time2 结束时间
     * @return lists
     */
    @Select("SELECT * FROM invoice WHERE date BETWEEN #{time1} AND #{time2} OR name LIKE CONCAT('%',#{name},'%') OR id=#{id} ")
    List<Invoice> findInvoice(@Param("time1") String time1, @Param("time2") String time2, @Param("name") String name, @Param("id") String id);

    /**
     * 添加入库单据，采用存储过程
     * @param invoice invoice类
     * @throws SQLException SQL异常
     */
    @Insert("INSERT INTO invoice(NAME,USERNAME, `from`, TEXT, NO, NUMBER) VALUES( #{invoice.name},#{invoice.username},#{invoice.from}, #{invoice.text}, #{invoice.no},#{invoice.number} )")
    void addInvoice(@Param("invoice") Invoice invoice) throws SQLException;

    /**
     * 修改单据信息
     * @param invoice invoice实体类
     */
    @Update("UPDATE invoice SET name=#{invoice.name}, username=#{invoice.username},`from`=#{invoice.from}, text=#{invoice.text}, " +
            "no=#{invoice.no}, number=#{invoice.number}  WHERE id = #{invoice.id} ")
    void updateInvoice(@Param("invoice") Invoice invoice);

    /**
     * 根据uuid删除单据
     * @param id 货品id
     */
    @Delete("delete from Invoice where id=#{id}")
    void deleteInvoice(String id);

}
