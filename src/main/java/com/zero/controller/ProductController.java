/**
 * @Copyright:2020
 * @Author:Zero
 * @LastModified:2020-05-01 21:30:44
 */

package com.zero.controller;

import com.github.pagehelper.PageInfo;
import com.zero.domain.Product;
import com.zero.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.sql.SQLException;
import java.util.List;

@Controller
@RequestMapping("product")
public class ProductController {
    @Resource(name = "productService")
    private ProductService productService;
    @RequestMapping("findAll.do")
    public ModelAndView findALL(@RequestParam(name = "page",required = false,defaultValue = "1") int page,
                                @RequestParam(name = "size",required = false,defaultValue = "4")int size){
        List<Product> products = productService.findAll(page, size);
        PageInfo pageInfo = new PageInfo(products);
        ModelAndView mv = new ModelAndView();
        mv.addObject("pageInfo", pageInfo);
        mv.setViewName("product/list");
        return mv;
    }

    @RequestMapping("findAllByName.do")
    public ModelAndView findAllByName(@RequestParam(name = "product_id", required = false, defaultValue = " ") String product_id,
                                      @RequestParam(name = "product_name", required = false, defaultValue = " ") String product_name,
                                      @RequestParam(name = "color", required = false, defaultValue = " ") String color,
                                      @RequestParam(name = "size", required = false, defaultValue ="0") Integer size) {
        ModelAndView mv = new ModelAndView();
        System.out.println("product_id: " + product_id + ", product_name: " + product_name +
                ", color: " + color + ", size " + size);
        List<Product> products = productService.findProduct(product_id, product_name, color, size);
        mv.addObject("products", products);
        mv.setViewName("product/list");
        return mv;
    }

    @RequestMapping("addProduct.do")
    public String addProduct(Product product) throws Exception {
        System.out.println(product);
        productService.addProduct(product);
        return "redirect:findAll.do";
    }

    @RequestMapping("updateProduct.do")
    public String updateProduct(Integer id, Product product) throws SQLException{
        System.out.println(product);
        productService.updateProduct(id, product);
        return "redirect:findAll.do";
    }

    @RequestMapping("deleteProduct.do")
    public String deleteProduct(int id){
        productService.deleteProduct(id);
        return "redirect:findAll.do";
    }
}
