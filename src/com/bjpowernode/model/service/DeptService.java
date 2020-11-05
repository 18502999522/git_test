package com.bjpowernode.model.service;

import com.bjpowernode.entity.Dept;
import com.bjpowernode.model.dao.IDeptDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName DeptService
 * @Description 一句话描述此类或方法的作用
 * @author PowerNode
 * @Date 2020/10/19 11:58
 * @version 1.0
 */
@Service
public class DeptService implements IDeptService{

    @Autowired
    IDeptDao deptDao;

    @Override
    public List<Dept> list() {
        return deptDao.selectAll();
    }
}
