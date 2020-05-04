/**
 * @Copyright:2020
 * @Author:Zero
 * @LastModified:2020-04-20 14:01:35
 */

package com.zero.controller;


import com.github.pagehelper.PageInfo;
import com.zero.domain.User;
import com.zero.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.sql.SQLException;
import java.util.List;

@Controller
@SessionAttributes(value = "uid")
@RequestMapping("user")
public class UserController {
    @Resource(name = "userService")
    private UserService userService;
//    // 未分页查询
//    @RequestMapping("findAll")
//    public ModelAndView findAll(){
//        List<User> users = userService.findAll();
//        ModelAndView mv = new ModelAndView();
//        mv.addObject("users", users);
//        mv.setViewName("member/list");
//        return mv;
//    }

    @RequestMapping("findAll.do")
    public ModelAndView findAll(@RequestParam(name = "page",required = true,defaultValue = "1") int page,
        @RequestParam(name = "size",required = true,defaultValue = "5")int size) throws Exception {
        List<User> users = userService.findAll(page, size);
        PageInfo pageInfo = new PageInfo(users);
        ModelAndView mv = new ModelAndView();
        mv.addObject("pageInfo", pageInfo);
        mv.setViewName("member/list");
        return mv;
    }

    @RequestMapping("findAllByName.do")
    public ModelAndView findAllByName(@RequestParam(name = "username", required = false, defaultValue = " ") String username,
                                      @RequestParam(name = "uid", required = false, defaultValue = " ") String uid) throws SQLException {
        ModelAndView mv = new ModelAndView();
        List<User> users = userService.findUserByName(username, uid);
        mv.addObject("users", users);
        mv.setViewName("member/list");
        return mv;
    }

    @RequestMapping("addUser.do")
    public String addUser(User user) throws Exception {
        System.out.println(user);
        userService.addUser(user);
        return "redirect:findAll.do";
    }

    @RequestMapping("updateUser.do")
    public String updateUser(int id, User user){
        userService.updateUser(id, user);
        return "redirect:findAll.do";
    }

    @RequestMapping("deleteUser.do")
    public String deleteUser(int id){
        userService.deleteUser(id);
        return "redirect:findAll.do";
    }

    @RequestMapping("findPassword.do")
    public ModelAndView findPassword(String uid, String password){
        String pwd = userService.findPasswordByUid(uid);
        System.out.println("登录名：" + uid + ", 查询密码：" + pwd);
        System.out.println("输入密码：" + password);
        ModelAndView mv = new ModelAndView();
        if (pwd != null && pwd.length() > 0){
            if (password.equals(pwd)){
                mv.setViewName("redirect:../index.jsp");
                mv.addObject("uid", uid);
            }
        }else {
            mv.setViewName("redirect:../login.jsp");
        }
        return mv;
    }
}
