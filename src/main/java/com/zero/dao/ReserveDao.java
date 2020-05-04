/**
 * @Copyright:2020
 * @Author:Zero
 * @LastModified:2020-05-04 16:52:06
 * 库存持久层接口类
 */

package com.zero.dao;

import com.zero.domain.Reserve;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReserveDao {
    /**
     * 查询所有库存信息
     * @return list
     */
    @Select("SELECT * FROM reserve ORDER BY no")
    List<Reserve> findAll();

    /**
     * 查询库存
     * @param no 货物序号
     * @param name name 仓库名
     * @return lists
     */
    @Select("SELECT * FROM reserve WHERE name LIKE CONCAT('%',#{name},'%') OR no=#{no} ORDER BY no")
    List<Reserve> findReserve(@Param("no") String no, @Param("name") String name);

    /**
     * 修改库存
     * @param reserve 库存
     */
    @Update("UPDATE reserve SET number = #{reserve.number},name=#{reserve.name} WHERE id=#{reserve.id}")
    void updateReserve(@Param("reserve") Reserve reserve);

    /**
     * 根据id删除库存
     * @param id 库存编号
     */
    @Delete("delete from Reserve where id=#{id}")
    void deleteReserve(String id);
}
