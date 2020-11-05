package com.bjpowernode.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * t_employee
 * @author 
 */
public class Employee implements Serializable {
    private Integer emplId;

    private String emplNo;

    private String emplName;

    private String emplPwd;

    private String emplMail;

    private Integer emplSex;

    private Integer emplAge;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date emplExpireTime;

    private Integer emplLockState;

    private String emplAllowIps;

    private Integer deptId;

    private Date createTime;

    private Integer createBy;

    private Date updateTime;

    private Integer updateBy;

    private static final long serialVersionUID = 1L;

    public Integer getEmplId() {
        return emplId;
    }

    public void setEmplId(Integer emplId) {
        this.emplId = emplId;
    }

    public String getEmplNo() {
        return emplNo;
    }

    public void setEmplNo(String emplNo) {
        this.emplNo = emplNo;
    }

    public String getEmplName() {
        return emplName;
    }

    public void setEmplName(String emplName) {
        this.emplName = emplName;
    }

    public String getEmplPwd() {
        return emplPwd;
    }

    public void setEmplPwd(String emplPwd) {
        this.emplPwd = emplPwd;
    }

    public String getEmplMail() {
        return emplMail;
    }

    public void setEmplMail(String emplMail) {
        this.emplMail = emplMail;
    }

    public Integer getEmplSex() {
        return emplSex;
    }

    public void setEmplSex(Integer emplSex) {
        this.emplSex = emplSex;
    }

    public Integer getEmplAge() {
        return emplAge;
    }

    public void setEmplAge(Integer emplAge) {
        this.emplAge = emplAge;
    }

    public Date getEmplExpireTime() {
        return emplExpireTime;
    }

    public void setEmplExpireTime(Date emplExpireTime) {
        this.emplExpireTime = emplExpireTime;
    }

    public Integer getEmplLockState() {
        return emplLockState;
    }

    public void setEmplLockState(Integer emplLockState) {
        this.emplLockState = emplLockState;
    }

    public String getEmplAllowIps() {
        return emplAllowIps;
    }

    public void setEmplAllowIps(String emplAllowIps) {
        this.emplAllowIps = emplAllowIps;
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getCreateBy() {
        return createBy;
    }

    public void setCreateBy(Integer createBy) {
        this.createBy = createBy;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(Integer updateBy) {
        this.updateBy = updateBy;
    }
}