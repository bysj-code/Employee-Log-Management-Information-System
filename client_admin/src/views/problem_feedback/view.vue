<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','title') || $check_field('add','title') || $check_field('set','title')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="标题" prop="title">
												<el-input id="title" v-model="form['title']" placeholder="请输入标题"
							  v-if="user_group === '管理员' || (form['problem_feedback_id'] && $check_field('set','title')) || (!form['problem_feedback_id'] && $check_field('add','title'))" :disabled="disabledObj['title_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','title')">{{form['title']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','employee_id') || $check_field('add','employee_id') || $check_field('set','employee_id')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="员工工号" prop="employee_id">
																		<div v-if="user_group !== '管理员'">
							{{ get_user_session_employee_id(form['employee_id']) }}
							<!--<el-input id="business_name" v-model="form['employee_id']" placeholder="请输入员工工号"-->
							<!--v-if="user_group === '管理员' || (form['problem_feedback_id'] && $check_field('set','employee_id')) || (!form['problem_feedback_id'] && $check_field('add','employee_id'))" :disabled="disabledObj['employee_id_isDisabled']"></el-input>-->
							<!--<div v-else-if="$check_field('get','employee_id')">{{form['employee_id']}}</div>-->
							<el-select v-if="user_group === '管理员' || (form['problem_feedback_id'] && $check_field('set','employee_id')) || (!form['problem_feedback_id'] && $check_field('add','employee_id'))" id="employee_id" v-model="form['employee_id']" :disabled="disabledObj['employee_id_isDisabled']">
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
							  v-if="user_group === '管理员' || (form['problem_feedback_id'] && $check_field('set','employee_name')) || (!form['problem_feedback_id'] && $check_field('add','employee_name'))" :disabled="disabledObj['employee_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','employee_name')">{{form['employee_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','feedback_time') || $check_field('add','feedback_time') || $check_field('set','feedback_time')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="反馈时间" prop="feedback_time">
								<el-date-picker :disabled="disabledObj['feedback_time_isDisabled']" v-if="user_group === '管理员' || (form['problem_feedback_id'] && $check_field('set','feedback_time')) || (!form['problem_feedback_id'] && $check_field('add','feedback_time'))" id="feedback_time"
						v-model="form['feedback_time']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','feedback_time')">{{form['feedback_time']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','problem_description') || $check_field('add','problem_description') || $check_field('set','problem_description')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="问题描述" prop="problem_description">
								<el-input type="textarea" id="problem_description" v-model="form['problem_description']" placeholder="请输入问题描述"
						v-if="user_group === '管理员' || (form['problem_feedback_id'] && $check_field('set','problem_description')) || (!form['problem_feedback_id'] && $check_field('add','problem_description'))" :disabled="disabledObj['problem_description_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','problem_description')">{{form['problem_description']}}</div>
							</el-form-item>
			</el-col>
							<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="审核状态" prop="examine_state">
					<el-select id="examine_state" v-model="form['examine_state']"
						v-if="user_group === '管理员' || (form['examine_state'] && $check_examine()) || (!form['examine_state'] && $check_examine())">
						<el-option key="未审核" label="未审核" value="未审核"></el-option>
						<el-option key="已通过" label="已通过" value="已通过"></el-option>
						<el-option key="未通过" label="未通过" value="未通过"></el-option>
					</el-select>
					<div v-else>{{form["examine_state"]}}</div>
				</el-form-item>
			</el-col>
					<el-col :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="审核回复" prop="examine_reply">
					<el-input id="examine_reply" v-model="form['examine_reply']" placeholder="请输入审核回复"
						v-if="user_group === '管理员' || (form['examine_reply'] && $check_examine()) || (!form['examine_reply'] && $check_examine())"></el-input>
					<div v-else>{{form["examine_reply"]}}</div>
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
				field: "problem_feedback_id",
				url_add: "~/api/problem_feedback/add?",
				url_set: "~/api/problem_feedback/set?",
				url_get_obj: "~/api/problem_feedback/get_obj?",
				url_upload: "~/api/problem_feedback/upload?",

				query: {
					"problem_feedback_id": 0,
				},

				form: {
								"title":  '', // 标题
										"employee_id": 0, // 员工工号
										"employee_name":  '', // 员工姓名
										"feedback_time":  '', // 反馈时间
										"problem_description":  '', // 问题描述
									"examine_state": "未审核",
							"examine_reply": "",
							"problem_feedback_id": 0, // ID
						
				},
				disabledObj:{
								"title_isDisabled": false,
										"employee_id_isDisabled": false,
										"employee_name_isDisabled": false,
										"feedback_time_isDisabled": false,
										"problem_description_isDisabled": false,
										},

	
		
					// 用户列表
				list_user_employee_id: [],
						// 用户组
				group_user_employee_id: "",
				
		
		
	
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
								        if (this.form["feedback_time"].indexOf("-")===-1){
          this.form["feedback_time"] = this.$toTime(parseInt(this.form["feedback_time"]),"yyyy-MM-dd")
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


											        if(this.form["feedback_time"]=="0000-00-00"){
          this.form["feedback_time"] = null;
        }
				if(parseInt(this.form["feedback_time"]) > 9999){
					this.form["feedback_time"] = this.$toTime(parseInt(this.form["feedback_time"]),"yyyy-MM-dd")
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
					bl = this.$check_action('/problem_feedback/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/problem_feedback/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/problem_feedback/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/problem_feedback/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/problem_feedback/view','get');
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
