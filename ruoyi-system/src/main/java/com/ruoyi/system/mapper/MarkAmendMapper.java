package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.MarkAmend;

/**
 * 评分记录表修正Mapper接口
 * 
 * @author cao
 * @date 2023-03-03
 */
public interface MarkAmendMapper 
{
    /**
     * 查询评分记录表修正
     * 
     * @param id 评分记录表修正主键
     * @return 评分记录表修正
     */
    public MarkAmend selectMarkAmendById(Long id);

    /**
     * 查询评分记录表修正列表
     * 
     * @param markAmend 评分记录表修正
     * @return 评分记录表修正集合
     */
    public List<MarkAmend> selectMarkAmendList(MarkAmend markAmend);

    /**
     * 新增评分记录表修正
     * 
     * @param markAmend 评分记录表修正
     * @return 结果
     */
    public int insertMarkAmend(MarkAmend markAmend);

    /**
     * 修改评分记录表修正
     * 
     * @param markAmend 评分记录表修正
     * @return 结果
     */
    public int updateMarkAmend(MarkAmend markAmend);

    /**
     * 删除评分记录表修正
     * 
     * @param id 评分记录表修正主键
     * @return 结果
     */
    public int deleteMarkAmendById(Long id);

    /**
     * 批量删除评分记录表修正
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMarkAmendByIds(Long[] ids);

    //根据Markid批量删除
    int deleteMarkAmendByMarkIds(Long[] ids);

    //根据id删除
    int deleteMarkBYMarkId(Long id);

    //根据markId查询
    List<MarkAmend> selectMarkAmendByMarkId(Long markId);
}
