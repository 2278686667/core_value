<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">

      <el-form-item label="用户名称" prop="username">
        <el-input
          v-model="queryParams.username"
          placeholder="请输入用户名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
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
      <el-form-item label="评分日期，一般本月评分上一个月" prop="scoringTime">
        <el-date-picker clearable
          v-model="queryParams.scoringTime"
          type="month"
          value-format="yyyy-MM"
          placeholder="请选择评分日期，一般本月评分上一个月">
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
          v-hasPermi="['system:amend:add']"
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
          v-hasPermi="['system:amend:edit']"
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
          v-hasPermi="['system:amend:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:amend:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="listA" @selection-change="handleSelectionChange" :key="certinfoKey"
              row-key="id">
      <el-table-column label="id" align="center" prop="id" />
      <el-table-column label="评分时日期(上一个月)" align="center" prop="scoringTime" width="180" sortable>
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.scoringTime, '{y}-{m}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="用户名称" align="center" prop="username" sortable/>
      <el-table-column label="成就客户(分)" align="center" prop="cjkh" />
      <el-table-column label="务实守信" align="center" prop="wssx" />
      <el-table-column label="合作共进" align="center" prop="hzgj" />
      <el-table-column label="创新发展" align="center" prop="cxfz" />
      <el-table-column label="平均分" align="center" prop="avgScore" />
      <el-table-column label="说明" align="center" prop="explanation" :show-overflow-tooltip="true" />
      <el-table-column label="是否修改" align="center">
        <template slot-scope="scope">

          <el-button v-if="scope.row.isUpdated==1&&scope.row.markId!=null"
                     size="mini"
                     type="success"
          >已修改</el-button>
          <el-button v-if="scope.row.isUpdated==0&&scope.row.markId!=null"
                     size="mini"
                     type="warning"
          >未修改</el-button>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button v-if="scope.row.markId!=null"
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:amend:edit']"
          >修改</el-button>
          <el-button v-if="scope.row.markId!=null"
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:amend:remove']"
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

    <!-- 添加或修改评分记录表修正对话框 -->
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
          <el-input-number v-model="form.cjkh"  :min="0" :max="5" label="请输入成就客户"></el-input-number>
          <el-rate v-model="form.cjkh" allow-half="true"></el-rate>
        </el-form-item>
        <el-form-item label="务实守信" prop="wssx">
          <el-input-number v-model="form.wssx"  :min="0" :max="5" label="请输入务实守信"></el-input-number>
          <el-rate v-model="form.wssx" allow-half="true"></el-rate>
        </el-form-item>
        <el-form-item label="合作共进" prop="hzgj">
          <el-input-number v-model="form.hzgj"  :min="0" :max="5" label="请输入合作共进"></el-input-number>
          <el-rate v-model="form.hzgj" allow-half="true"></el-rate>
        </el-form-item>
        <el-form-item label="创新发展" prop="cxfz">
          <el-input-number v-model="form.cxfz"  :min="0" :max="5" label="请输入创新发展"></el-input-number>
          <el-rate v-model="form.cxfz" allow-half="true"></el-rate>
        </el-form-item>

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
import { listAmend, getAmend, delAmend, addAmend, updateAmend,listMark } from "@/api/system/amend";

export default {
  name: "Amend",
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
      certinfoKey:false,
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
      // 评分记录表修正表格数据
      amendList: [],
      markList: [],
      list:[],
      listA:[],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        userId: null,
        markId: null,
        username: null,
        cjkh: null,
        wssx: null,
        hzgj: null,
        cxfz: null,
        avgScore: null,
        explanation: null,
        scoringTime: null,
        isDeleted: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        userId: [
          { required: true, message: "用户id不能为空", trigger: "blur" }
        ],
        markId: [
          { required: true, message: "评分表id不能为空", trigger: "blur" }
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
        username: [
          { required: true, message: "用户名称不能为空", trigger: "blur" }
        ],
        createTime: [
          { required: true, message: "$comment不能为空", trigger: "blur" }
        ],
        updateTime: [
          { required: true, message: "$comment不能为空", trigger: "blur" }
        ],
      },

    };
  },
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
  created() {
    this.getList();
  },
  methods: {
    /** 查询评分记录表修正列表 */ async getList() {

      this.loading = true;
      await listAmend(this.queryParams).then(response => {
        this.certinfoKey != this.certinfoKey;
        this.amendList = response.rows;
        this.getListMark();
        console.log(this.amendList)
        this.total = response.total;
        this.loading = false;
      });
    },
    async getListMark() {
      this.loading = true;
      await listMark(this.queryParams).then(response => {
        this.markList = response.rows;
        this.loading = false;
        this.list=[];
        for (let i = 0; i < this.markList.length; i++) {
          for (let j = 0; j < this.amendList.length; j++) {
            if (this.markList[i].id == this.amendList[j].markId) {
              this.amendList[j].children = [this.markList[i]]
              this.list.push(this.amendList[i])
            }
          }
        }
        this.listA=this.list
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
        markId: null,
        username: null,
        cjkh: null,
        wssx: null,
        hzgj: null,
        cxfz: null,
        avgScore: null,
        explanation: null,
        scoringTime: null,
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
      this.title = "核心价值观录入表";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getAmend(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改核心价值观录入表";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateAmend(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addAmend(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
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
      this.$modal.confirm('是否确认删除评分记录表修正编号为"' + ids + '"的数据项？').then(function() {
        return delAmend(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      var newdata=null;
      if(!(this.queryParams.scoringTime === ''|| this.queryParams.scoringTime === null || this.queryParams.scoringTime === undefined)) {
        newdata=this.queryParams.scoringTime;
      }else {
        newdata=new Date().getTime();
      }
      this.download('system/amend/export', {
        ...this.queryParams
      }, `价值观考核_${newdata}.xlsx`)
    }
  }
};
</script>
<style scoped>
.demo-table-expand {
  font-size: 0;
}
.demo-table-expand label {
  width: 120px;
  /*color: #99a9bf;*/
}
.demo-table-expand .el-form-item {
  margin-bottom: 0;
  width: 50%;
}
.el-rate{
  float: right;
  margin-right: 200px;
  margin-top: 8px;
}
</style>
