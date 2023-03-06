package com.ruoyi.system.service.impl;

import java.util.List;

import cn.hutool.core.bean.BeanUtil;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.domain.MarkAmend;
import com.ruoyi.system.mapper.MarkAmendMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.MarkMapper;
import com.ruoyi.system.domain.Mark;
import com.ruoyi.system.service.IMarkService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 评分记录表Service业务层处理
 * 
 * @author cao
 * @date 2023-03-02
 */
@Service
public class MarkServiceImpl implements IMarkService 
{
    @Autowired
    private MarkMapper markMapper;

    @Autowired
    private MarkAmendMapper markAmendMapper;

    /**
     * 查询评分记录表
     * 
     * @param id 评分记录表主键
     * @return 评分记录表
     */
    @Override
    public Mark selectMarkById(Long id)
    {
        return markMapper.selectMarkById(id);
    }

    /**
     * 查询评分记录表列表
     * 
     * @param mark 评分记录表
     * @return 评分记录表
     */
    @Override
    public List<Mark> selectMarkList(Mark mark)
    {
        return markMapper.selectMarkList(mark);
    }

    /**
     * 新增评分记录表
     * 
     * @param mark 评分记录表
     * @return 结果
     */
    @Transactional
    @Override
    public int insertMark(Mark mark)
    {
        //设置添加用户id和名称
        mark.setUserId(SecurityUtils.getUserId());
        mark.setUsername(SecurityUtils.getUsername());
        mark.setCreateTime(DateUtils.getNowDate());
        markMapper.insertMark(mark);

        return copyMarktoMarkAmend(mark);
    }

    private int copyMarktoMarkAmend(Mark mark) {
        //复制到MarkAmend表
        MarkAmend markAmend = BeanUtil.copyProperties(mark, MarkAmend.class,new String[]{"id"});
        markAmend.setMarkId(mark.getId());
        return markAmendMapper.insertMarkAmend(markAmend);
    }

    /**
     * 修改评分记录表
     * 
     * @param mark 评分记录表
     * @return 结果
     */
    @Transactional
    @Override
    public int updateMark(Mark mark)
    {
        mark.setUpdateTime(DateUtils.getNowDate());

        //查询出markamend表信息，根据id进行修改
        List<MarkAmend> markAmend2 = markAmendMapper.selectMarkAmendByMarkId(mark.getId());
        if (markAmend2.size()>1){
            throw new RuntimeException("表中数据有重复");

        }

        //复制到MarkAmend表
        MarkAmend markAmend = BeanUtil.copyProperties(mark, MarkAmend.class,new String[]{"id"});
        markAmend.setMarkId(mark.getId());
        markAmend.setId(markAmend2.get(0).getId());
        markAmendMapper.updateMarkAmend(markAmend);

        return markMapper.updateMark(mark);
    }

    /**
     * 批量删除评分记录表
     * 
     * @param ids 需要删除的评分记录表主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteMarkByIds(Long[] ids)
    {
        int i=markAmendMapper.deleteMarkAmendByMarkIds(ids);
        return markMapper.deleteMarkByIds(ids);
    }

    /**
     * 删除评分记录表信息
     * 
     * @param id 评分记录表主键
     * @return 结果
     */
    @Transactional
    @Override
    public int deleteMarkById(Long id)

    {
        markAmendMapper.deleteMarkBYMarkId(id);
        return markMapper.deleteMarkById(id);
    }
}
