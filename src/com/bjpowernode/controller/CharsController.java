package com.bjpowernode.controller;

import com.bjpowernode.model.dao.IActivityDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.*;

/**
 * @ClassName CharsController
 * @Description TODO
 * @Author 闫飞
 * @Date 2020/10/28 21:34
 * @Version 1.0
 */
@Controller
@RequestMapping("chars")
public class CharsController {

    @Autowired
    IActivityDao activityDao;

    @RequestMapping("activity")
    List<Integer> activity(){

        return activityDao.countYearNum();
    }

    @RequestMapping("clue")
    List<Integer> clue(){

        return activityDao.countYearNum2();
    }

    @RequestMapping("deal")
    Map<String,Object>  deal(){

        Map<String,Object> requestMap = new HashMap<>();

        Set<String> typeList = new LinkedHashSet<>();
        requestMap.put("typeList",typeList);

        List<List<Long>> dataList = new ArrayList<>();
        requestMap.put("dataList",dataList);


        List<Map<String,Object>> list = activityDao.countYearNum3();

        String typeName = "";
        int i = -1;

        for(Map<String,Object> data : list){

            String dealType = (String)data.get("deal_type");
            typeList.add("\"" + dealType + "\"");

            Long dealCount = (Long)data.get("count");

            List<Long> typeDataList;

            if(typeName.equals(dealType)){

                typeDataList = dataList.get(i);

            }else{

                typeDataList = new ArrayList<>();
                dataList.add(typeDataList);
                i++;
                typeName = dealType;
            }
            typeDataList.add(dealCount);
        }

        return requestMap;
    }
}
