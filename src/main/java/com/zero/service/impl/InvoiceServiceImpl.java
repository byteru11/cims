/**
 * @Copyright:2020
 * @Author:Zero
 * @LastModified:2020-05-03 17:24:49
 */

package com.zero.service.impl;

import com.github.pagehelper.PageHelper;
import com.zero.dao.InvoiceDao;
import com.zero.domain.Invoice;
import com.zero.service.InvoiceService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.SQLException;
import java.util.List;

@Service("invoiceService")
public class InvoiceServiceImpl implements InvoiceService {
    @Resource(name = "invoiceDao")
    private InvoiceDao invoiceDao;

    @Override
    public List<Invoice> findAll(int page, int size) {
        PageHelper.startPage(page, size);
        return invoiceDao.findAll();
    }

    @Override
    public Invoice findProduct(String id) {
        return invoiceDao.findProduct(id);
    }

    @Override
    public List<Invoice> findInvoice(String time1, String time2, String name, String id) {
        return invoiceDao.findInvoice(time1, time2, name, id);
    }

    @Override
    public void addInvoice(Invoice invoice) throws SQLException {
        invoiceDao.addInvoice(invoice);
    }

    @Override
    public void updateInvoice(Invoice invoice) {
        invoiceDao.updateInvoice(invoice);
    }

    @Override
    public void deleteInvoice(String id) {
        invoiceDao.deleteInvoice(id);
    }
}
