<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','title') || $check_field('add','title') || $check_field('set','title')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="标题" prop="title">
												<el-input id="title" v-model="form['title']" placeholder="请输入标题"
							  v-if="user_group === '管理员' || (form['notification_list_id'] && $check_field('set','title')) || (!form['notification_list_id'] && $check_field('add','title'))" :disabled="disabledObj['title_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','title')">{{form['title']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','publisher') || $check_field('add','publisher') || $check_field('set','publisher')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="发布人" prop="publisher">
												<el-input id="publisher" v-model="form['publisher']" placeholder="请输入发布人"
							  v-if="user_group === '管理员' || (form['notification_list_id'] && $check_field('set','publisher')) || (!form['notification_list_id'] && $check_field('add','publisher'))" :disabled="disabledObj['publisher_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','publisher')">{{form['publisher']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','release_time') || $check_field('add','release_time') || $check_field('set','release_time')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="发布时间" prop="release_time">
								<el-date-picker :disabled="disabledObj['release_time_isDisabled']" v-if="user_group === '管理员' || (form['notification_list_id'] && $check_field('set','release_time')) || (!form['notification_list_id'] && $check_field('add','release_time'))" id="release_time"
						v-model="form['release_time']" type="date" placeholder="选择日期">
					</el-date-picker>
					<div v-else-if="$check_field('get','release_time')">{{form['release_time']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','content_related') || $check_field('add','content_related') || $check_field('set','content_related')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="内容相关" prop="content_related">
												<el-input id="content_related" v-model="form['content_related']" placeholder="请输入内容相关"
							  v-if="user_group === '管理员' || (form['notification_list_id'] && $check_field('set','content_related')) || (!form['notification_list_id'] && $check_field('add','content_related'))" :disabled="disabledObj['content_related_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','content_related')">{{form['content_related']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','content_details') || $check_field('add','content_details') || $check_field('set','content_details')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="内容详情" prop="content_details">
								<el-input type="textarea" id="content_details" v-model="form['content_details']" placeholder="请输入内容详情"
						v-if="user_group === '管理员' || (form['notification_list_id'] && $check_field('set','content_details')) || (!form['notification_list_id'] && $check_field('add','content_details'))" :disabled="disabledObj['content_details_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','content_details')">{{form['content_details']}}</div>
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
				field: "notification_list_id",
				url_add: "~/api/notification_list/add?",
				url_set: "~/api/notification_list/set?",
				url_get_obj: "~/api/notification_list/get_obj?",
				url_upload: "~/api/notification_list/upload?",

				query: {
					"notification_list_id": 0,
				},

				form: {
								"title":  '', // 标题
										"publisher":  '', // 发布人
										"release_time":  '', // 发布时间
										"content_related":  '', // 内容相关
										"content_details":  '', // 内容详情
											"notification_list_id": 0, // ID
						
				},
				disabledObj:{
								"title_isDisabled": false,
										"publisher_isDisabled": false,
										"release_time_isDisabled": false,
										"content_related_isDisabled": false,
										"content_details_isDisabled": false,
										},

	
		
		
		
		
	
			}
		},
		methods: {


	
	
			
	
			
	
			
	
			
	
		
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
						        if (this.form["release_time"].indexOf("-")===-1){
          this.form["release_time"] = this.$toTime(parseInt(this.form["release_time"]),"yyyy-MM-dd")
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


								        if(this.form["release_time"]=="0000-00-00"){
          this.form["release_time"] = null;
        }
				if(parseInt(this.form["release_time"]) > 9999){
					this.form["release_time"] = this.$toTime(parseInt(this.form["release_time"]),"yyyy-MM-dd")
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
					bl = this.$check_action('/notification_list/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/notification_list/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/notification_list/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/notification_list/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/notification_list/view','get');
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
