/**
 * @Copyright:2020
 * @Author:Zero
 * @LastModified:2020-05-02 17:42:00
 */

package com.zero.service.impl;

import com.github.pagehelper.PageHelper;
import com.zero.dao.WareDao;
import com.zero.domain.Ware;
import com.zero.service.WareService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("wareService")
public class WareServiceImpl implements WareService {
    @Resource(name = "wareDao")
    private WareDao wareDao;

    @Override
    public List<Ware> findAll(int page, int size) {
        PageHelper.startPage(page, size);
        return wareDao.findAll();
    }

    @Override
    public List<Ware> findWare(Integer id, String name) {
        return wareDao.findWare(id, name);
    }

    @Override
    public void addWare(String name) {
        wareDao.addWare(name);
    }

    @Override
    public void updateWare(Integer id, String name) {
        wareDao.updateWare(id, name);
    }

    @Override
    public void deleteWare(Integer id) {
        wareDao.deleteWare(id);
    }
}
