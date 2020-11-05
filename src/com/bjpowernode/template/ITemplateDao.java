package com.bjpowernode.template;

import java.io.Serializable;
import java.util.List;

/**
 * @ClassName ITemplateDao
 * @Description TODO
 * @Author 闫飞
 * @Date 2020/10/15 16:51
 * @Version 1.0
 */
public interface ITemplateDao<T> {

    int deleteByPrimaryKey(Serializable deptId);

    int insert(T record);

    int insertSelective(T record);

    T selectByPrimaryKey(Serializable deptId);

    List<T> selectAll();

    int updateByPrimaryKeySelective(T record);

    int updateByPrimaryKey(T record);
}
