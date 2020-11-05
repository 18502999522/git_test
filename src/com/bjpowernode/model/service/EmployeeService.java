package com.bjpowernode.model.service;

import com.bjpowernode.entity.Employee;
import com.bjpowernode.model.dao.IEmployeeDao;
import com.bjpowernode.template.ITemplateDao;
import com.bjpowernode.template.TemplateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @ClassName EmployeeService
 * @Description TODO
 * @Author 闫飞
 * @Date 2020/10/15 17:01
 * @Version 1.0
 */
@Service
public class EmployeeService extends TemplateService<Employee> implements IEmployeeService {

    @Autowired
    IEmployeeDao employeeDao;

    @Override
    public ITemplateDao<Employee> getTemplateDao() {
        return employeeDao;
    }
}
