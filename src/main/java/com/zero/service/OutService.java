/**
 * @Copyright:2020
 * @Author:Zero
 * @LastModified:2020-05-04 11:58:45
 * 出库单据服务层接口类
 */

package com.zero.service;

import com.zero.domain.Out;

import java.sql.SQLException;
import java.util.List;

public interface OutService {
    /**
     * 查询所有出库单据信息
     * @param page 分页
     * @param size 大小
     * @return list
     */
    List<Out> findAll(int page, int size);

    /**
     * 一对多 懒加载 查询出库单据信息包含product
     * @param id 单据编号
     * @return Out
     */
    Out findProduct(String id);

    /**
     * 查询单据
     * @param id id
     * @param name name
     * @param time1 起始时间
     * @param time2 结束时间
     * @return lists
     */
    List<Out> findOut(String time1,String time2, String name, String id);

    /**
     * 添加入库单据，采用存储过程
     * @param out Out类
     * @throws SQLException SQL异常
     */
    void addOut(Out out) throws SQLException;

    /**
     * 修改单据信息
     * @param out Out实体类
     */
    void updateOut(Out out);

    /**
     * 根据uuid删除单据
     * @param id 货品id
     */
    void deleteOut(String id);
}
