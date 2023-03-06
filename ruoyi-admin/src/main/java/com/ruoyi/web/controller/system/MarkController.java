package com.ruoyi.web.controller.system;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.*;

import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.mapper.MarkMapper;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.Mark;
import com.ruoyi.system.service.IMarkService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 评分记录表Controller
 * 
 * @author cao
 * @date 2023-03-02
 */
@RestController
@RequestMapping("/system/mark")
public class MarkController extends BaseController
{
    @Autowired
    private IMarkService markService;

    /**
     * 查询评分记录表列表
     */
    @PreAuthorize("@ss.hasPermi('system:mark:list')")
    @GetMapping("/list")
    public TableDataInfo list(Mark mark)
    {
        startPage();
        mark.setUserId(SecurityUtils.getUserId());
        List<Mark> list = markService.selectMarkList(mark);
        return getDataTable(list);
    }
    @PreAuthorize("@ss.hasPermi('system:mark:listAdmin')")
    @GetMapping("/listAdmin")
    public TableDataInfo listAdmin(Mark mark)
    {
        startPage();
        List<Mark> list = markService.selectMarkList(mark);
        return getDataTable(list);
    }

    /**
     * 导出评分记录表列表
     */
    @PreAuthorize("@ss.hasPermi('system:mark:export')")
    @Log(title = "评分记录表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Mark mark)
    {
        List<Mark> list = markService.selectMarkList(mark);
        ExcelUtil<Mark> util = new ExcelUtil<Mark>(Mark.class);
        util.exportExcel(response, list, "评分记录表数据");
    }

    /**
     * 获取评分记录表详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:mark:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(markService.selectMarkById(id));
    }

    /**
     * 新增评分记录表
     */
    @PreAuthorize("@ss.hasPermi('system:mark:add')")
    @Log(title = "评分记录表", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Mark mark)
    {

        int i = formMarkValidation(mark);

        //设置上一个月
        mark.setScoringTime(lastMonth(mark.getScoringTime()));
        if (i==-1){
            return AjaxResult.error("输入参数错误");
        }

        Map<String, Object> params = mark.getParams();
                return toAjax(markService.insertMark(mark));
    }

    private int formMarkValidation(Mark mark) {
        Double cjkh = mark.getCjkh();
        Double wssx = mark.getWssx();
        Double hzgj = mark.getHzgj();
        Double cxfz = mark.getCxfz();
        if (Double.isNaN(cjkh)&&Double.isNaN(wssx)&&Double.isNaN(hzgj)&&Double.isNaN(cxfz)){
            return -1;
        }
        //设置平均分
        double avg = (cjkh + wssx + hzgj + cxfz) / 4;
        mark.setAvgScore(avg);


        return 0;
    }

    //获取上一个月日期
    private Date lastMonth(Date date) {
        Calendar calendar=new GregorianCalendar();
        calendar.setTime(date);
        // 把日期往后增加一天,整数  往后推,负数往前移动
//        calendar.add(Calendar.MONTH,-1);
//        Date time = calendar.getTime();

        dataRepetition(calendar);

        return calendar.getTime();
    }
    //判断当前用户是否填写过
    private void dataRepetition(Calendar calendar) {
        int monthNew = calendar.get(Calendar.MONTH);
        int yearNew = calendar.get(Calendar.YEAR);
        Mark mark1 = new Mark();
        mark1.setUserId(SecurityUtils.getUserId());
        List<Mark> marks = markService.selectMarkList(mark1);
        for (Mark mark : marks) {
            //数据库中存储的时间
            Date scoringTime = mark.getScoringTime();
            Calendar calendar1=new GregorianCalendar();
            calendar1.setTime(scoringTime);
            int monthSql = calendar1.get(Calendar.MONTH);
            int yearSql = calendar1.get(Calendar.YEAR);
            if (monthSql==monthNew&&yearSql==yearNew){
                throw new RuntimeException("本月已经填写过了");
            }
        }
    }

    /**
     * 修改评分记录表
     */
    @PreAuthorize("@ss.hasPermi('system:mark:edit')")
    @Log(title = "评分记录表", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Mark mark)
    {
        int i = formMarkValidation(mark);
        if (i==-1){
            return AjaxResult.error("输入参数错误");
        }
        return toAjax(markService.updateMark(mark));
    }

    /**
     * 删除评分记录表
     */
    @PreAuthorize("@ss.hasPermi('system:mark:remove')")
    @Log(title = "评分记录表", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(markService.deleteMarkByIds(ids));
    }
}
