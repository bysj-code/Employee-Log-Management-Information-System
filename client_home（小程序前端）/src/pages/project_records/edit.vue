<template>
	<view class="diy_edit page_project_records" id="project_records_edit">
		<view class='warp'>
			<view class='container'>
				<view class='row'>
						<view v-if="$check_field('set','employee_id') || $check_field('add','employee_id') || $check_field('get','employee_id')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								员工工号:
							</text>
						</view>
						<view class="diy_field diy_down diy_text_row diy_select_flex">
							<uni-data-select
									id="form_employee_id"
									v-model="form['employee_id']"
									:localdata="list_user_employee_id"
									:clear="!disabledObj['employee_id_isDisabled']"
									:disabled="disabledObj['employee_id_isDisabled']"
									v-if="(form['employee_id'] && $check_field('set','employee_id')) || (!form['employee_id'] && $check_field('add','employee_id'))"
							></uni-data-select>
							<text v-else-if="$check_field('get','employee_id')">{{ form['employee_id'] }}</text>
						</view>
					</view>
							<view v-if="$check_field('set','employee_name') || $check_field('add','employee_name') || $check_field('get','employee_name')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								员工姓名:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_employee_name" v-model="form['employee_name']" placeholder="请输入员工姓名" v-if="(form['employee_name'] && $check_field('set','employee_name')) || (!form['employee_name'] && $check_field('add','employee_name'))" :disabled="disabledObj['employee_name_isDisabled']" />
							<text v-else-if="$check_field('get','employee_name')">{{ form['employee_name'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','task_name') || $check_field('add','task_name') || $check_field('get','task_name')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								任务名称:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_task_name" v-model="form['task_name']" placeholder="请输入任务名称" v-if="(form['task_name'] && $check_field('set','task_name')) || (!form['task_name'] && $check_field('add','task_name'))" :disabled="disabledObj['task_name_isDisabled']" />
							<text v-else-if="$check_field('get','task_name')">{{ form['task_name'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','dispatch_time') || $check_field('add','dispatch_time') || $check_field('get','dispatch_time')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								分派时间:
							</text>
						</view>
								<!-- 文本 -->
									<view class="diy_field diy_text diy_text_row">
							<input type="text" id="form_dispatch_time" v-model="form['dispatch_time']" placeholder="请输入分派时间" v-if="(form['dispatch_time'] && $check_field('set','dispatch_time')) || (!form['dispatch_time'] && $check_field('add','dispatch_time'))" :disabled="disabledObj['dispatch_time_isDisabled']" />
							<text v-else-if="$check_field('get','dispatch_time')">{{ form['dispatch_time'] }}</text>
						</view>
										</view>
							<view v-if="$check_field('set','completion') || $check_field('add','completion') || $check_field('get','completion')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								完成情况:
							</text>
						</view>
								<!-- 选项 -->
						<view class="diy_field diy_down diy_text_row diy_select_flex">
							<uni-data-select
									id="form_completion"
									v-model="form['completion']"
									:localdata="list_completion"
									v-if="(form['completion'] && $check_field('set','completion')) || (!form['completion'] && $check_field('add','completion'))"
							></uni-data-select>
							<text v-else-if="$check_field('get','completion')">{{ form['completion'] }}</text>
						</view>
							</view>
							<view v-if="$check_field('set','record_time') || $check_field('add','record_time') || $check_field('get','record_time')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								记录时间:
							</text>
						</view>
								<!-- 日期 -->
						<view class="diy_field diy_date">
							<uni-datetime-picker :disabled="disabledObj['record_time_isDisabled']" type="date" id="form_record_time" v-model="form['record_time']" placeholder="请输入记录时间" v-if="(form['record_time'] && $check_field('set','record_time')) || (!form['record_time'] && $check_field('add','record_time'))" />
							<text v-else-if="$check_field('get','record_time')">{{ form['record_time'] }}</text>
						</view>
							</view>
							<view v-if="$check_field('set','details') || $check_field('add','details') || $check_field('get','details')" class="col-12 col-md-6 row-item">
						<view class="diy_title diy_text_row">
							<text>
								详情:
							</text>
						</view>
								<!-- 多文本 -->
						<view class="diy_field diy_desc diy_text_row">
							<textarea id="form_details" v-model="form['details']" v-if="(form['details'] && $check_field('set','details')) || (!form['details'] && $check_field('add','details'))" :disabled="disabledObj['details_isDisabled']"/>
							<text v-else-if="$check_field('get','details')">{{ form['details'] }}</text>
						</view>
							</view>
	
				</view>
				<view class="row">
					<view class="col-12">
						<view class="btn_box">
							<button class="btn_submit primary_btn" @click="submit()">提交</button>
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
	mixins:[mixin],
	components:{},
	data(){
		return{
			url_get_obj:"~/api/project_records/get_obj?",
			url_add:"~/api/project_records/add?",
			url_set:"~/api/project_records/set?",

			// 登录权限
			oauth: {
				"signIn": true,
				"user_group": []
			},

			// 查询条件
			query: {
					"employee_id": 0,
						"employee_name": "",
						"task_name": "",
						"dispatch_time": "",
						"completion": "",
						"record_time": "",
						"details": "",
					"project_records_id": 0
			},

			obj: {
					"employee_id": 0, // 员工工号
						"employee_name":  '', // 员工姓名
						"task_name":  '', // 任务名称
						"dispatch_time":  '', // 分派时间
						"completion":  '', // 完成情况
						"record_time": this.$toTime(new Date().getTime(), "yyyy-MM-dd"),
						"details":  '', // 详情
					"project_records_id": 0,

			},

			// 表单字段
			form: {
					"employee_id": 0, // 员工工号
						"employee_name":  '', // 员工姓名
						"task_name":  '', // 任务名称
						"dispatch_time":  '', // 分派时间
						"completion":  '', // 完成情况
						"record_time": this.$toTime(new Date().getTime(), "yyyy-MM-dd"),
						"details":  '', // 详情
					"project_records_id": 0,
			},
			disabledObj:{
					"employee_id_isDisabled": false,
						"employee_name_isDisabled": false,
						"task_name_isDisabled": false,
						"dispatch_time_isDisabled": false,
						"completion_isDisabled": false,
						"record_time_isDisabled": false,
						"details_isDisabled": false,
				},

					// 用户列表
			list_user_employee_id: [],
											list_completion: [],
						
			field:"project_records_id",
			table_key:"project_records",

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
				json.result.list.map((o) => this.list_user_employee_id.push({value:o.user_id,text:o.nickname + '-' + o.username}));
			}
			else if(json.error){
				console.error(json.error);
			}
		},
		
	
				
	
				
	
				
	
				/**
		 * 获取完成情况列表
		 */
		async get_list_completion() {
					['已完成','进行中'].map((o) => this.list_completion.push({value:o,text:o}));
						},
			
	
				
	
				
	
			change_file(key_name){
			var _self = this;
				this.$chooseFile().then(res=>{
					console.log(res)

						const uploadTask = uni.uploadFile({
							url: _self.$fullUrl("/api/feedback/upload?"),
							filePath: res[0].path,
							name: "file",
							formData: {
								i_want_to_customize: "test",
							},
							header: {
								"x-auth-token": _self.$store.state.user.token,
							},
							success: function(uploadFileRes) {
								console.log(uploadFileRes)
								var filename = JSON.parse(uploadFileRes.data).result.url;
								_self.form[key_name] = filename;
							},
						});

						uploadTask.onProgressUpdate(function(res) {
							_self.percent = res.progress;
							console.log("上传进度" + res.progress);
							console.log("已经上传的数据长度" + res.totalBytesSent);
							console.log(
								"预期需要上传的数据总长度" + res.totalBytesExpectedToSend
							);
						});

				})
		},
		change_img(key_name) {
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
						url: _self.$fullUrl('/api/project_records/upload?'),
						filePath: tempFilePaths[0],
						name: 'file',
						formData: {
							'project_records': 'test'
						},
						header: {
							'x-auth-token': _self.$store.state.user.token
						},
						success: function(uploadFileRes) {
							var filename = JSON.parse(uploadFileRes.data).result.url
							var img_url = filename
							_self.form[key_name] = img_url
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
															if (this.form["record_time"] && JSON.stringify(this.form["record_time"]).indexOf("-")===-1) {
				this.form["record_time"] = this.$toTime(parseInt(this.form["record_time"]), "yyyy-MM-dd")
			}
						uni.db.del("form");
			return param;
		},

		/**
		 * 获取对象后获取缓存表单
		 * @param {Object} json
		 * @param {Object} func
		 */
		get_obj_after(json ,func){
			var form = uni.db.get("form");
			var obj = Object.assign({} ,form ,this.obj);
			if (form) {
				this.obj = uni.push(this.obj ,obj);
			}
			if (form) {
				this.form = uni.push(this.form ,form);
			}
			if(func){
				func(json);
			}
		},

	},
	onLoad(){
					this.get_list_user_employee();
													this.get_list_completion();
										},
}
</script>

<style scoped>
	input{
		font-size: 10px;
	}

	.form_edit {
		background-color: #fff;
		margin-bottom: 0.5rem;
		padding: 1rem;
		font-size: 10px;
	}

	.item {
		display: flex;
		padding: 0.2rem 0;
	}

	.left_text {
		flex: 0 0 25%;
		display: flex;
		align-items: center;
	}

	.right_text {
		flex: 0 0 75%;
		border-bottom: 1px solid #eee;
	}
	.right_text.btn_warp{
		border-bottom: 0;
	}

	.btn_submit {
		text-align: center;
		background-color: #fff;
		padding: 0.3rem;
		margin: 0.1rem 1rem;
		border: 1px solid #eee;
		border-radius: 0.5rem;
	}

	.btn_submit:hover {
		opacity: 0.5;
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




</style>
<style scoped>
/*新样式*/
.diy_text_row {
  display: inline-block;
}
.container {
	margin-top:1rem ;
	padding: 1rem;
    -webkit-box-shadow: 0px 0px 0px #888888;
    box-shadow: 0px 0px 0px #888888;
}
.primary_btn{
		background-color: #22B8B8;
		color: #FFFFFF;
	}
	.btn_submit{
		padding: 0;
		margin-top:1rem ;
	}
	.row-item {
		padding: 10px 10px;
	    background: #f8f6fc;
		margin-bottom: 1rem;
	}
	.diy_field{
		padding-left: 1rem;
	}
	.diy_title{
		align-items: center;
        font-size: 14px;
        color: #333;
	}

	.row-item{
		display: flex !important;
		align-items: baseline;
	}
	.diy_select_flex{
		flex: 1;
	}
	.query_select{
		flex: 1;
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
</style>

