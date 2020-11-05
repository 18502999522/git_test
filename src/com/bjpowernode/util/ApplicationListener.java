package com.bjpowernode.util;

import com.bjpowernode.entity.Dept;
import com.bjpowernode.model.service.IDeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName ApplicationListener
 * @Description 一句话描述此类或方法的作用
 * @author PowerNode
 * @Date 2020/10/20 9:05
 * @version 1.0
 */

public class ApplicationListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {

        //从event当中取application
        ServletContext application =  sce.getServletContext();

        /*
         * 查部门列表数据放入application当中
         */
        //从application当中取IOC容器
        WebApplicationContext webApplicationContext= WebApplicationContextUtils.getWebApplicationContext(application);

        //从IOC容器当中取IDeptService
        IDeptService  deptService = webApplicationContext.getBean(IDeptService.class);

        //查部门列表数据
        List<Dept> list = deptService.list();

        Map<Integer,Dept> map = new LinkedHashMap<>();

        for(Dept d : list){

            map.put(d.getDeptId(),d );
        }

        //放入application当中
        application.setAttribute(Constants.DEPTMAP_IN_APPLICATION,map);


    }
}
