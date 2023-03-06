package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Mark;

/**
 * 评分记录表Mapper接口
 * 
 * @author cao
 * @date 2023-03-02
 */
public interface MarkMapper 
{
    /**
     * 查询评分记录表
     * 
     * @param id 评分记录表主键
     * @return 评分记录表
     */
    public Mark selectMarkById(Long id);

    /**
     * 查询评分记录表列表
     * 
     * @param mark 评分记录表
     * @return 评分记录表集合
     */
    public List<Mark> selectMarkList(Mark mark);

    /**
     * 新增评分记录表
     * 
     * @param mark 评分记录表
     * @return 结果
     */
    public int insertMark(Mark mark);

    /**
     * 修改评分记录表
     * 
     * @param mark 评分记录表
     * @return 结果
     */
    public int updateMark(Mark mark);

    /**
     * 删除评分记录表
     * 
     * @param id 评分记录表主键
     * @return 结果
     */
    public int deleteMarkById(Long id);

    /**
     * 批量删除评分记录表
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMarkByIds(Long[] ids);

}
