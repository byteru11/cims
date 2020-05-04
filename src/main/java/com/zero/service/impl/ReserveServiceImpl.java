/**
 * @Copyright:2020
 * @Author:Zero
 * @LastModified:2020-05-04 17:12:14
 */

package com.zero.service.impl;

import com.github.pagehelper.PageHelper;
import com.zero.dao.ReserveDao;
import com.zero.domain.Reserve;
import com.zero.service.ReserveService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("reserveService")
public class ReserveServiceImpl implements ReserveService {
    @Resource(name = "reserveDao")
    private ReserveDao reserveDao;

    @Override
    public List<Reserve> findAll(int page, int size) {
        PageHelper.startPage(page, size);
        return reserveDao.findAll();
    }

    @Override
    public List<Reserve> findReserve(String no, String name) {
        return reserveDao.findReserve(no, name);
    }

    @Override
    public void updateReserve(Reserve reserve) {
        reserveDao.updateReserve(reserve);
    }

    @Override
    public void deleteReserve(String id) {
        reserveDao.deleteReserve(id);
    }
}
