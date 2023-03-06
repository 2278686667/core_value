package com.ruoyi.system;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class test {
    public static void main(String[] args) {
//        test01();
//        test02();
        test03();
    }

    private static void test03() {
        Date date = new Date();
        Calendar calendar=new GregorianCalendar();
        calendar.setTime(date);
        // 把日期往后增加一天,整数  往后推,负数往前移动
        calendar.add(Calendar.MONTH,-1);
        Date time = calendar.getTime();
        System.out.println(time);
        System.out.println(calendar.get(Calendar.MONTH));
        Calendar calendar1=Calendar.getInstance();
        calendar1.add(Calendar.MONTH,-1);
        Date time1 = calendar1.getTime();
        System.out.println(time1);
    }

    private static void test02() {
        Date date=new Date();
        Calendar instance = Calendar.getInstance();
        instance.add(Calendar.MONTH,-1);
        int month = instance.get(Calendar.MONTH);
        int year = instance.get(Calendar.YEAR);
        System.out.println(month);


    }

    private static void test01() {
        Date date = new Date();
        Calendar calendar=new GregorianCalendar();
        calendar.setTime(date);
        // 把日期往后增加一天,整数  往后推,负数往前移动
        calendar.add(Calendar.MONTH,-1);
        Date time = calendar.getTime();
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat();
        String format = simpleDateFormat.format(time);
        System.out.println(format);

//        LocalDate now = LocalDate.now();
//        LocalDate localDate = now.plusDays(-1);
//        System.out.println(localDate);
    }
}
