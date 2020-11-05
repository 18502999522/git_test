package com.bjpowernode.util;

import java.io.IOException;
import java.util.Properties;

/**
 * @ClassName Config
 * @Description 一句话描述此类或方法的作用
 * @author PowerNode
 * @Date 2020/10/14 10:04
 * @version 1.0
 */
public class Config {

    private static  Properties configProperties = new Properties();

    static{

        try {
            configProperties.load(Config.class.getClassLoader().getResourceAsStream("config.properties"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static String  getUploadPath(){

        return configProperties.getProperty("upload_path");
    }


    public static void main(String[] args) {
        System.out.println(getUploadPath());
    }
}
