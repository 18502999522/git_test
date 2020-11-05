package com.bjpowernode.template;

import java.io.Serializable;
import java.util.List;

/**
 * @ClassName TemplateController
 * @Description TODO
 * @Author 闫飞
 * @Date 2020/10/15 17:06
 * @Version 1.0
 */
public abstract class TemplateController<T> {


    public List<T> list(){

      return getTemplateService().list();
    }


    public T get(Serializable id){

        return getTemplateService().get(id);
    }


    public T update(Serializable id){

        return getTemplateService().get(id);
    }


    public String saveUpdate(T obj){

        getTemplateService().update(obj);

        return "redirect:list";
    }


    public void add(){

    }


    public void save(T obj){

        getTemplateService().save(obj);
    }

    public void delete(Serializable id){

        getTemplateService().delete(id);
    }

    public abstract ITemplateService<T> getTemplateService();
}
