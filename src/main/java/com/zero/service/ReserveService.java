/**
 * @Copyright:2020
 * @Author:Zero
 * @LastModified:2020-05-04 17:09:08
 */

package com.zero.service;

import com.zero.domain.Reserve;

import java.util.List;

public interface ReserveService {
    /**
     * 查询所有库存信息
     * @param page 分页
     * @param size 大小
     * @return list
     */
    List<Reserve> findAll(int page, int size);

    /**
     * 查询库存
     * @param no 货物序号
     * @param name name 仓库名
     * @return lists
     */
    List<Reserve> findReserve(String no, String name);

    /**
     * 修改库存
     * @param reserve 库存
     */
    void updateReserve(Reserve reserve);

    /**
     * 根据id删除库存
     * @param id 库存编号
     */
    void deleteReserve(String id);
}
