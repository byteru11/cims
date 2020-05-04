/**
 * @Copyright:2020
 * @Author:Zero
 * @LastModified:2020-05-02 17:20:44
 * 仓库持久层接口
 */

package com.zero.dao;

import com.zero.domain.Ware;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WareDao {
    /**
     * 查询所有仓库信息
     * @return list
     */
    @Select("SELECT * FROM warehouse")
    List<Ware> findAll();

    /**
     * 查询仓库
     * @param id id
     * @param name name
     * @return lists
     */
    @Select("SELECT * FROM warehouse WHERE name LIKE '${name}%' OR id=#{id}")
    List<Ware> findWare(@Param("id") Integer id, @Param("name") String name);

    /**
     * 添加仓库
     * @param name name
     */
    @Insert("INSERT INTO warehouse(name) values (#{name})")
    void addWare(String name);

    /**
     * 修改仓库名
     * @param id id
     * @param name name
     */
    @Update("UPDATE warehouse SET name = #{name} WHERE id = #{id}")
    void updateWare(@Param("id") Integer id,@Param("name") String name);

    /**
     * 根据id删除货品
     * @param id 货品id
     */
    @Delete("delete from warehouse where id=#{id}")
    void deleteWare(Integer id);
}
