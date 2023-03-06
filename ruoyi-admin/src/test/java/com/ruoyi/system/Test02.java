package com.ruoyi.system;
import java.util.Date;

import cn.hutool.core.bean.BeanUtil;


import com.ruoyi.system.domain.Mark;
import com.ruoyi.system.domain.MarkAmend;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;

@SpringBootTest
public class Test02 {


    @Test
    void test01(){
        Mark mark=new Mark();
        mark.setId(1000l);
        mark.setUserId(0L);
        mark.setUsername("");
        mark.setCjkh(0.0D);
        mark.setWssx(0.0D);
        mark.setHzgj(0.0D);
        mark.setCxfz(0.0D);
        mark.setAvgScore(0.0D);
        mark.setScoringTime(new Date());
        mark.setExplanation("");
        mark.setIsDeleted(0);
        mark.setCreateBy("");
        mark.setCreateTime(new Date());
        mark.setUpdateBy("");
        mark.setUpdateTime(new Date());
        mark.setRemark("");

        MarkAmend markAmend1 = BeanUtil.copyProperties(mark, MarkAmend.class,new String[]{"id"});
        System.out.println(markAmend1);


    }
}
