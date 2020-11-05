package com.bjpowernode.template;

import java.io.Serializable;
import java.util.List;

/**
 * @ClassName ITemplateService
 * @Description 一句话描述此类或方法的作用
 * @author PowerNode
 * @Date 2020/10/14 14:31
 * @version 1.0
 */
public interface ITemplateService<T> {

    List<T> list();

    T get(Serializable id);

    void update(T obj);

    void save(T obj);

    void delete(Serializable id);

    ITemplateDao<T> getTemplateDao();


}
