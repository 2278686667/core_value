package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.MarkAmendMapper;
import com.ruoyi.system.domain.MarkAmend;
import com.ruoyi.system.service.IMarkAmendService;

/**
 * 评分记录表修正Service业务层处理
 * 
 * @author cao
 * @date 2023-03-03
 */
@Service
public class MarkAmendServiceImpl implements IMarkAmendService 
{
    @Autowired
    private MarkAmendMapper markAmendMapper;

    /**
     * 查询评分记录表修正
     * 
     * @param id 评分记录表修正主键
     * @return 评分记录表修正
     */
    @Override
    public MarkAmend selectMarkAmendById(Long id)
    {
        return markAmendMapper.selectMarkAmendById(id);
    }

    /**
     * 查询评分记录表修正列表
     * 
     * @param markAmend 评分记录表修正
     * @return 评分记录表修正
     */
    @Override
    public List<MarkAmend> selectMarkAmendList(MarkAmend markAmend)
    {
        return markAmendMapper.selectMarkAmendList(markAmend);
    }

    /**
     * 新增评分记录表修正
     * 
     * @param markAmend 评分记录表修正
     * @return 结果
     */
    @Override
    public int insertMarkAmend(MarkAmend markAmend)
    {
        markAmend.setCreateTime(DateUtils.getNowDate());
        return markAmendMapper.insertMarkAmend(markAmend);
    }

    /**
     * 修改评分记录表修正
     * 
     * @param markAmend 评分记录表修正
     * @return 结果
     */
    @Override
    public int updateMarkAmend(MarkAmend markAmend)
    {
        Double cjkh = markAmend.getCjkh();
        Double wssx = markAmend.getWssx();
        Double hzgj = markAmend.getHzgj();
        Double cxfz = markAmend.getCxfz();
        if (Double.isNaN(cjkh)&&Double.isNaN(wssx)&&Double.isNaN(hzgj)&&Double.isNaN(cxfz)){
            return -1;
        }
        //设置平均分
        double avg = (cjkh + wssx + hzgj + cxfz) / 4;

        markAmend.setAvgScore(avg);
        markAmend.setUpdateTime(DateUtils.getNowDate());
        markAmend.setIsUpdated(1);
        return markAmendMapper.updateMarkAmend(markAmend);
    }

    /**
     * 批量删除评分记录表修正
     * 
     * @param ids 需要删除的评分记录表修正主键
     * @return 结果
     */
    @Override
    public int deleteMarkAmendByIds(Long[] ids)
    {
        return markAmendMapper.deleteMarkAmendByIds(ids);
    }

    /**
     * 删除评分记录表修正信息
     * 
     * @param id 评分记录表修正主键
     * @return 结果
     */
    @Override
    public int deleteMarkAmendById(Long id)
    {
        return markAmendMapper.deleteMarkAmendById(id);
    }
}
