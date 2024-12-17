<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','employee_id') || $check_field('add','employee_id') || $check_field('set','employee_id')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="员工工号" prop="employee_id">
													<el-select v-if="user_group === '管理员' || (form['task_arrangement_id'] && $check_field('set','employee_id')) || (!form['task_arrangement_id'] && $check_field('add','employee_id'))" id="employee_id" v-model="form['employee_id']" :disabled="disabledObj['employee_id_isDisabled']">
							<el-option v-for="o in list_user_employee_id" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
						<el-select v-else-if="$check_field('get','employee_id')" id="employee_id" v-model="form['employee_id']" :disabled="true">
							<el-option v-for="o in list_user_employee_id" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','employee_name') || $check_field('add','employee_name') || $check_field('set','employee_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="员工姓名" prop="employee_name">
												<el-input id="employee_name" v-model="form['employee_name']" placeholder="请输入员工姓名"
							  v-if="user_group === '管理员' || (form['task_arrangement_id'] && $check_field('set','employee_name')) || (!form['task_arrangement_id'] && $check_field('add','employee_name'))" :disabled="disabledObj['employee_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','employee_name')">{{form['employee_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','contact_number') || $check_field('add','contact_number') || $check_field('set','contact_number')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="联系电话" prop="contact_number">
												<el-input id="contact_number" v-model="form['contact_number']" placeholder="请输入联系电话"
							  v-if="user_group === '管理员' || (form['task_arrangement_id'] && $check_field('set','contact_number')) || (!form['task_arrangement_id'] && $check_field('add','contact_number'))" :disabled="disabledObj['contact_number_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','contact_number')">{{form['contact_number']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','professional_skills') || $check_field('add','professional_skills') || $check_field('set','professional_skills')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="专业技能" prop="professional_skills">
												<el-input id="professional_skills" v-model="form['professional_skills']" placeholder="请输入专业技能"
							  v-if="user_group === '管理员' || (form['task_arrangement_id'] && $check_field('set','professional_skills')) || (!form['task_arrangement_id'] && $check_field('add','professional_skills'))" :disabled="disabledObj['professional_skills_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','professional_skills')">{{form['professional_skills']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','task_name') || $check_field('add','task_name') || $check_field('set','task_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="任务名称" prop="task_name">
												<el-input id="task_name" v-model="form['task_name']" placeholder="请输入任务名称"
							  v-if="user_group === '管理员' || (form['task_arrangement_id'] && $check_field('set','task_name')) || (!form['task_arrangement_id'] && $check_field('add','task_name'))" :disabled="disabledObj['task_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','task_name')">{{form['task_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','dispatch_time') || $check_field('add','dispatch_time') || $check_field('set','dispatch_time')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="分派时间" prop="dispatch_time">
								<el-date-picker :disabled="disabledObj['dispatch_time_isDisabled']" v-if="user_group === '管理员' || (form['task_arrangement_id'] && $check_field('set','dispatch_time')) || (!form['task_arrangement_id'] && $check_field('add','dispatch_time'))" id="dispatch_time"
						v-model="form['dispatch_time']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','dispatch_time')">{{form['dispatch_time']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','task_requirements') || $check_field('add','task_requirements') || $check_field('set','task_requirements')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="任务要求" prop="task_requirements">
								<el-input type="textarea" id="task_requirements" v-model="form['task_requirements']" placeholder="请输入任务要求"
						v-if="user_group === '管理员' || (form['task_arrangement_id'] && $check_field('set','task_requirements')) || (!form['task_arrangement_id'] && $check_field('add','task_requirements'))" :disabled="disabledObj['task_requirements_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','task_requirements')">{{form['task_requirements']}}</div>
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
				field: "task_arrangement_id",
				url_add: "~/api/task_arrangement/add?",
				url_set: "~/api/task_arrangement/set?",
				url_get_obj: "~/api/task_arrangement/get_obj?",
				url_upload: "~/api/task_arrangement/upload?",

				query: {
					"task_arrangement_id": 0,
				},

				form: {
								"employee_id": 0, // 员工工号
										"employee_name":  '', // 员工姓名
										"contact_number":  '', // 联系电话
										"professional_skills":  '', // 专业技能
										"task_name":  '', // 任务名称
										"dispatch_time":  '', // 分派时间
										"task_requirements":  '', // 任务要求
											"task_arrangement_id": 0, // ID
						
				},
				disabledObj:{
								"employee_id_isDisabled": false,
										"employee_name_isDisabled": false,
										"contact_number_isDisabled": false,
										"professional_skills_isDisabled": false,
										"task_name_isDisabled": false,
										"dispatch_time_isDisabled": false,
										"task_requirements_isDisabled": false,
										},

	
					// 用户列表
				list_user_employee_id: [],
				
		
		
		
		
		
	
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
									// 获取缓存数据附加
				form = $.db.get("form");
							$.push(this.form ,form);
																						
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
												        if (this.form["dispatch_time"].indexOf("-")===-1){
          this.form["dispatch_time"] = this.$toTime(parseInt(this.form["dispatch_time"]),"yyyy-MM-dd")
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


																	        if(this.form["dispatch_time"]=="0000-00-00"){
          this.form["dispatch_time"] = null;
        }
				if(parseInt(this.form["dispatch_time"]) > 9999){
					this.form["dispatch_time"] = this.$toTime(parseInt(this.form["dispatch_time"]),"yyyy-MM-dd")
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
					bl = this.$check_action('/task_arrangement/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/task_arrangement/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/task_arrangement/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/task_arrangement/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/task_arrangement/view','get');
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
