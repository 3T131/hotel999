package com.accp.converter;

import org.springframework.core.convert.converter.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 定义了自定义转换器（转换日期的）
 * 实现Converter<String ,Obj>接口，String指的是传入参数，Obj指的是转出参数
 */
public class DateConverter implements Converter<String,Date> {

    //传入转换格式
    private String format;

    public void setFormat(String format) {
        this.format = format;
    }

    /**
     * 转换方法，自己定义,
     * 最后走springmvc中配置自定义转换器
     * @param s
     * @return
     */
    public Date convert(String s) {
        Date date=null;
        try {
             date = new SimpleDateFormat(format).parse(s);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }
}
