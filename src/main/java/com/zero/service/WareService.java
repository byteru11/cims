/**
 * @Copyright:2020
 * @Author:Zero
 * @LastModified:2020-05-02 17:40:46
 */

package com.zero.service;

import com.zero.domain.Ware;

import java.util.List;

public interface WareService {
    /**
     * 查询所有仓库信息
     * @param page 分页 当前页
     * @param size 每页数量
     * @return list
     */
    List<Ware> findAll(int page, int size);

    /**
     * 查询仓库
     * @param id id
     * @param name name
     * @return lists
     */
    List<Ware> findWare(Integer id,String name);

    /**
     * 添加仓库
     * @param name name
     */
    void addWare(String name);

    /**
     * 修改仓库名
     * @param id id
     * @param name name
     */
    void updateWare(Integer id,String name);

    /**
     * 根据id删除货品
     * @param id 货品id
     */
    void deleteWare(Integer id);
}
