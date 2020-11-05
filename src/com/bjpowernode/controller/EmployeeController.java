package com.bjpowernode.controller;

import com.bjpowernode.entity.Employee;
import com.bjpowernode.model.service.IEmployeeService;
import com.bjpowernode.template.ITemplateService;
import com.bjpowernode.template.TemplateController;
import com.bjpowernode.util.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.Serializable;
import java.util.List;

/**
 * @ClassName EmployeeController
 * @Description TODO
 * @Author 闫飞
 * @Date 2020/10/15 17:05
 * @Version 1.0
 */
@Controller
@RequestMapping("employee")
public class EmployeeController{

    @Autowired
    IEmployeeService employeeService;

    @RequestMapping("list")
    public PageInfo<Employee> list() {

        PageInfo<Employee> list = new PageInfo<>();
        list.setList(employeeService.list());

        return list;
    }

    @RequestMapping("get")
    public Employee get(int id) {
        return employeeService.get(id);
    }

    @RequestMapping("getAjax")
    @ResponseBody
    public Employee getAjax(int id) {
        return employeeService.get(id);
    }

    @RequestMapping("add")
    public void add() {
    }

    @RequestMapping("save")
    public String save(Employee obj) {
        employeeService.save(obj);
        return "redirect:list";
    }

    @RequestMapping("update")
    public Employee update(int id) {
        return employeeService.get(id);
    }

    @RequestMapping("saveUpdate")
    public String saveUpdate(Employee obj) {
        employeeService.update(obj);
        return "redirect:list";
    }

    @RequestMapping("delete")
    public String delete(Serializable id) {
        employeeService.delete(id);
        return "redirect:list";
    }

    @RequestMapping("delBatch")
    public String delBatch(int[] emplId) {

        for(Serializable id : emplId){
            employeeService.delete(id);
        }

        return "redirect:list";
    }



}