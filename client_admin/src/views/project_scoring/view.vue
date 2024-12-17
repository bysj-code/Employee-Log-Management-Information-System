<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','employee_id') || $check_field('add','employee_id') || $check_field('set','employee_id')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="员工工号" prop="employee_id">
													<el-select v-if="user_group === '管理员' || (form['project_scoring_id'] && $check_field('set','employee_id')) || (!form['project_scoring_id'] && $check_field('add','employee_id'))" id="employee_id" v-model="form['employee_id']" :disabled="disabledObj['employee_id_isDisabled']">
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
							  v-if="user_group === '管理员' || (form['project_scoring_id'] && $check_field('set','employee_name')) || (!form['project_scoring_id'] && $check_field('add','employee_name'))" :disabled="disabledObj['employee_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','employee_name')">{{form['employee_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','task_name') || $check_field('add','task_name') || $check_field('set','task_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="任务名称" prop="task_name">
												<el-input id="task_name" v-model="form['task_name']" placeholder="请输入任务名称"
							  v-if="user_group === '管理员' || (form['project_scoring_id'] && $check_field('set','task_name')) || (!form['project_scoring_id'] && $check_field('add','task_name'))" :disabled="disabledObj['task_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','task_name')">{{form['task_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','completion') || $check_field('add','completion') || $check_field('set','completion')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="完成情况" prop="completion">
												<el-input id="completion" v-model="form['completion']" placeholder="请输入完成情况"
							  v-if="user_group === '管理员' || (form['project_scoring_id'] && $check_field('set','completion')) || (!form['project_scoring_id'] && $check_field('add','completion'))" :disabled="disabledObj['completion_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','completion')">{{form['completion']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','scoring_time') || $check_field('add','scoring_time') || $check_field('set','scoring_time')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="打分时间" prop="scoring_time">
								<el-date-picker :disabled="disabledObj['scoring_time_isDisabled']" v-if="user_group === '管理员' || (form['project_scoring_id'] && $check_field('set','scoring_time')) || (!form['project_scoring_id'] && $check_field('add','scoring_time'))" id="scoring_time"
						v-model="form['scoring_time']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','scoring_time')">{{form['scoring_time']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','fraction') || $check_field('add','fraction') || $check_field('set','fraction')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="分数" prop="fraction">
								<el-input-number id="fraction" v-model.number="form['fraction']"
						v-if="user_group === '管理员' || (form['project_scoring_id'] && $check_field('set','fraction')) || (!form['project_scoring_id'] && $check_field('add','fraction'))" :disabled="disabledObj['fraction_isDisabled']"></el-input-number>
					<div v-else-if="$check_field('get','fraction')">{{form['fraction']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','annotation_notes') || $check_field('add','annotation_notes') || $check_field('set','annotation_notes')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="标注说明" prop="annotation_notes">
												<el-input id="annotation_notes" v-model="form['annotation_notes']" placeholder="请输入标注说明"
							  v-if="user_group === '管理员' || (form['project_scoring_id'] && $check_field('set','annotation_notes')) || (!form['project_scoring_id'] && $check_field('add','annotation_notes'))" :disabled="disabledObj['annotation_notes_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','annotation_notes')">{{form['annotation_notes']}}</div>
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
				field: "project_scoring_id",
				url_add: "~/api/project_scoring/add?",
				url_set: "~/api/project_scoring/set?",
				url_get_obj: "~/api/project_scoring/get_obj?",
				url_upload: "~/api/project_scoring/upload?",

				query: {
					"project_scoring_id": 0,
				},

				form: {
								"employee_id": 0, // 员工工号
										"employee_name":  '', // 员工姓名
										"task_name":  '', // 任务名称
										"completion":  '', // 完成情况
										"scoring_time":  '', // 打分时间
										"fraction":  0, // 分数
										"annotation_notes":  '', // 标注说明
											"project_scoring_id": 0, // ID
						
				},
				disabledObj:{
								"employee_id_isDisabled": false,
										"employee_name_isDisabled": false,
										"task_name_isDisabled": false,
										"completion_isDisabled": false,
										"scoring_time_isDisabled": false,
					          			"fraction_isDisabled": false,
										"annotation_notes_isDisabled": false,
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
										        if (this.form["scoring_time"].indexOf("-")===-1){
          this.form["scoring_time"] = this.$toTime(parseInt(this.form["scoring_time"]),"yyyy-MM-dd")
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


														        if(this.form["scoring_time"]=="0000-00-00"){
          this.form["scoring_time"] = null;
        }
				if(parseInt(this.form["scoring_time"]) > 9999){
					this.form["scoring_time"] = this.$toTime(parseInt(this.form["scoring_time"]),"yyyy-MM-dd")
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
					bl = this.$check_action('/project_scoring/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/project_scoring/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/project_scoring/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/project_scoring/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/project_scoring/view','get');
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
