/**
 * @Copyright:2020
 * @Author:Zero
 * @LastModified:2020-05-04 12:02:38
 */

package com.zero.service.impl;

import com.github.pagehelper.PageHelper;
import com.zero.dao.OutDao;
import com.zero.domain.Out;
import com.zero.service.OutService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.SQLException;
import java.util.List;

@Service("outService")
public class OutServiceImpl implements OutService {
    @Resource(name = "outDao")
    private OutDao outDao;

    @Override
    public List<Out> findAll(int page, int size) {
        PageHelper.startPage(page, size);
        return outDao.findAll();
    }

    @Override
    public Out findProduct(String id) {
        return outDao.findProduct(id);
    }

    @Override
    public List<Out> findOut(String time1, String time2, String name, String id) {
        return outDao.findOut(time1, time2, name, id);
    }

    @Override
    public void addOut(Out out) throws SQLException {
        outDao.addOut(out);
    }

    @Override
    public void updateOut(Out out) {
        outDao.updateOut(out);
    }

    @Override
    public void deleteOut(String id) {
        outDao.deleteOut(id);
    }
}
