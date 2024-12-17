<template>
  <view>
    <view class="container diy_view">
      <view>
        <view>
          <view class="">
            <uni-forms :modelValue="form"  v-if="is_view()">

              <uni-forms-item v-if="$check_field('get','employee_id') || $check_field('add','employee_id') || $check_field('set','employee_id')" label="员工工号" name="employee_id">
                        <uni-data-select
                  id="form_employee_id"
                  v-model="form['employee_id']"
                  :localdata="list_user_employee_id"
                  :clear="!disabledObj['employee_id_isDisabled']"
                  :disabled="disabledObj['employee_id_isDisabled']"
                  v-if="user_group === '管理员' || (form['project_records_id'] && $check_field('set','employee_id')) || (!form['project_records_id'] && $check_field('add','employee_id'))"
                ></uni-data-select>
                <uni-data-select
                  v-model="form['employee_id']"
                  :localdata="list_user_employee_id"
                  :clear="false"
                  :disabled="true"
                  v-else-if="$check_field('get','employee_id')" id="employee_id"
                ></uni-data-select>
                    </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','employee_name') || $check_field('add','employee_name') || $check_field('set','employee_name')" label="员工姓名" name="employee_name">
                                <uni-easyinput type="text" v-model="form['employee_name']" v-if="user_group === '管理员' || (form['project_records_id'] && $check_field('set','employee_name')) || (!form['project_records_id'] && $check_field('add','employee_name'))" :disabled="disabledObj['employee_name_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','employee_name')">
                  {{ form['employee_name'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','task_name') || $check_field('add','task_name') || $check_field('set','task_name')" label="任务名称" name="task_name">
                                <uni-easyinput type="text" v-model="form['task_name']" v-if="user_group === '管理员' || (form['project_records_id'] && $check_field('set','task_name')) || (!form['project_records_id'] && $check_field('add','task_name'))" :disabled="disabledObj['task_name_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','task_name')">
                  {{ form['task_name'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','dispatch_time') || $check_field('add','dispatch_time') || $check_field('set','dispatch_time')" label="分派时间" name="dispatch_time">
                                <uni-easyinput type="text" v-model="form['dispatch_time']" v-if="user_group === '管理员' || (form['project_records_id'] && $check_field('set','dispatch_time')) || (!form['project_records_id'] && $check_field('add','dispatch_time'))" :disabled="disabledObj['dispatch_time_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','dispatch_time')">
                  {{ form['dispatch_time'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','completion') || $check_field('add','completion') || $check_field('set','completion')" label="完成情况" name="completion">
                        <uni-data-select
                  v-model="form.completion"
                  :localdata="list_completion"
                  :clear="!disabledObj['completion_isDisabled']"
                  :disabled="disabledObj['completion_isDisabled']"
                  v-if="user_group === '管理员' || (form['project_records_id'] && $check_field('set','completion')) || (!form['project_records_id'] && $check_field('add','completion'))"
                ></uni-data-select>
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','completion')">
                  {{ form['completion'] }}
                </text>
                    </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','record_time') || $check_field('add','record_time') || $check_field('set','record_time')" label="记录时间" name="record_time">
                        <uni-datetime-picker v-if="user_group === '管理员' || (form['project_records_id'] && $check_field('set','record_time')) || (!form['project_records_id'] && $check_field('add','record_time'))" v-model="form['record_time']" type="date" :disabled="disabledObj['record_time_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','record_time')">
                  {{ form['record_time'] }}
                </text>
                    </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','details') || $check_field('add','details') || $check_field('set','details')" label="详情" name="details">
                        <uni-easyinput type="textarea" v-model="form['details']" v-if="user_group === '管理员' || (form['project_records_id'] && $check_field('set','details')) || (!form['project_records_id'] && $check_field('add','details'))" :disabled="disabledObj['details_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','details')">
                  {{ form['details'] }}
                </text>
                    </uni-forms-item>


            </uni-forms>
            <view class="form_button">
              <button size="mini" type="primary" @click="submit()" class="primary_btn">提交</button>
              <button size="mini" @click="cancel()">取消</button>
            </view>
          </view>
        </view>
      </view>
    </view>
  </view>
</template>

<script>
import mixin from "@/libs/mixins/page.js";

export default {
  mixins: [mixin],
  data() {
    return {
      field: "project_records_id",
      url_add: "~/api/project_records/add?",
      url_set: "~/api/project_records/set?",
      url_get_obj: "~/api/project_records/get_obj?",
      url_upload: "~/api/project_records/upload?",

      query: {
        "project_records_id": 0,
      },

      form: {
            "employee_id": 0, // 员工工号
                    "employee_name":  '', // 员工姓名
                    "task_name":  '', // 任务名称
                    "dispatch_time":  '', // 分派时间
                    "completion":  '', // 完成情况
                    "record_time": this.$toTime(new Date().getTime(), "yyyy-MM-dd"),
                    "details":  '', // 详情
                                "project_records_id": 0, // ID
                
              },
          disabledObj:{
                        "employee_id_isDisabled": false,
                                "employee_name_isDisabled": false,
                                "task_name_isDisabled": false,
                                "dispatch_time_isDisabled": false,
                                "completion_isDisabled": false,
                                "record_time_isDisabled": false,
                                "details_isDisabled": false,
                                  },
                                // 用户列表
            list_user_employee_id: [],
                                                                                                      // 完成情况选项列表
          list_completion: [],
                                                                              }
  },
  methods: {
    changeLog(v,value){
      this.form[value] = v
    },
    /**
     * 上传文件
     * @param {Object} param文件参数
     */
    change_file(key_name){
      var _self = this;
      // 选择图像方法
      uni.chooseFile({
        count: 1,
        sizeType: ['original', 'compressed'], //可以指定是原图还是压缩图，默认二者都有
        sourceType: ['album'], //从相册选择
        success: function(res) {
          const tempFilePaths = res.tempFilePaths;
          const uploadTask = uni.uploadFile({
            url: _self.$fullUrl('/api/project_records/upload?'),
            filePath: tempFilePaths[0],
            name: 'file',
            formData: {
              'i_want_to_customize': 'test'
            },
            header: {
              'x-auth-token': _self.$store.state.user.token
            },
            success: function(uploadFileRes) {
              var filename = JSON.parse(uploadFileRes.data).result.url
              _self.form[key_name] = filename
            }
          });

          uploadTask.onProgressUpdate(function(res) {
            _self.percent = res.progress;
            console.log('上传进度' + res.progress);
            console.log('已经上传的数据长度' + res.totalBytesSent);
            console.log('预期需要上传的数据总长度' + res.totalBytesExpectedToSend);
          });
        },
        error: function(e) {
          console.log(e);
        }
      });
    },
    /**
     * 上传图片
     * @param {Object} param文件参数
     */
    change_img(key_name){
      var _self = this;
      _self.upload_img_flag = false
      // 选择图像方法
      uni.chooseImage({
        count: 1,
        sizeType: ['original', 'compressed'], //可以指定是原图还是压缩图，默认二者都有
        sourceType: ['album'], //从相册选择
        success: function(res) {
          const tempFilePaths = res.tempFilePaths;
          const uploadTask = uni.uploadFile({
            url: _self.$fullUrl('/api/project_records/upload?'),
            filePath: tempFilePaths[0],
            name: 'file',
            formData: {
              'i_want_to_customize': 'test'
            },
            header: {
              'x-auth-token': _self.$store.state.user.token
            },
            success: function(uploadFileRes) {
              var filename = JSON.parse(uploadFileRes.data).result.url
              _self.form[key_name] = filename
            }
          });

          uploadTask.onProgressUpdate(function(res) {
            _self.percent = res.progress;
            console.log('上传进度' + res.progress);
            console.log('已经上传的数据长度' + res.totalBytesSent);
            console.log('预期需要上传的数据总长度' + res.totalBytesExpectedToSend);
          });
        },
        error: function(e) {
          console.log(e);
        }
      });
    },
    /**
     * 获取对象后获取缓存表单
     * @param {Object} json
     * @param {Object} func
     */
    get_obj_before(param){
      var form = uni.db.get("form");
      if (form) {
        delete(form.examine_state)
        delete(form.examine_reply)
        this.obj = uni.push(this.obj ,form);
        this.form = uni.push(this.form ,form);
      }
      var arr = []
      for (let key in form) {
        arr.push(key)
      }
      for (var i=0;i<arr.length;i++){
        this.disabledObj[arr[i] + '_isDisabled'] = true
      }
                                                      if (this.form["record_time"] && JSON.stringify(this.form["record_time"]).indexOf("-")===-1) {
        this.form["record_time"] = this.$toTime(parseInt(this.form["record_time"]), "yyyy-MM-dd")
      }
                  uni.db.del("form");
      return param;
    },
            /**
     * 获取员工用户列表
     */
    async get_list_user_employee() {
      // if(this.user_group !== "管理员" && this.form["employee_id"] === 0) {
      //     this.form["employee_id"] = this.user.user_id;
      // }
      var json = await this.$get("~/api/user/get_list?user_group=员工");
      if(json.result && json.result.list){
        json.result.list.map((o) => this.list_user_employee_id.push({value:o.user_id,text:o.nickname + '-' + o.username}));
      }
      else if(json.error){
        console.error(json.error);
      }
    },
            
            
            
            
            /**
     * 获取完成情况列表
     */
    async get_list_completion() {
          ['已完成','进行中'].map((o) => this.list_completion.push({value:o,text:o}));
            },
        
            
            
    
    /**
     * 获取对象之后
     * @param {Object} json
     * @param {Object} func
     */
    get_obj_after(json, func){
                                                      if (this.form["record_time"] && JSON.stringify(this.form["record_time"]).indexOf("-")===-1) {
        this.form["record_time"] = this.$toTime(parseInt(this.form["record_time"]),"yyyy-MM-dd")
      }
                },

    is_view(){
      var bl = this.user_group == "管理员";

      if(!bl){
        bl = this.$check_action('/project_records/table','add');
        console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
      }
      if(!bl){
        bl = this.$check_action('/project_records/table','set');
        console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
      }
      if(!bl){
        bl = this.$check_action('/project_records/view','add');
        console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
      }
      if(!bl){
        bl = this.$check_action('/project_records/view','set');
        console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
      }
      if(!bl){
        bl = this.$check_action('/project_records/view','get');
        console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
      }

      console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

      return bl;
    },

  },
  created() {
            this.get_list_user_employee();
                                            this.get_list_completion();
                          },
}
</script>

<style scoped>
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}

.avatar-uploader .el-upload:hover {
  border-color: #409EFF;
}

.form_button{
  padding-bottom: 15px;
  display: flex;
}
.form_button button{
  width: 40%;
}
.query_select{
  border-color: rgb(229, 229, 229);
  background-color: rgb(255, 255, 255);
  border-radius: 4px;
  box-sizing: border-box;
  flex: 1;
  width: 100%;
  line-height: 2;
  font-size: 14px;
  height: 2.4em;
  min-height: 2.4em;
  display: block;
  outline:none;
}

.query_option{
  width: 100%;
}

.btn_add_img{
  color: #D3D3D3;
  text-align: center;
  border: 1px solid #eee;
  height: 5rem;
  width: 5rem;
  position: relative;
}
.btn_add_img text{
  font-size: 35px;
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%,-50%);
}
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}

.avatar-uploader .el-upload:hover {
  border-color: #409eff;
}

.form_button {
  padding-bottom: 15px;
  display: flex;
}
.form_button button {
  width: 40%;
}
.query_select {
  border-color: rgb(229, 229, 229);
  background-color: rgb(255, 255, 255);
  border-radius: 4px;
  box-sizing: border-box;
  flex: 1;
  width: 100%;
  line-height: 2;
  font-size: 14px;
  height: 2.4em;
  min-height: 2.4em;
  display: block;
  outline: none;
}

.query_option {
  width: 100%;
}

.btn_add_img {
  color: #d3d3d3;
  text-align: center;
  border: 1px solid #eee;
  height: 5rem;
  width: 5rem;
  position: relative;
}
.btn_add_img text {
  font-size: 35px;
  position: absolute;
  left: 50%;
  top: 50%;
  transform: translate(-50%, -50%);
}
/*新样式*/
.uni-forms{
padding-top:1rem;
}
.uni-forms-item {
	padding: 6px 10px;
    background: #f8f6fc;
}
.uni-forms .is-input-border{
	border: 0;
}
.container{
	    -webkit-box-shadow: 0px 0px 0px #888888;
	    box-shadow: 0px 0px 0px #888888;
}
.form_button .primary_btn{
		background-color: #22B8B8;
		color: #FFFFFF;
	}
</style>
