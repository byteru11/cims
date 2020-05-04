/**
 * @Copyright:2020  
 * @Author:Zero
 * @LastModified:2020-05-04 17:16:27
 */

package com.zero.controller;

import com.github.pagehelper.PageInfo;
import com.zero.domain.Reserve;
import com.zero.service.ReserveService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("reserve")
public class ReserveController {
    @Resource(name = "reserveService")
    private ReserveService reserveService;

    @RequestMapping("findAll.do")
    public ModelAndView findALL(@RequestParam(name = "page",required = false,defaultValue = "1") int page,
                                @RequestParam(name = "size",required = false,defaultValue = "4")int size){
        List<Reserve> reserves = reserveService.findAll(page, size);
        PageInfo pageInfo = new PageInfo(reserves);
        ModelAndView mv = new ModelAndView();
        mv.addObject("pageInfo", pageInfo);
        mv.setViewName("reserve/list");
        return mv;
    }

    @RequestMapping("findReserve.do")
    public ModelAndView findReserve(@RequestParam(name = "id", required = false, defaultValue = " ") String no,
                                      @RequestParam(name = "name", required = false, defaultValue = " ") String name) {
        ModelAndView mv = new ModelAndView();
        System.out.println("no: " + no + ", name: " + name);
        List<Reserve> reserves = reserveService.findReserve(no, name);
        mv.addObject("reserves", reserves);
        mv.setViewName("reserve/list");
        return mv;
    }

    @RequestMapping("updateReserve.do")
    public String updateReserve(Reserve reserve){
        System.out.println(reserve);
        reserveService.updateReserve(reserve);
        return "redirect:findAll.do";
    }

    @RequestMapping("deleteReserve.do")
    public String deleteReserve(String id){
        reserveService.deleteReserve(id);
        return "redirect:findAll.do";
    }
}
