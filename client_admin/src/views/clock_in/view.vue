<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','employee_id') || $check_field('add','employee_id') || $check_field('set','employee_id')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="员工工号" prop="employee_id">
																		<div v-if="user_group !== '管理员'">
							{{ get_user_session_employee_id(form['employee_id']) }}
							<!--<el-input id="business_name" v-model="form['employee_id']" placeholder="请输入员工工号"-->
							<!--v-if="user_group === '管理员' || (form['clock_in_id'] && $check_field('set','employee_id')) || (!form['clock_in_id'] && $check_field('add','employee_id'))" :disabled="disabledObj['employee_id_isDisabled']"></el-input>-->
							<!--<div v-else-if="$check_field('get','employee_id')">{{form['employee_id']}}</div>-->
							<el-select v-if="user_group === '管理员' || (form['clock_in_id'] && $check_field('set','employee_id')) || (!form['clock_in_id'] && $check_field('add','employee_id'))" id="employee_id" v-model="form['employee_id']" :disabled="disabledObj['employee_id_isDisabled']">
								<el-option v-for="o in list_user_employee_id" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
							<el-select v-else-if="$check_field('get','employee_id')" id="employee_id" v-model="form['employee_id']" :disabled="true">
								<el-option v-for="o in list_user_employee_id" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
						</div>
						<el-select v-else id="employee_id" v-model="form['employee_id']" :disabled="disabledObj['employee_id_isDisabled']">
							<el-option v-for="o in list_user_employee_id" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
																</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','employee_name') || $check_field('add','employee_name') || $check_field('set','employee_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="员工姓名" prop="employee_name">
												<el-input id="employee_name" v-model="form['employee_name']" placeholder="请输入员工姓名"
							  v-if="user_group === '管理员' || (form['clock_in_id'] && $check_field('set','employee_name')) || (!form['clock_in_id'] && $check_field('add','employee_name'))" :disabled="disabledObj['employee_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','employee_name')">{{form['employee_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','gender') || $check_field('add','gender') || $check_field('set','gender')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="性别" prop="gender">
												<el-input id="gender" v-model="form['gender']" placeholder="请输入性别"
							  v-if="user_group === '管理员' || (form['clock_in_id'] && $check_field('set','gender')) || (!form['clock_in_id'] && $check_field('add','gender'))" :disabled="disabledObj['gender_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','gender')">{{form['gender']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','clock_type') || $check_field('add','clock_type') || $check_field('set','clock_type')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="打卡类型" prop="clock_type">
								<el-select id="clock_type" v-model="form['clock_type']"
						v-if="user_group === '管理员' || (form['clock_in_id'] && $check_field('set','clock_type')) || (!form['clock_in_id'] && $check_field('add','clock_type'))">
						<el-option v-for="o in list_clock_type" :key="o" :label="o" :value="o">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','clock_type')">{{form['clock_type']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','clocking_time') || $check_field('add','clocking_time') || $check_field('set','clocking_time')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="打卡时间" prop="clocking_time">
								<el-date-picker :disabled="disabledObj['clocking_time_isDisabled']" v-if="user_group === '管理员' || (form['clock_in_id'] && $check_field('set','clocking_time')) || (!form['clock_in_id'] && $check_field('add','clocking_time'))" id="clocking_time"
						v-model="form['clocking_time']" type="datetime" placeholder="选择日期时间">
					</el-date-picker>
					<div v-else-if="$check_field('get','clocking_time')">{{form['clocking_time']}}</div>
							</el-form-item>
			</el-col>
					
	
	
				<el-col
					v-if="user_group === '管理员' || $check_action('/clock_in/view', 'set') || $check_action('/clock_in/view', 'add')"
					:xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="当前位置" prop="location_address">
					<el-input style="width: 80%" id="location_address" v-model="form['location_address']"
							  :disabled="true"></el-input>
					<el-button size="mini" @click="getLongitudeLatitude()">定位</el-button>
				</el-form-item>
			</el-col>
	
	
	
	
			<el-col :xs="24" :sm="12" :lg="8" class="el_form_btn_warp">
				<el-form-item>
					<el-button type="primary" @click="submit()">提交</el-button>
					<el-button @click="cancel()">取消</el-button>
				</el-form-item>
			</el-col>

		</el-form>
	</el-main>
</template>

<script>
	import mixin from "@/mixins/page.js";

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
										"clocking_time":  '', // 打卡时间
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
				list_clock_type: ['上班','下班'],
	
		
	
			}
		},
		methods: {


	
	
				/**
			 * 获取员工用户列表
			 */
			async get_list_user_employee() {
                // if(this.user_group !== "管理员" && this.form["employee_id"] === 0) {
                //     this.form["employee_id"] = this.user.user_id;
                // }
                var json = await this.$get("~/api/user/get_list?user_group=员工");
                if(json.result && json.result.list){
                    this.list_user_employee_id = json.result.list;
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
												_this.form["employee_id"] = id
									_this.disabledObj['employee_id' + '_isDisabled'] = true
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
					get_user_employee_id(id){
				var obj = this.list_user_employee_id.getObj({"user_id":id});
				var ret = "";
				if(obj){
					if(obj.nickname){
						ret = obj.nickname;}
					else{
						ret = obj.username;
					}
				}
				return ret;
			},
			
	
			
	
			
	
			
	
		
			/**
			 * 获取对象之前
			 * @param {Object} param
			 */
			get_obj_before(param) {
				var form = "";
																						
				if(this.form && form){
					Object.keys(this.form).forEach(key => {
						Object.keys(form).forEach(dbKey => {
							// if(dbKey === "charging_standard"){
							// 	this.form['charging_rules'] = form[dbKey];
							// 	this.disabledObj['charging_rules_isDisabled'] = true;
							// };
							if(key === dbKey){
								this.disabledObj[key+'_isDisabled'] = true;
							}
						})
					})
				}
									        if (this.form["clocking_time"].indexOf("-")===-1){
            this.form["clocking_time"] = this.$toTime(parseInt(this.form["clocking_time"]),"yyyy-MM-dd hh:mm:ss")
        }
						$.db.del("form");
				return param;
			},

			/**
			 * 获取对象之后
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json, func){


													        if(this.form["clocking_time"]=="0000-00-00 00:00:00"){
          this.form["clocking_time"] = null;
        }
				if(parseInt(this.form["clocking_time"]) > 9999){
					this.form["clocking_time"] = this.$toTime(parseInt(this.form["clocking_time"]),"yyyy-MM-dd hh:mm:ss")
				}
			

			},

			/**
			 * 提交前验证事件
			 * @param {Object} 请求参数
			 * @return {String} 验证成功返回null, 失败返回错误提示
			 */
			submit_check(param) {
				let msg = null
																					return msg;
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
			/**
			 * 上传文件
			 * @param {Object} param
			 */
			uploadimg(param) {
				this.uploadFile(param.file, "avatar");
			},
			getLongitudeLatitude() {
				let _this = this;
				_this.form.location_address = "广东省深圳市南山区科技园";
				_this.form.location_lng = "113.946782";
				_this.form.location_lat = "22.556481";
				//如果该对象存在，那么地理位置服务可用。
				if ('geolocation' in navigator) {
					/* 地理位置服务可用 */
					let options = {
						enableHighAccuracy: true, //布尔值，表示系统是否使用最高精度来表示结果，注意，这会导致较慢的响应时间或者增加电量消耗（比如对于支持gps的移动设备来说）。如果值为false ，设备会通过更快响应以及/或者使用更少的电量等方法来尽可能的节约资源。默认值fasle
						timeout: 5000, //它表明的是设备必须在多长时间（单位毫秒）内返回一个位置。默认直到获取到位置才会返回值。
						maximumAge: 0 //表明可以返回多长时间（即最长年龄，单位毫秒）内的可获取的缓存位置。如果设置为 0, 说明设备不能使用一个缓存位置，而且必须去获取一个真实的当前位置。默认0
					}
					function success(position) {
						//position.coords (只读) 返回一个定义了当前位置的Coordinates对象。
						//position.timestamp (只读) 返回一个时间戳DOMTimeStamp， 这个时间戳表示获取到的位置的时间。
						let lat = position.coords.latitude //当前位置的纬度
						let lng = position.coords.longitude //当前位置精度
						let location=lng+","+lat;
						let url = "http://restapi.amap.com/v3/geocode/regeo?key=b6eb2819a6ba4c5119591614272fe7ca&location="+location;
						_this.$axios.get(url, {
						}).then((res) => {
							if (res.status===200){
								let data = res.data;
								if (data.status==='1'){
									_this.form.location_address = data.regeocode.formatted_address;
									_this.form.location_lng = JSON.stringify(lng);
									_this.form.location_lat = JSON.stringify(lat);
								}else {
									console.log(data.info)
								}
							}
						}).catch((res) => {
							console.log(res);
						});
					}
					function error(err) {
						let errorType = ['您拒绝共享位置信息', '获取不到位置信息', '获取位置信息超时']
						console.log(errorType[err.code - 1])
					}
					navigator.geolocation.getCurrentPosition(success, error, options)
				} else {
					/* 地理位置服务不可用 */
					console.log('无法获取您的位置，请检查定位是否开启或刷新重试')
				}
			},

		},
		created() {
					this.get_list_user_employee();
					this.get_group_user_employee_id();
													},
	}
</script>

<style>
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

	.avatar-uploader-icon {
		font-size: 28px;
		color: #8c939d;
		width: 178px;
		height: 178px;
		line-height: 178px;
		text-align: center;
	}

	.avatar {
		width: 178px;
		height: 178px;
		display: block;
	}




</style>
