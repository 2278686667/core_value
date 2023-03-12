package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 评分记录表修正对象 mark_amend
 * 
 * @author cao
 * @date 2023-03-03
 */
public class MarkAmend extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;

    /** 评分表id */
    @Excel(name = "评分表id")
    private Long markId;

    /** 用户名称 */
    @Excel(name = "姓名")
    private String username;

    /** 成就客户 */
    @Excel(name = "成就客户")
    private Double cjkh;

    /** 务实守信 */
    @Excel(name = "务实守信")
    private Double wssx;

    /** 合作共进 */
    @Excel(name = "合作共进")
    private Double hzgj;

    /** 创新发展 */
    @Excel(name = "创新发展")
    private Double cxfz;

    /** 平均分 */
    @Excel(name = "平均分")
    private Double avgScore;

    /** 说明 */
    @Excel(name = "说明（3分以下或者4分及以上的需要说明情况）")
    private String explanation;

    /** 评分时间，一般本月评分上一个月 */
    @JsonFormat(pattern = "yyyy-MM")
    @Excel(name = "评分时间，一般本月评分上一个月", width = 30, dateFormat = "yyyy-MM")
    private Date scoringTime;

    /** 0--未删除 1--已删除 */
    @Excel(name = "0--未删除 1--已删除")
    private Integer isDeleted;
    @Excel(name = "0--未修改 1--已修改")
    private Integer isUpdated;

    public Integer getIsUpdated() {
        return isUpdated;
    }

    public void setIsUpdated(Integer isUpdated) {
        this.isUpdated = isUpdated;
    }
    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setMarkId(Long markId) 
    {
        this.markId = markId;
    }

    public Long getMarkId() 
    {
        return markId;
    }
    public void setUsername(String username) 
    {
        this.username = username;
    }

    public String getUsername() 
    {
        return username;
    }
    public void setCjkh(Double cjkh) 
    {
        this.cjkh = cjkh;
    }

    public Double getCjkh() 
    {
        return cjkh;
    }
    public void setWssx(Double wssx) 
    {
        this.wssx = wssx;
    }

    public Double getWssx() 
    {
        return wssx;
    }
    public void setHzgj(Double hzgj) 
    {
        this.hzgj = hzgj;
    }

    public Double getHzgj() 
    {
        return hzgj;
    }
    public void setCxfz(Double cxfz) 
    {
        this.cxfz = cxfz;
    }

    public Double getCxfz() 
    {
        return cxfz;
    }
    public void setAvgScore(Double avgScore) 
    {
        this.avgScore = avgScore;
    }

    public Double getAvgScore() 
    {
        return avgScore;
    }
    public void setExplanation(String explanation) 
    {
        this.explanation = explanation;
    }

    public String getExplanation() 
    {
        return explanation;
    }
    public void setScoringTime(Date scoringTime) 
    {
        this.scoringTime = scoringTime;
    }

    public Date getScoringTime() 
    {
        return scoringTime;
    }
    public void setIsDeleted(Integer isDeleted) 
    {
        this.isDeleted = isDeleted;
    }

    public Integer getIsDeleted() 
    {
        return isDeleted;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("markId", getMarkId())
            .append("username", getUsername())
            .append("cjkh", getCjkh())
            .append("wssx", getWssx())
            .append("hzgj", getHzgj())
            .append("cxfz", getCxfz())
            .append("avgScore", getAvgScore())
            .append("explanation", getExplanation())
            .append("scoringTime", getScoringTime())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("isDeleted", getIsDeleted())
            .toString();
    }
}
