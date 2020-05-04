/**
 * @Copyright:2020
 * @Author:Zero
 * @LastModified:2020-05-04 12:05:46
 * 入库单据控制层
 */

package com.zero.controller;

import com.github.pagehelper.PageInfo;
import com.zero.domain.Out;
import com.zero.service.OutService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.sql.SQLException;
import java.util.List;

@Controller
@RequestMapping("out")
public class OutController {
    @Resource(name = "outService")
    private OutService outService;

    @RequestMapping("findAll.do")
    public ModelAndView findALL(@RequestParam(name = "page",required = false,defaultValue = "1") int page,
                                @RequestParam(name = "size",required = false,defaultValue = "4")int size){
        List<Out> outs = outService.findAll(page, size);
        System.out.println(outs);
        PageInfo pageInfo = new PageInfo(outs);
        ModelAndView mv = new ModelAndView();
        mv.addObject("pageInfo", pageInfo);
        mv.setViewName("out/list");
        return mv;
    }

    @RequestMapping("findAllByName.do")
    public ModelAndView findAllByName(@RequestParam(name = "time1", required = false, defaultValue = " ") String time1,
                                      @RequestParam(name = "time2", required = false, defaultValue = " ") String time2,
                                      @RequestParam(name = "name", required = false, defaultValue = " ") String name,
                                      @RequestParam(name = "id", required = false, defaultValue =" ") String id) {
        ModelAndView mv = new ModelAndView();
        System.out.println("time1: " + time1 + ", time2: " + time2 +
                ", name: " + name + ", id:" + id +",");
        List<Out> outs = outService.findOut(time1, time2, name, id);
        System.out.println(outs);
        mv.addObject("outs", outs);
        mv.setViewName("out/list");
        return mv;
    }

    @RequestMapping("findProduct.do")
    public ModelAndView findProduct(String id){
        Out out = outService.findProduct(id);
        System.out.println(out);
        ModelAndView mv = new ModelAndView("out/details");
        mv.addObject("out",out);
        return mv;
    }

    @RequestMapping("addOut.do")
    public String addOut(Out out) throws Exception {
        System.out.println(out);
        outService.addOut(out);
        return "redirect:findAll.do";
    }

    @RequestMapping("updateOut.do")
    public String updateOut(Out out) throws SQLException {
        System.out.println(out);
        outService.updateOut(out);
        return "redirect:findAll.do";
    }

    @RequestMapping("deleteOut.do")
    public String deleteOut(String id){
        outService.deleteOut(id);
        return "redirect:findAll.do";
    }

}
