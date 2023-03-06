<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="成就客户" prop="cjkh">
        <el-input
          v-model="queryParams.cjkh"
          placeholder="请输入成就客户"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="务实守信" prop="wssx">
        <el-input
          v-model="queryParams.wssx"
          placeholder="请输入务实守信"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="合作共进" prop="hzgj">
        <el-input
          v-model="queryParams.hzgj"
          placeholder="请输入合作共进"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="创新发展" prop="cxfz">
        <el-input
          v-model="queryParams.cxfz"
          placeholder="请输入创新发展"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="平均分" prop="avgScore">
        <el-input
          v-model="queryParams.avgScore"
          placeholder="请输入平均分"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="评分日期(上一个月)" prop="scoringTime">
        <el-date-picker clearable
          v-model="queryParams.scoringTime"
          type="month"
          value-format="yyyy-MM-dd"
          placeholder="请选择评分日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:mark:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:mark:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:mark:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:mark:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="markList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="id" align="center" prop="id" />
      <el-table-column label="评分日期" align="center" prop="scoringTime" width="180" sortable>
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.scoringTime, '{y}-{m}') }}</span>
        </template>
      </el-table-column>

      <el-table-column label="用户名称" align="center" prop="username" />
      <el-table-column label="成就客户" align="center" prop="cjkh" />
      <el-table-column label="务实守信" align="center" prop="wssx" />
      <el-table-column label="合作共进" align="center" prop="hzgj" />
      <el-table-column label="创新发展" align="center" prop="cxfz" />
      <el-table-column label="平均分" align="center" prop="avgScore" />

      <el-table-column label="说明" align="center" prop="explanation" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:mark:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:mark:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改评分记录表对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="800px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="200px">
        <el-form-item label="评分日期（上一个月）" >
          <el-date-picker clearable
                          v-model="form.scoringTime"
                          type="month"
                          size="small"
                          value-format="yyyy-MM"
                          placeholder="请选择评分月份，一般本月评分上一个月">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="成就客户(分)" prop="cjkh">
          <el-input v-model="form.cjkh" placeholder="请输入成就客户" />
        </el-form-item>
        <el-form-item label="务实守信" prop="wssx">
          <el-input v-model="form.wssx" placeholder="请输入务实守信" />
        </el-form-item>
        <el-form-item label="合作共进" prop="hzgj">
          <el-input v-model="form.hzgj" placeholder="请输入合作共进" />
        </el-form-item>
        <el-form-item label="创新发展" prop="cxfz">
          <el-input v-model="form.cxfz" placeholder="请输入创新发展" />
        </el-form-item>
<!--        <el-form-item label="评分时间，一般本月评分上一个月" prop="scoringTime">-->

        <el-form-item label="说明" prop="explanation">
          <el-input v-model="form.explanation" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <p style="color: #ff4949">
          说明（3分以下或者4分及以上的需要说明情况）
        </p>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>

      </div>


    </el-dialog>
  </div>
</template>

<script>
import { listMark, getMark, delMark, addMark, updateMark } from "@/api/system/mark";
import year from "../../../components/Crontab/year";

export default {
  name: "Mark",
  data() {
    //小数验证规则
    var valiNumberPass1 = (rule, value, callback) => {//包含小数的数字
      let reg = /^[+-]?(0|([1-5]\d*))(\.\d+)?$/g;
      if (value === '') {
        callback(new Error('请输入内容'));
      } else if (!reg.test(value)) {
        callback(new Error('请输入数字且大小在0-5范围内'));
      } else {
        callback();
      }
    };
    return {
      lastMonth:null,
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 评分记录表表格数据
      markList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        userId: null,
        username: null,
        cjkh: null,
        wssx: null,
        hzgj: null,
        cxfz: null,
        avgScore: null,
        scoringTime: null,
        explanation: null,
        isDeleted: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        userId: [
          { required: true, message: "用户id不能为空", trigger: "blur" }
        ],
        username: [
          { required: true, message: "用户名称不能为空", trigger: "blur" }
        ],
        cjkh: [
          { required: true, validator: valiNumberPass1, trigger: "blur" }
        ],
        wssx: [
          { required: true, validator: valiNumberPass1, trigger: "blur" }
        ],
        hzgj: [
          { required: true, validator: valiNumberPass1, trigger: "blur" }
        ],
        cxfz: [
          { required: true, validator: valiNumberPass1, trigger: "blur" }
        ],
        scoringTime: [
          { required: true, message: "评分时间，一般本月评分上一个月不能为空", trigger: "blur" }
        ],
        createTime: [
          { required: true, message: "$comment不能为空", trigger: "blur" }
        ],
        updateTime: [
          { required: true, message: "$comment不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();

    console.log(this.form.scoringTime)

  },
  // 定义timeDefault计算属性：
computed: {
  timeDefault() {
    var time='';
    var date = new Date();
    if ((date.getMonth() - 1)<10){
      time=0;
    }
    var s1 = date.getFullYear().toString() + "-" +time+ (date.getMonth()).toString();
    return s1;
  }
},
  methods: {
    /** 查询评分记录表列表 */
    getList() {
      this.loading = true;
      listMark(this.queryParams).then(response => {
        this.markList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        userId: null,
        username: null,
        cjkh: null,
        wssx: null,
        hzgj: null,
        cxfz: null,
        avgScore: null,
        scoringTime: null,
        explanation: null,
        createTime: null,
        updateTime: null,
        isDeleted: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.form.scoringTime = this.timeDefault;
      this.open = true;
      this.title = "核心价值观记录表";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getMark(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改核心价值观记录表";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateMark(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addMark(this.form).then(response => {
              this.$modal.msgSuccess("评分成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除评分记录表编号为"' + ids + '"的数据项？').then(function() {
        return delMark(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/mark/export', {
        ...this.queryParams
      }, `mark_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
