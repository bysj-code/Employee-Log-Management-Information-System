<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','employee_id') || $check_field('add','employee_id') || $check_field('set','employee_id')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="员工工号" prop="employee_id">
																		<div v-if="user_group !== '管理员'">
							{{ get_user_session_employee_id(form['employee_id']) }}
							<!--<el-input id="business_name" v-model="form['employee_id']" placeholder="请输入员工工号"-->
							<!--v-if="user_group === '管理员' || (form['employee_information_id'] && $check_field('set','employee_id')) || (!form['employee_information_id'] && $check_field('add','employee_id'))" :disabled="disabledObj['employee_id_isDisabled']"></el-input>-->
							<!--<div v-else-if="$check_field('get','employee_id')">{{form['employee_id']}}</div>-->
							<el-select v-if="user_group === '管理员' || (form['employee_information_id'] && $check_field('set','employee_id')) || (!form['employee_information_id'] && $check_field('add','employee_id'))" id="employee_id" v-model="form['employee_id']" :disabled="disabledObj['employee_id_isDisabled']">
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
							  v-if="user_group === '管理员' || (form['employee_information_id'] && $check_field('set','employee_name')) || (!form['employee_information_id'] && $check_field('add','employee_name'))" :disabled="disabledObj['employee_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','employee_name')">{{form['employee_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','gender') || $check_field('add','gender') || $check_field('set','gender')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="性别" prop="gender">
												<el-input id="gender" v-model="form['gender']" placeholder="请输入性别"
							  v-if="user_group === '管理员' || (form['employee_information_id'] && $check_field('set','gender')) || (!form['employee_information_id'] && $check_field('add','gender'))" :disabled="disabledObj['gender_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','gender')">{{form['gender']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','age') || $check_field('add','age') || $check_field('set','age')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="年龄" prop="age">
								<el-input-number id="age" v-model.number="form['age']"
						v-if="user_group === '管理员' || (form['employee_information_id'] && $check_field('set','age')) || (!form['employee_information_id'] && $check_field('add','age'))" :disabled="disabledObj['age_isDisabled']"></el-input-number>
					<div v-else-if="$check_field('get','age')">{{form['age']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','native_place') || $check_field('add','native_place') || $check_field('set','native_place')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="籍贯" prop="native_place">
												<el-input id="native_place" v-model="form['native_place']" placeholder="请输入籍贯"
							  v-if="user_group === '管理员' || (form['employee_information_id'] && $check_field('set','native_place')) || (!form['employee_information_id'] && $check_field('add','native_place'))" :disabled="disabledObj['native_place_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','native_place')">{{form['native_place']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','contact_number') || $check_field('add','contact_number') || $check_field('set','contact_number')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="联系电话" prop="contact_number">
												<el-input id="contact_number" v-model="form['contact_number']" placeholder="请输入联系电话"
							  v-if="user_group === '管理员' || (form['employee_information_id'] && $check_field('set','contact_number')) || (!form['employee_information_id'] && $check_field('add','contact_number'))" :disabled="disabledObj['contact_number_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','contact_number')">{{form['contact_number']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','professional_skills') || $check_field('add','professional_skills') || $check_field('set','professional_skills')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="专业技能" prop="professional_skills">
												<el-input id="professional_skills" v-model="form['professional_skills']" placeholder="请输入专业技能"
							  v-if="user_group === '管理员' || (form['employee_information_id'] && $check_field('set','professional_skills')) || (!form['employee_information_id'] && $check_field('add','professional_skills'))" :disabled="disabledObj['professional_skills_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','professional_skills')">{{form['professional_skills']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','average') || $check_field('add','average') || $check_field('set','average')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="平均分" prop="average">
								<el-input-number id="average" v-model.number="form['average']"
						v-if="user_group === '管理员' || (form['employee_information_id'] && $check_field('set','average')) || (!form['employee_information_id'] && $check_field('add','average'))" :disabled="disabledObj['average_isDisabled']"></el-input-number>
					<div v-else-if="$check_field('get','average')">{{form['average']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','number_of_completed_projects') || $check_field('add','number_of_completed_projects') || $check_field('set','number_of_completed_projects')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="完成项目数量" prop="number_of_completed_projects">
								<el-input-number id="number_of_completed_projects" v-model.number="form['number_of_completed_projects']"
						v-if="user_group === '管理员' || (form['employee_information_id'] && $check_field('set','number_of_completed_projects')) || (!form['employee_information_id'] && $check_field('add','number_of_completed_projects'))" :disabled="disabledObj['number_of_completed_projects_isDisabled']"></el-input-number>
					<div v-else-if="$check_field('get','number_of_completed_projects')">{{form['number_of_completed_projects']}}</div>
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
										"age":  0, // 年龄
										"native_place":  '', // 籍贯
										"contact_number":  '', // 联系电话
										"professional_skills":  '', // 专业技能
										"average":  0, // 平均分
										"number_of_completed_projects":  0, // 完成项目数量
											"employee_information_id": 0, // ID
						
				},
				disabledObj:{
								"employee_id_isDisabled": false,
										"employee_name_isDisabled": false,
										"gender_isDisabled": false,
					          			"age_isDisabled": false,
										"native_place_isDisabled": false,
										"contact_number_isDisabled": false,
										"professional_skills_isDisabled": false,
					          			"average_isDisabled": false,
					          			"number_of_completed_projects_isDisabled": false,
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
																						$.db.del("form");
				return param;
			},

			/**
			 * 获取对象之后
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json, func){


																											

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
