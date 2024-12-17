<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','title') || $check_field('add','title') || $check_field('set','title')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="标题" prop="title">
												<el-input id="title" v-model="form['title']" placeholder="请输入标题"
							  v-if="user_group === '管理员' || (form['agency_tasks_id'] && $check_field('set','title')) || (!form['agency_tasks_id'] && $check_field('add','title'))" :disabled="disabledObj['title_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','title')">{{form['title']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','general_manager_no') || $check_field('add','general_manager_no') || $check_field('set','general_manager_no')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="总经理编号" prop="general_manager_no">
																		<div v-if="user_group !== '管理员'">
							{{ get_user_session_general_manager_no(form['general_manager_no']) }}
							<!--<el-input id="business_name" v-model="form['general_manager_no']" placeholder="请输入总经理编号"-->
							<!--v-if="user_group === '管理员' || (form['agency_tasks_id'] && $check_field('set','general_manager_no')) || (!form['agency_tasks_id'] && $check_field('add','general_manager_no'))" :disabled="disabledObj['general_manager_no_isDisabled']"></el-input>-->
							<!--<div v-else-if="$check_field('get','general_manager_no')">{{form['general_manager_no']}}</div>-->
							<el-select v-if="user_group === '管理员' || (form['agency_tasks_id'] && $check_field('set','general_manager_no')) || (!form['agency_tasks_id'] && $check_field('add','general_manager_no'))" id="general_manager_no" v-model="form['general_manager_no']" :disabled="disabledObj['general_manager_no_isDisabled']">
								<el-option v-for="o in list_user_general_manager_no" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
							<el-select v-else-if="$check_field('get','general_manager_no')" id="general_manager_no" v-model="form['general_manager_no']" :disabled="true">
								<el-option v-for="o in list_user_general_manager_no" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
						</div>
						<el-select v-else id="general_manager_no" v-model="form['general_manager_no']" :disabled="disabledObj['general_manager_no_isDisabled']">
							<el-option v-for="o in list_user_general_manager_no" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
																</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','full_name') || $check_field('add','full_name') || $check_field('set','full_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="姓名" prop="full_name">
												<el-input id="full_name" v-model="form['full_name']" placeholder="请输入姓名"
							  v-if="user_group === '管理员' || (form['agency_tasks_id'] && $check_field('set','full_name')) || (!form['agency_tasks_id'] && $check_field('add','full_name'))" :disabled="disabledObj['full_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','full_name')">{{form['full_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','task_name') || $check_field('add','task_name') || $check_field('set','task_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="任务名称" prop="task_name">
												<el-input id="task_name" v-model="form['task_name']" placeholder="请输入任务名称"
							  v-if="user_group === '管理员' || (form['agency_tasks_id'] && $check_field('set','task_name')) || (!form['agency_tasks_id'] && $check_field('add','task_name'))" :disabled="disabledObj['task_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','task_name')">{{form['task_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','creation_time') || $check_field('add','creation_time') || $check_field('set','creation_time')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="创建时间" prop="creation_time">
								<el-date-picker :disabled="disabledObj['creation_time_isDisabled']" v-if="user_group === '管理员' || (form['agency_tasks_id'] && $check_field('set','creation_time')) || (!form['agency_tasks_id'] && $check_field('add','creation_time'))" id="creation_time"
						v-model="form['creation_time']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','creation_time')">{{form['creation_time']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','closing_date') || $check_field('add','closing_date') || $check_field('set','closing_date')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="截止日期" prop="closing_date">
								<el-date-picker :disabled="disabledObj['closing_date_isDisabled']" v-if="user_group === '管理员' || (form['agency_tasks_id'] && $check_field('set','closing_date')) || (!form['agency_tasks_id'] && $check_field('add','closing_date'))" id="closing_date"
						v-model="form['closing_date']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','closing_date')">{{form['closing_date']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','task_details') || $check_field('add','task_details') || $check_field('set','task_details')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="任务详情" prop="task_details">
								<el-input type="textarea" id="task_details" v-model="form['task_details']" placeholder="请输入任务详情"
						v-if="user_group === '管理员' || (form['agency_tasks_id'] && $check_field('set','task_details')) || (!form['agency_tasks_id'] && $check_field('add','task_details'))" :disabled="disabledObj['task_details_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','task_details')">{{form['task_details']}}</div>
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
				field: "agency_tasks_id",
				url_add: "~/api/agency_tasks/add?",
				url_set: "~/api/agency_tasks/set?",
				url_get_obj: "~/api/agency_tasks/get_obj?",
				url_upload: "~/api/agency_tasks/upload?",

				query: {
					"agency_tasks_id": 0,
				},

				form: {
								"title":  '', // 标题
										"general_manager_no": 0, // 总经理编号
										"full_name":  '', // 姓名
										"task_name":  '', // 任务名称
										"creation_time":  '', // 创建时间
										"closing_date":  '', // 截止日期
										"task_details":  '', // 任务详情
											"agency_tasks_id": 0, // ID
						
				},
				disabledObj:{
								"title_isDisabled": false,
										"general_manager_no_isDisabled": false,
										"full_name_isDisabled": false,
										"task_name_isDisabled": false,
										"creation_time_isDisabled": false,
										"closing_date_isDisabled": false,
										"task_details_isDisabled": false,
										},

	
		
					// 用户列表
				list_user_general_manager_no: [],
						// 用户组
				group_user_general_manager_no: "",
				
		
		
		
		
	
			}
		},
		methods: {


	
	
			
	
				/**
			 * 获取总经理用户列表
			 */
			async get_list_user_general_manager_no() {
                // if(this.user_group !== "管理员" && this.form["general_manager_no"] === 0) {
                //     this.form["general_manager_no"] = this.user.user_id;
                // }
                var json = await this.$get("~/api/user/get_list?user_group=总经理");
                if(json.result && json.result.list){
                    this.list_user_general_manager_no = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
					/**
			 * 获取总经理用户组
			 */
			async get_group_user_general_manager_no() {
							this.form["general_manager_no"] = this.user.user_id;
							var json = await this.$get("~/api/user_group/get_obj?name=总经理");
				if(json.result && json.result.obj){
					this.group_user_general_manager_no = json.result.obj;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_session_general_manager_no(id){
				var _this = this;
				var user_id = {"user_id":id}
				var url = "~/api/"+_this.group_user_general_manager_no.source_table+"/get_obj?"
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
												_this.form["general_manager_no"] = id
									_this.disabledObj['general_manager_no' + '_isDisabled'] = true
						for (var i=0;i<arr.length;i++){
						  if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
							for (var j = 0; j < arrForm.length; j++) {
							  if (arr[i] === arrForm[j]) {
								if (arr[i] !== "general_manager_no") {
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
					get_user_general_manager_no(id){
				var obj = this.list_user_general_manager_no.getObj({"user_id":id});
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
										        if (this.form["creation_time"].indexOf("-")===-1){
          this.form["creation_time"] = this.$toTime(parseInt(this.form["creation_time"]),"yyyy-MM-dd")
        }
			        if (this.form["closing_date"].indexOf("-")===-1){
          this.form["closing_date"] = this.$toTime(parseInt(this.form["closing_date"]),"yyyy-MM-dd")
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


														        if(this.form["creation_time"]=="0000-00-00"){
          this.form["creation_time"] = null;
        }
				if(parseInt(this.form["creation_time"]) > 9999){
					this.form["creation_time"] = this.$toTime(parseInt(this.form["creation_time"]),"yyyy-MM-dd")
				}
				        if(this.form["closing_date"]=="0000-00-00"){
          this.form["closing_date"] = null;
        }
				if(parseInt(this.form["closing_date"]) > 9999){
					this.form["closing_date"] = this.$toTime(parseInt(this.form["closing_date"]),"yyyy-MM-dd")
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
					bl = this.$check_action('/agency_tasks/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/agency_tasks/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/agency_tasks/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/agency_tasks/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/agency_tasks/view','get');
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
							this.get_list_user_general_manager_no();
					this.get_group_user_general_manager_no();
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
