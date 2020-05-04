/**
 * @Copyright:2020
 * @Author:Zero
 * @LastModified:2020-05-01 21:25:10
 * 服务层接口实现类
 */

package com.zero.service.impl;

import com.github.pagehelper.PageHelper;
import com.zero.dao.ProductDao;
import com.zero.domain.Product;
import com.zero.service.ProductService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.SQLException;
import java.util.List;

@Service("productService")
public class ProductServiceImpl implements ProductService {
    @Resource(name = "productDao")
    private ProductDao productDao;
    @Override
    public List<Product> findAll(int page, int size) {
        PageHelper.startPage(page, size);
        return productDao.findAll();
    }

    @Override
    public List<Product> findProduct(String product_id, String product_name, String color, int size) {
        return productDao.findProduct(product_id, product_name, color, size);
    }

    @Override
    public void addProduct(Product product) throws SQLException {
        productDao.addProduct(product);
    }

    @Override
    public void updateProduct(Integer id, Product product) throws SQLException {
        productDao.updateUser(id, product);
    }

    @Override
    public void deleteProduct(int id) {
        productDao.deleteProduct(id);
    }
}
