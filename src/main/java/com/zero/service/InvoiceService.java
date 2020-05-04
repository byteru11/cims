/**
 * @Copyright:2020
 * @Author:Zero
 * @LastModified:2020-05-03 17:21:23
 */

package com.zero.service;

import com.zero.domain.Invoice;

import java.sql.SQLException;
import java.util.List;

public interface InvoiceService {
    /**
     * 查询所有单据信息
     * @param page 分页
     * @param size 大小
     * @return list
     */
    List<Invoice> findAll(int page, int size);

    /**
     * 一对一查询单据信息包含product
     * @param id 单据编号
     * @return invoice
     */
    Invoice findProduct(String id);

    /**
     * 查询单据
     * @param id id
     * @param name name
     * @param time1 起始时间
     * @param time2 结束时间
     * @return lists
     */
    List<Invoice> findInvoice(String time1, String time2, String name, String id);

    /**
     * 添加入库单据，采用存储过程
     * @param invoice invoice类
     * @throws SQLException SQL异常
     */
    void addInvoice(Invoice invoice) throws SQLException;

    /**
     * 修改单据信息
     * @param invoice invoice实体类
     */
    void updateInvoice(Invoice invoice);

    /**
     * 根据uuid删除单据
     * @param id 货品id
     */
    void deleteInvoice(String id);
}
