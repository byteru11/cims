/**
 * @Copyright:2020
 * @Author:Zero
 * @LastModified:2020-04-19 15:59:35
 */

package com.zero.utils;

import org.springframework.core.convert.converter.Converter;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class SpringConverter implements Converter<String, Date> {
    @Override
    public Date convert(String s) {
        Date date = null;
        DateFormat df = new SimpleDateFormat("yyMMdd");
        try {
            date = df.parse(s);
            return date;
        } catch (ParseException e) {
            e.printStackTrace();
            System.out.println("类型转换失败");
        }
        return null;
    }
}
