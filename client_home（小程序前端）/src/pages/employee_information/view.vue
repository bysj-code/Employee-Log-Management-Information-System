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
                  v-if="user_group === '管理员' || (form['employee_information_id'] && $check_field('set','employee_id')) || (!form['employee_information_id'] && $check_field('add','employee_id'))"
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
                                <uni-easyinput type="text" v-model="form['employee_name']" v-if="user_group === '管理员' || (form['employee_information_id'] && $check_field('set','employee_name')) || (!form['employee_information_id'] && $check_field('add','employee_name'))" :disabled="disabledObj['employee_name_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','employee_name')">
                  {{ form['employee_name'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','gender') || $check_field('add','gender') || $check_field('set','gender')" label="性别" name="gender">
                                <uni-easyinput type="text" v-model="form['gender']" v-if="user_group === '管理员' || (form['employee_information_id'] && $check_field('set','gender')) || (!form['employee_information_id'] && $check_field('add','gender'))" :disabled="disabledObj['gender_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','gender')">
                  {{ form['gender'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','age') || $check_field('add','age') || $check_field('set','age')" label="年龄" name="age">
                                <uni-easyinput type="text" v-model="form['age']" v-if="user_group === '管理员' || (form['employee_information_id'] && $check_field('set','age')) || (!form['employee_information_id'] && $check_field('add','age'))" :disabled="disabledObj['age_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','age')">
                  {{ form['age'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','native_place') || $check_field('add','native_place') || $check_field('set','native_place')" label="籍贯" name="native_place">
                                <uni-easyinput type="text" v-model="form['native_place']" v-if="user_group === '管理员' || (form['employee_information_id'] && $check_field('set','native_place')) || (!form['employee_information_id'] && $check_field('add','native_place'))" :disabled="disabledObj['native_place_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','native_place')">
                  {{ form['native_place'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','contact_number') || $check_field('add','contact_number') || $check_field('set','contact_number')" label="联系电话" name="contact_number">
                                <uni-easyinput type="text" v-model="form['contact_number']" v-if="user_group === '管理员' || (form['employee_information_id'] && $check_field('set','contact_number')) || (!form['employee_information_id'] && $check_field('add','contact_number'))" :disabled="disabledObj['contact_number_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','contact_number')">
                  {{ form['contact_number'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','professional_skills') || $check_field('add','professional_skills') || $check_field('set','professional_skills')" label="专业技能" name="professional_skills">
                                <uni-easyinput type="text" v-model="form['professional_skills']" v-if="user_group === '管理员' || (form['employee_information_id'] && $check_field('set','professional_skills')) || (!form['employee_information_id'] && $check_field('add','professional_skills'))" :disabled="disabledObj['professional_skills_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','professional_skills')">
                  {{ form['professional_skills'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','average') || $check_field('add','average') || $check_field('set','average')" label="平均分" name="average">
                                <uni-easyinput type="text" v-model="form['average']" v-if="user_group === '管理员' || (form['employee_information_id'] && $check_field('set','average')) || (!form['employee_information_id'] && $check_field('add','average'))" :disabled="disabledObj['average_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','average')">
                  {{ form['average'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','number_of_completed_projects') || $check_field('add','number_of_completed_projects') || $check_field('set','number_of_completed_projects')" label="完成项目数量" name="number_of_completed_projects">
                                <uni-easyinput type="text" v-model="form['number_of_completed_projects']" v-if="user_group === '管理员' || (form['employee_information_id'] && $check_field('set','number_of_completed_projects')) || (!form['employee_information_id'] && $check_field('add','number_of_completed_projects'))" :disabled="disabledObj['number_of_completed_projects_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','number_of_completed_projects')">
                  {{ form['number_of_completed_projects'] }}
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
      field: "employee_information_id",
      url_add: "~/api/employee_information/add?",
      url_set: "~/api/employee_information/set?",
      url_get_obj: "~/api/employee_information/get_obj?",
      url_upload: "~/api/employee_information/upload?",

      query: {
        "employee_information_id": 0,
      },

      form: {
            "employee_id": 0, // 员工工号
                    "employee_name":  '', // 员工姓名
                    "gender":  '', // 性别
                    "age":  0 , // 年龄
                    "native_place":  '', // 籍贯
                    "contact_number":  '', // 联系电话
                    "professional_skills":  '', // 专业技能
                    "average":  0 , // 平均分
                    "number_of_completed_projects":  0 , // 完成项目数量
                                "employee_information_id": 0, // ID
                
              },
          disabledObj:{
                        "employee_id_isDisabled": false,
                                "employee_name_isDisabled": false,
                                "gender_isDisabled": false,
                                                    "native_place_isDisabled": false,
                                "contact_number_isDisabled": false,
                                "professional_skills_isDisabled": false,
                                                                          },
                                // 用户列表
            list_user_employee_id: [],
                        // 用户组
            group_user_employee_id: "",
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
            url: _self.$fullUrl('/api/employee_information/upload?'),
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
            url: _self.$fullUrl('/api/employee_information/upload?'),
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
     * 获取员工用户组
     */
    async get_group_user_employee_id() {
      this.form["employee_id"] = this.user.user_id;
      var json = await this.$get("~/api/user_group/get_obj?name=员工");
      if(json.result && json.result.obj){
        this.group_user_employee_id = json.result.obj;
        this.get_user_session_employee_id(this.form['employee_id'])
      }
      else if(json.error){
        console.error(json.error);
      }
    },
    get_user_session_employee_id(id){
      var _this = this;
      var user_id = {"user_id":id}
      var url = "~/api/"+_this.group_user_employee_id.source_table+"/get_obj?"
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
                  if (arr[i] !== "employee_id") {
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
                                                                            },

    is_view(){
      var bl = this.user_group == "管理员";

      if(!bl){
        bl = this.$check_action('/employee_information/table','add');
        console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
      }
      if(!bl){
        bl = this.$check_action('/employee_information/table','set');
        console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
      }
      if(!bl){
        bl = this.$check_action('/employee_information/view','add');
        console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
      }
      if(!bl){
        bl = this.$check_action('/employee_information/view','set');
        console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
      }
      if(!bl){
        bl = this.$check_action('/employee_information/view','get');
        console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
      }

      console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

      return bl;
    },

  },
  created() {
            this.get_list_user_employee();
            this.get_group_user_employee_id();
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
