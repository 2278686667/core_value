package com.ruoyi.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
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
import com.ruoyi.system.domain.MarkAmend;
import com.ruoyi.system.service.IMarkAmendService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 评分记录表修正Controller
 * 
 * @author cao
 * @date 2023-03-03
 */
@RestController
@RequestMapping("/system/amend")
public class MarkAmendController extends BaseController
{
    @Autowired
    private IMarkAmendService markAmendService;

    /**
     * 查询评分记录表修正列表
     */
    @PreAuthorize("@ss.hasPermi('system:amend:list')")
    @GetMapping("/list")
    public TableDataInfo list(MarkAmend markAmend)
    {
        startPage();
        List<MarkAmend> list = markAmendService.selectMarkAmendList(markAmend);
        return getDataTable(list);
    }

    /**
     * 导出评分记录表修正列表
     */
    @PreAuthorize("@ss.hasPermi('system:amend:export')")
    @Log(title = "评分记录表修正", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, MarkAmend markAmend)
    {
        List<MarkAmend> list = markAmendService.selectMarkAmendList(markAmend);
        ExcelUtil<MarkAmend> util = new ExcelUtil<MarkAmend>(MarkAmend.class);
        util.hideColumn("userId","markId","isDeleted","isUpdated");
        util.exportExcel(response, list, "评分记录表修正数据");
    }

    /**
     * 获取评分记录表修正详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:amend:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(markAmendService.selectMarkAmendById(id));
    }

    /**
     * 新增评分记录表修正
     */
    @PreAuthorize("@ss.hasPermi('system:amend:add')")
    @Log(title = "评分记录表修正", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody MarkAmend markAmend)
    {
        return toAjax(markAmendService.insertMarkAmend(markAmend));
    }

    /**
     * 修改评分记录表修正
     */
    @PreAuthorize("@ss.hasPermi('system:amend:edit')")
    @Log(title = "评分记录表修正", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody MarkAmend markAmend)
    {
        return toAjax(markAmendService.updateMarkAmend(markAmend));
    }

    /**
     * 删除评分记录表修正
     */
    @PreAuthorize("@ss.hasPermi('system:amend:remove')")
    @Log(title = "评分记录表修正", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(markAmendService.deleteMarkAmendByIds(ids));
    }
}
