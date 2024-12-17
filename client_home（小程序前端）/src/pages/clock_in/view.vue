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
                  v-if="user_group === '管理员' || (form['clock_in_id'] && $check_field('set','employee_id')) || (!form['clock_in_id'] && $check_field('add','employee_id'))"
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
                                <uni-easyinput type="text" v-model="form['employee_name']" v-if="user_group === '管理员' || (form['clock_in_id'] && $check_field('set','employee_name')) || (!form['clock_in_id'] && $check_field('add','employee_name'))" :disabled="disabledObj['employee_name_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','employee_name')">
                  {{ form['employee_name'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','gender') || $check_field('add','gender') || $check_field('set','gender')" label="性别" name="gender">
                                <uni-easyinput type="text" v-model="form['gender']" v-if="user_group === '管理员' || (form['clock_in_id'] && $check_field('set','gender')) || (!form['clock_in_id'] && $check_field('add','gender'))" :disabled="disabledObj['gender_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','gender')">
                  {{ form['gender'] }}
                </text>
                            </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','clock_type') || $check_field('add','clock_type') || $check_field('set','clock_type')" label="打卡类型" name="clock_type">
                        <uni-data-select
                  v-model="form.clock_type"
                  :localdata="list_clock_type"
                  :clear="!disabledObj['clock_type_isDisabled']"
                  :disabled="disabledObj['clock_type_isDisabled']"
                  v-if="user_group === '管理员' || (form['clock_in_id'] && $check_field('set','clock_type')) || (!form['clock_in_id'] && $check_field('add','clock_type'))"
                ></uni-data-select>
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','clock_type')">
                  {{ form['clock_type'] }}
                </text>
                    </uni-forms-item>
              <uni-forms-item v-if="$check_field('get','clocking_time') || $check_field('add','clocking_time') || $check_field('set','clocking_time')" label="打卡时间" name="clocking_time">
                        <uni-datetime-picker v-if="user_group === '管理员' || (form['clock_in_id'] && $check_field('set','clocking_time')) || (!form['clock_in_id'] && $check_field('add','clocking_time'))" @change="changeLog($event,'clocking_time')" v-model="form['clocking_time']" type="datetime" :disabled="disabledObj['clocking_time_isDisabled']" />
                <!-- 仅查看 -->
                <text v-else-if="$check_field('get','clocking_time')">
                  {{ form['clocking_time'] }}
                </text>
                    </uni-forms-item>

              <uni-forms-item label="当前位置" name="location_address">
                <uni-easyinput type="text" placeholder="当前位置":disabled="true" v-model="form['location_address']" />
                <button size="mini" @click="getLongitudeLatitude()">定位</button>
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
      field: "clock_in_id",
      url_add: "~/api/clock_in/add?",
      url_set: "~/api/clock_in/set?",
      url_get_obj: "~/api/clock_in/get_obj?",
      url_upload: "~/api/clock_in/upload?",

      query: {
        "clock_in_id": 0,
      },

      form: {
            "employee_id": 0, // 员工工号
                    "employee_name":  '', // 员工姓名
                    "gender":  '', // 性别
                    "clock_type":  '', // 打卡类型
                    "clocking_time": this.$toTime(new Date().getTime(), "yyyy-MM-dd hh:mm:ss"),
                                "clock_in_id": 0, // ID
                
                "location_address": "", // 定位地址
            "location_lng": "", // 定位地址经度
            "location_lat": "", // 定位地址纬度
              },
          disabledObj:{
                        "employee_id_isDisabled": false,
                                "employee_name_isDisabled": false,
                                "gender_isDisabled": false,
                                "clock_type_isDisabled": false,
                                "clocking_time_isDisabled": false,
                                  },
                                // 用户列表
            list_user_employee_id: [],
                        // 用户组
            group_user_employee_id: "",
                                                                                  // 打卡类型选项列表
          list_clock_type: [],
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
            url: _self.$fullUrl('/api/clock_in/upload?'),
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
            url: _self.$fullUrl('/api/clock_in/upload?'),
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
                                          if (this.form["clocking_time"] && JSON.stringify(this.form["clocking_time"]).indexOf("-")===-1) {
        this.form["clocking_time"] = this.$toTime(parseInt(this.form["clocking_time"]), "yyyy-MM-dd hh:mm:ss")
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
     * 获取打卡类型列表
     */
    async get_list_clock_type() {
          ['上班','下班'].map((o) => this.list_clock_type.push({value:o,text:o}));
            },
        
            
    
    /**
     * 获取对象之后
     * @param {Object} json
     * @param {Object} func
     */
    get_obj_after(json, func){
                                          if (this.form["clocking_time"] && JSON.stringify(this.form["clocking_time"]).indexOf("-")===-1) {
        this.form["clocking_time"] = this.$toTime(parseInt(this.form["clocking_time"]), "yyyy-MM-dd hh:mm:ss")
      }
            },

    is_view(){
      var bl = this.user_group == "管理员";

      if(!bl){
        bl = this.$check_action('/clock_in/table','add');
        console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
      }
      if(!bl){
        bl = this.$check_action('/clock_in/table','set');
        console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
      }
      if(!bl){
        bl = this.$check_action('/clock_in/view','add');
        console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
      }
      if(!bl){
        bl = this.$check_action('/clock_in/view','set');
        console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
      }
      if(!bl){
        bl = this.$check_action('/clock_in/view','get');
        console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
      }

      console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

      return bl;
    },
    getLongitudeLatitude() {
        let _this = this;
        _this.form.location_address = "广东省深圳市南山区科技园";
        _this.form.location_lng = "113.946782";
        _this.form.location_lat = "22.556481";
        uni.getLocation({
            type: 'gcj02',
            success: function (res) {
                let lat = res.latitude //当前位置的纬度
                let lng = res.longitude //当前位置精度
                let location=lng+","+lat;
                let url = "http://restapi.amap.com/v3/geocode/regeo?key=b6eb2819a6ba4c5119591614272fe7ca&location="+location;
                uni.request({url, method: "GET",dataType: "json",
                    success: function (res) {
                        if (res.statusCode===200){
                            let data = res.data;
                            if (data.status==='1'){
                                _this.form.location_address = data.regeocode.formatted_address;
                                _this.form.location_lng = JSON.stringify(lng);
                                _this.form.location_lat = JSON.stringify(lat);
                            }else {
                                console.log(data.info)
                            }
                        }
                    },error: function (err) {
                    console.log(err);
                    }
                })
            },error: function (err) {
                console.log(err);
            }
        })
    },

  },
  created() {
            this.get_list_user_employee();
            this.get_group_user_employee_id();
                                    this.get_list_clock_type();
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
