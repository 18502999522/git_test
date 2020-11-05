package com.bjpowernode.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @ClassName IndexController
 * @Description TODO
 * @Author 闫飞
 * @Date 2020/10/15 14:08
 * @Version 1.0
 */
@Controller
public class IndexController {

    @RequestMapping("index")
    void index(){

    }

    @RequestMapping("work_index")
    String workIndex(){

        return "workbench/main/index";
    }
}
