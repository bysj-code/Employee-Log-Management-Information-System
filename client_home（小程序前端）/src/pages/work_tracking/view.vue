<template>
  <view>
    <view class="container diy_view">
      <view>
        <view>
          <view class="">
            <uni-forms :modelValue="form"  v-if="is_view()">

              <uni-forms-item v-if="$check_field('get','title') || $check_field('add','title') || $check_field('set','title')" label="标题" name="title">
                                <uni-easyinput type="text" v-model="form['title']" v-if="user_group === '管理员' || (form['work_tracking_id'] && $check_field('set','title')) || (!form['work_tracking_id'] && $check_field('add','title'))" :disabled="disabledObj['title_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','title')">
                  {{ form['title'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','supervisor_no') || $check_field('add','supervisor_no') || $check_field('set','supervisor_no')" label="主管编号" name="supervisor_no">
                        <uni-data-select
                  id="form_supervisor_no"
                  v-model="form['supervisor_no']"
                  :localdata="list_user_supervisor_no"
                  :clear="!disabledObj['supervisor_no_isDisabled']"
                  :disabled="disabledObj['supervisor_no_isDisabled']"
                  v-if="user_group === '管理员' || (form['work_tracking_id'] && $check_field('set','supervisor_no')) || (!form['work_tracking_id'] && $check_field('add','supervisor_no'))"
                ></uni-data-select>
                <uni-data-select
                  v-model="form['supervisor_no']"
                  :localdata="list_user_supervisor_no"
                  :clear="false"
                  :disabled="true"
                  v-else-if="$check_field('get','supervisor_no')" id="supervisor_no"
                ></uni-data-select>
                    </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','supervisor_name') || $check_field('add','supervisor_name') || $check_field('set','supervisor_name')" label="主管姓名" name="supervisor_name">
                                <uni-easyinput type="text" v-model="form['supervisor_name']" v-if="user_group === '管理员' || (form['work_tracking_id'] && $check_field('set','supervisor_name')) || (!form['work_tracking_id'] && $check_field('add','supervisor_name'))" :disabled="disabledObj['supervisor_name_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','supervisor_name')">
                  {{ form['supervisor_name'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','task_name') || $check_field('add','task_name') || $check_field('set','task_name')" label="任务名称" name="task_name">
                                <uni-easyinput type="text" v-model="form['task_name']" v-if="user_group === '管理员' || (form['work_tracking_id'] && $check_field('set','task_name')) || (!form['work_tracking_id'] && $check_field('add','task_name'))" :disabled="disabledObj['task_name_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','task_name')">
                  {{ form['task_name'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','closing_date') || $check_field('add','closing_date') || $check_field('set','closing_date')" label="截止日期" name="closing_date">
                        <uni-datetime-picker v-if="user_group === '管理员' || (form['work_tracking_id'] && $check_field('set','closing_date')) || (!form['work_tracking_id'] && $check_field('add','closing_date'))" v-model="form['closing_date']" type="date" :disabled="disabledObj['closing_date_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','closing_date')">
                  {{ form['closing_date'] }}
                </text>
                    </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','tracking') || $check_field('add','tracking') || $check_field('set','tracking')" label="追踪情况" name="tracking">
                        <uni-easyinput type="textarea" v-model="form['tracking']" v-if="user_group === '管理员' || (form['work_tracking_id'] && $check_field('set','tracking')) || (!form['work_tracking_id'] && $check_field('add','tracking'))" :disabled="disabledObj['tracking_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','tracking')">
                  {{ form['tracking'] }}
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
      field: "work_tracking_id",
      url_add: "~/api/work_tracking/add?",
      url_set: "~/api/work_tracking/set?",
      url_get_obj: "~/api/work_tracking/get_obj?",
      url_upload: "~/api/work_tracking/upload?",

      query: {
        "work_tracking_id": 0,
      },

      form: {
            "title":  '', // 标题
                    "supervisor_no": 0, // 主管编号
                    "supervisor_name":  '', // 主管姓名
                    "task_name":  '', // 任务名称
                    "closing_date": this.$toTime(new Date().getTime(), "yyyy-MM-dd"),
                    "tracking":  '', // 追踪情况
                                "work_tracking_id": 0, // ID
                
              },
          disabledObj:{
                        "title_isDisabled": false,
                                "supervisor_no_isDisabled": false,
                                "supervisor_name_isDisabled": false,
                                "task_name_isDisabled": false,
                                "closing_date_isDisabled": false,
                                "tracking_isDisabled": false,
                                  },
                                                    // 用户列表
            list_user_supervisor_no: [],
                        // 用户组
            group_user_supervisor_no: "",
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
            url: _self.$fullUrl('/api/work_tracking/upload?'),
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
            url: _self.$fullUrl('/api/work_tracking/upload?'),
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
                                              if (this.form["closing_date"] && JSON.stringify(this.form["closing_date"]).indexOf("-")===-1) {
        this.form["closing_date"] = this.$toTime(parseInt(this.form["closing_date"]), "yyyy-MM-dd")
      }
                  uni.db.del("form");
      return param;
    },
        
                /**
     * 获取部门主管用户列表
     */
    async get_list_user_supervisor_no() {
      // if(this.user_group !== "管理员" && this.form["supervisor_no"] === 0) {
      //     this.form["supervisor_no"] = this.user.user_id;
      // }
      var json = await this.$get("~/api/user/get_list?user_group=部门主管");
      if(json.result && json.result.list){
        json.result.list.map((o) => this.list_user_supervisor_no.push({value:o.user_id,text:o.nickname + '-' + o.username}));
      }
      else if(json.error){
        console.error(json.error);
      }
    },
            /**
     * 获取部门主管用户组
     */
    async get_group_user_supervisor_no() {
      this.form["supervisor_no"] = this.user.user_id;
      var json = await this.$get("~/api/user_group/get_obj?name=部门主管");
      if(json.result && json.result.obj){
        this.group_user_supervisor_no = json.result.obj;
        this.get_user_session_supervisor_no(this.form['supervisor_no'])
      }
      else if(json.error){
        console.error(json.error);
      }
    },
    get_user_session_supervisor_no(id){
      var _this = this;
      var user_id = {"user_id":id}
      var url = "~/api/"+_this.group_user_supervisor_no.source_table+"/get_obj?"
      this.$get(url, user_id, function(res) {
        if (res.result && res.result.obj) {
          var arr = []
          for (let key in res.result.obj) {
            arr.push(key)
          }
          var arrForm = []
          for (let key in _this.form) {
            arrForm.push(key)
          }
          for (var i=0;i<arr.length;i++){
            if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
              for (var j = 0; j < arrForm.length; j++) {
                if (arr[i] === arrForm[j]) {
                  if (arr[i] !== "supervisor_no") {
                    _this.form[arrForm[j]] = res.result.obj[arr[i]]
                    _this.disabledObj[arrForm[j] + '_isDisabled'] = true
                    break;
                  } else {
                    _this.disabledObj[arrForm[j] + '_isDisabled'] = true
                  }
                }
              }
            }
          }
        }
      });
    },
            
            
            
            
            
    
    /**
     * 获取对象之后
     * @param {Object} json
     * @param {Object} func
     */
    get_obj_after(json, func){
                                              if (this.form["closing_date"] && JSON.stringify(this.form["closing_date"]).indexOf("-")===-1) {
        this.form["closing_date"] = this.$toTime(parseInt(this.form["closing_date"]),"yyyy-MM-dd")
      }
                },

    is_view(){
      var bl = this.user_group == "管理员";

      if(!bl){
        bl = this.$check_action('/work_tracking/table','add');
        console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
      }
      if(!bl){
        bl = this.$check_action('/work_tracking/table','set');
        console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
      }
      if(!bl){
        bl = this.$check_action('/work_tracking/view','add');
        console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
      }
      if(!bl){
        bl = this.$check_action('/work_tracking/view','set');
        console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
      }
      if(!bl){
        bl = this.$check_action('/work_tracking/view','get');
        console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
      }

      console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

      return bl;
    },

  },
  created() {
                    this.get_list_user_supervisor_no();
            this.get_group_user_supervisor_no();
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
