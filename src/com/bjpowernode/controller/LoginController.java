package com.bjpowernode.controller;

import com.bjpowernode.entity.Employee;
import com.bjpowernode.util.Util;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * @ClassName LoginController
 * @Description TODO
 * @Author 闫飞
 * @Date 2020/10/15 16:03
 * @Version 1.0
 */
@Controller
public class LoginController {

    @RequestMapping("login")
    public void login(){

    }

    @RequestMapping("saveLogin")
    public String saveLogin(HttpSession session){

        Employee employee = new Employee();
        employee.setEmplId(1);
        employee.setDeptId(1);

        session.setAttribute("LoginEmployee",employee);

        return "redirect:/index";
    }

    @RequestMapping("logout")
    public String logout(HttpSession session){

        session.removeAttribute("LoginEmployee");

        return "redirect:login";
    }

}
