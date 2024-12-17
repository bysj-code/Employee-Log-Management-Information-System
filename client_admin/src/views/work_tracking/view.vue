<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','title') || $check_field('add','title') || $check_field('set','title')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="标题" prop="title">
												<el-input id="title" v-model="form['title']" placeholder="请输入标题"
							  v-if="user_group === '管理员' || (form['work_tracking_id'] && $check_field('set','title')) || (!form['work_tracking_id'] && $check_field('add','title'))" :disabled="disabledObj['title_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','title')">{{form['title']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','supervisor_no') || $check_field('add','supervisor_no') || $check_field('set','supervisor_no')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="主管编号" prop="supervisor_no">
																		<div v-if="user_group !== '管理员'">
							{{ get_user_session_supervisor_no(form['supervisor_no']) }}
							<!--<el-input id="business_name" v-model="form['supervisor_no']" placeholder="请输入主管编号"-->
							<!--v-if="user_group === '管理员' || (form['work_tracking_id'] && $check_field('set','supervisor_no')) || (!form['work_tracking_id'] && $check_field('add','supervisor_no'))" :disabled="disabledObj['supervisor_no_isDisabled']"></el-input>-->
							<!--<div v-else-if="$check_field('get','supervisor_no')">{{form['supervisor_no']}}</div>-->
							<el-select v-if="user_group === '管理员' || (form['work_tracking_id'] && $check_field('set','supervisor_no')) || (!form['work_tracking_id'] && $check_field('add','supervisor_no'))" id="supervisor_no" v-model="form['supervisor_no']" :disabled="disabledObj['supervisor_no_isDisabled']">
								<el-option v-for="o in list_user_supervisor_no" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
							<el-select v-else-if="$check_field('get','supervisor_no')" id="supervisor_no" v-model="form['supervisor_no']" :disabled="true">
								<el-option v-for="o in list_user_supervisor_no" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
										   :value="o['user_id']">
								</el-option>
							</el-select>
						</div>
						<el-select v-else id="supervisor_no" v-model="form['supervisor_no']" :disabled="disabledObj['supervisor_no_isDisabled']">
							<el-option v-for="o in list_user_supervisor_no" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
																</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','supervisor_name') || $check_field('add','supervisor_name') || $check_field('set','supervisor_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="主管姓名" prop="supervisor_name">
												<el-input id="supervisor_name" v-model="form['supervisor_name']" placeholder="请输入主管姓名"
							  v-if="user_group === '管理员' || (form['work_tracking_id'] && $check_field('set','supervisor_name')) || (!form['work_tracking_id'] && $check_field('add','supervisor_name'))" :disabled="disabledObj['supervisor_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','supervisor_name')">{{form['supervisor_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','task_name') || $check_field('add','task_name') || $check_field('set','task_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="任务名称" prop="task_name">
												<el-input id="task_name" v-model="form['task_name']" placeholder="请输入任务名称"
							  v-if="user_group === '管理员' || (form['work_tracking_id'] && $check_field('set','task_name')) || (!form['work_tracking_id'] && $check_field('add','task_name'))" :disabled="disabledObj['task_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','task_name')">{{form['task_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','closing_date') || $check_field('add','closing_date') || $check_field('set','closing_date')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="截止日期" prop="closing_date">
								<el-date-picker :disabled="disabledObj['closing_date_isDisabled']" v-if="user_group === '管理员' || (form['work_tracking_id'] && $check_field('set','closing_date')) || (!form['work_tracking_id'] && $check_field('add','closing_date'))" id="closing_date"
						v-model="form['closing_date']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','closing_date')">{{form['closing_date']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','tracking') || $check_field('add','tracking') || $check_field('set','tracking')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="追踪情况" prop="tracking">
								<el-input type="textarea" id="tracking" v-model="form['tracking']" placeholder="请输入追踪情况"
						v-if="user_group === '管理员' || (form['work_tracking_id'] && $check_field('set','tracking')) || (!form['work_tracking_id'] && $check_field('add','tracking'))" :disabled="disabledObj['tracking_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','tracking')">{{form['tracking']}}</div>
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
										"closing_date":  '', // 截止日期
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


	
	
			
	
				/**
			 * 获取部门主管用户列表
			 */
			async get_list_user_supervisor_no() {
                // if(this.user_group !== "管理员" && this.form["supervisor_no"] === 0) {
                //     this.form["supervisor_no"] = this.user.user_id;
                // }
                var json = await this.$get("~/api/user/get_list?user_group=部门主管");
                if(json.result && json.result.list){
                    this.list_user_supervisor_no = json.result.list;
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
												_this.form["supervisor_no"] = id
									_this.disabledObj['supervisor_no' + '_isDisabled'] = true
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
					get_user_supervisor_no(id){
				var obj = this.list_user_supervisor_no.getObj({"user_id":id});
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
			/**
			 * 上传文件
			 * @param {Object} param
			 */
			uploadimg(param) {
				this.uploadFile(param.file, "avatar");
			},

		},
		created() {
							this.get_list_user_supervisor_no();
					this.get_group_user_supervisor_no();
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
