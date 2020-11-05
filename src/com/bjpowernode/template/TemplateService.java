package com.bjpowernode.template;

import java.io.Serializable;
import java.util.List;

/**
 * @ClassName TemplateService
 * @Description TODO
 * @Author 闫飞
 * @Date 2020/10/15 16:47
 * @Version 1.0
 */
public abstract class TemplateService<T> implements ITemplateService<T> {

    @Override
    public List<T> list() {
        return getTemplateDao().selectAll();
    }

    @Override
    public T get(Serializable id) {
        return getTemplateDao().selectByPrimaryKey(id);
    }

    @Override
    public void update(T obj) {

        getTemplateDao().updateByPrimaryKey(obj);
    }

    @Override
    public void save(T obj) {

        getTemplateDao().insert(obj);
    }

    @Override
    public void delete(Serializable id) {

        getTemplateDao().deleteByPrimaryKey(id);
    }

}
