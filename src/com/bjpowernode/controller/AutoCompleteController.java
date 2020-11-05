package com.bjpowernode.controller;

import com.bjpowernode.entity.Dept;
import com.bjpowernode.util.Constants;
import com.bjpowernode.util.Util;
import com.fasterxml.jackson.core.SerializableString;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

/**
 * @ClassName AutoCompleteController
 * @Description 一句话描述此类或方法的作用
 * @author PowerNode
 * @Date 2020/10/20 16:22
 * @version 1.0
 */
@Controller
public class AutoCompleteController {

    @RequestMapping("complete")
    public String complete(){
        return "auto_complete";
    }

    @RequestMapping("complete_data")
    @ResponseBody
    public Collection<Object> completeData(){

        Map<String,Object> map = (Map<String,Object>)Util.getObjectFromApplication(Constants.DEPTMAP_IN_APPLICATION);

        int i = 19;
        return map.values();

    }


}
