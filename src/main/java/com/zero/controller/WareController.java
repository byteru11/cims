/**
 * @Copyright:2020
 * @Author:Zero
 * @LastModified:2020-05-02 17:44:37
 */

package com.zero.controller;

import com.github.pagehelper.PageInfo;
import com.zero.domain.Ware;
import com.zero.service.WareService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("ware")
public class WareController {
    @Resource(name = "wareService")
    private WareService wareService;

    @RequestMapping("findAll.do")
    public ModelAndView findALL(@RequestParam(name = "page",required = false,defaultValue = "1") int page,
                                @RequestParam(name = "size",required = false,defaultValue = "4")int size){
        List<Ware> wares = wareService.findAll(page, size);
        PageInfo pageInfo = new PageInfo(wares);
        ModelAndView mv = new ModelAndView();
        mv.addObject("pageInfo", pageInfo);
        mv.setViewName("ware/list");
        return mv;
    }

    @RequestMapping("findAllByName.do")
    public ModelAndView findAllByName(@RequestParam(name = "id", required = false, defaultValue = " ") Integer id,
                                      @RequestParam(name = "name", required = false, defaultValue = " ") String name) {
        ModelAndView mv = new ModelAndView();
        System.out.println("id: " + id + ", name: " + name);
        List<Ware> wares = wareService.findWare(id, name);
        mv.addObject("wares", wares);
        mv.setViewName("ware/list");
        return mv;
    }

    @RequestMapping("addWare.do")
    public String addWare(String name){
        System.out.println(name);
        wareService.addWare(name);
        return "redirect:findAll.do";
    }

    @RequestMapping("updateWare.do")
    public String updateWare(Integer id, String name){
        System.out.println(id + ", " + name );
        wareService.updateWare(id, name);
        return "redirect:findAll.do";
    }

    @RequestMapping("deleteWare.do")
    public String deleteWare(int id){
        wareService.deleteWare(id);
        return "redirect:findAll.do";
    }
}
