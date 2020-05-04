/**
 * @Copyright:2020  
 * @Author:Zero
 * @LastModified:2020-05-04 11:41:19
 * 出库单据持久层接口类
 */

package com.zero.dao;

import com.zero.domain.Out;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.List;

@Repository
public interface OutDao {
    /**
     * 查询所有出库单据信息
     * @return list
     */
    @Select("SELECT * FROM out_ware ORDER BY date")
    List<Out> findAll();

    /**
     * 一对多 懒加载 查询出库单据信息包含product
     * @param id 单据编号
     * @return Out
     */
    @Select("SELECT * FROM Out_ware WHERE id=#{id}")
    @Results({
            @Result(property = "product", column = "no", many = @Many(select = "com.zero.dao.ProductDao.findProductByOutId",fetchType = FetchType.LAZY))
    })
    Out findProduct(String id);

    /**
     * 查询单据
     * @param id id
     * @param name name
     * @param time1 起始时间
     * @param time2 结束时间
     * @return lists
     */
    @Select("SELECT * FROM out_ware WHERE date BETWEEN #{time1} AND #{time2} OR name LIKE CONCAT('%',#{name},'%') OR id=#{id} ")
    List<Out> findOut(@Param("time1") String time1, @Param("time2") String time2, @Param("name") String name, @Param("id") String id);

    /**
     * 添加入库单据，采用存储过程
     * @param out Out类
     * @throws SQLException SQL异常
     */
    @Insert("INSERT INTO out_ware(NAME,USERNAME, `OUT`, TEXT, NO, NUMBER) VALUES( #{out.name},#{out.username},#{out.out}, #{out.text}, #{out.no},#{out.number} )")
    void addOut(@Param("out") Out out) throws SQLException;

    /**
     * 修改单据信息
     * @param out Out实体类
     */
    @Update("UPDATE Out_ware SET name=#{out.name}, username=#{out.username},`out`=#{out.out}, text=#{out.text}, " +
            "no=#{out.no}, number=#{out.number}  WHERE id = #{out.id} ")
    void updateOut(@Param("out") Out out);

    /**
     * 根据uuid删除单据
     * @param id 货品id
     */
    @Delete("delete from Out_ware where id=#{id}")
    void deleteOut(String id);
}
