package com.bjpowernode.util;
/**
 * @ClassName UploadResult
 * @Description 一句话描述此类或方法的作用
 * @author PowerNode
 * @Date 2020/10/14 10:21
 * @version 1.0
 */
public class UploadResult {

    private boolean isSuccessed = false;//是否成功

    private String path;//保存路径

    private long size;//文件的大小

    private String fileRealName;//文件的真实名称

    private String msg;//返回的消息


    public boolean isSuccessed() {
        return isSuccessed;
    }

    public void setSuccessed(boolean successed) {
        isSuccessed = successed;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public long getSize() {
        return size;
    }

    public void setSize(long size) {
        this.size = size;
    }

    public String getFileRealName() {
        return fileRealName;
    }

    public void setFileRealName(String fileRealName) {
        this.fileRealName = fileRealName;
    }


    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
