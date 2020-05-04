/**
 * @Copyright:2020
 * @Author:Zero
 * @LastModified:2020-05-03 18:14:13
 */

package com.zero.controller;

import com.github.pagehelper.PageInfo;
import com.zero.domain.Invoice;
import com.zero.service.InvoiceService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.sql.SQLException;
import java.util.List;

@Controller
@RequestMapping("invoice")
public class InvoiceController {
    @Resource(name = "invoiceService")
    private InvoiceService invoiceService;
    @RequestMapping("findAll.do")
    public ModelAndView findALL(@RequestParam(name = "page",required = false,defaultValue = "1") int page,
                                @RequestParam(name = "size",required = false,defaultValue = "4")int size){
        List<Invoice> invoices = invoiceService.findAll(page, size);
        PageInfo pageInfo = new PageInfo(invoices);
        ModelAndView mv = new ModelAndView();
        mv.addObject("pageInfo", pageInfo);
        mv.setViewName("invoice/list");
        return mv;
    }

    @RequestMapping("findAllByName.do")
    public ModelAndView findAllByName(@RequestParam(name = "time1", required = false, defaultValue = " ") String tiem1,
                                      @RequestParam(name = "time2", required = false, defaultValue = " ") String time2,
                                      @RequestParam(name = "name", required = false, defaultValue = " ") String name,
                                      @RequestParam(name = "id", required = false, defaultValue =" ") String id) {
        ModelAndView mv = new ModelAndView();
        System.out.println("time1: " + tiem1 + ", time2: " + time2 +
                ", name: " + name + ", id:" + id +",");
        List<Invoice> invoices = invoiceService.findInvoice(tiem1, time2, name, id);
        System.out.println(invoices);
        mv.addObject("invoices", invoices);
        mv.setViewName("invoice/list");
        return mv;
    }

    @RequestMapping("findProduct.do")
    public ModelAndView findProduct(String id){
        Invoice invoice = invoiceService.findProduct(id);
        System.out.println(invoice);
        ModelAndView mv = new ModelAndView("invoice/details");
        mv.addObject("invoice",invoice);
        return mv;
    }

    @RequestMapping("addInvoice.do")
    public String addInvoice(Invoice invoice) throws Exception {
        System.out.println(invoice);
        invoiceService.addInvoice(invoice);
        return "redirect:findAll.do";
    }

    @RequestMapping("updateInvoice.do")
    public String updateInvoice(Invoice invoice) throws SQLException {
        System.out.println(invoice);
        invoiceService.updateInvoice(invoice);
        return "redirect:findAll.do";
    }

    @RequestMapping("deleteInvoice.do")
    public String deleteInvoice(String id){
        invoiceService.deleteInvoice(id);
        return "redirect:findAll.do";
    }
}
