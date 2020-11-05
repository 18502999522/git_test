package com.bjpowernode.model.dao;

import java.util.List;
import java.util.Map;

/**
 * @ClassName IActivityDao
 * @Description TODO
 * @Author 闫飞
 * @Date 2020/10/28 22:06
 * @Version 1.0
 */
public interface IActivityDao {

    List<Integer> countYearNum();

    List<Integer> countYearNum2();

    List<Map<String,Object>> countYearNum3();
}
