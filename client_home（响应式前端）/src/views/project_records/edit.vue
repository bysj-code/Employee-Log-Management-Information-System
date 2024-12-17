<template>
	<div class="diy_edit page_project_records" id="project_records_edit">
		<div class='warp'>
			<div class='container'>
				<div class='row diy_edit_content_box'>
						<div v-if="$check_field('set','employee_id') || $check_field('add','employee_id') || $check_field('get','employee_id')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								员工工号:
							</span>
						</div>
						<div class="diy_field diy_down">
							<select id="form_employee_id" :disabled="disabledObj['employee_id_isDisabled']" v-model="form['employee_id']" v-if="(form['employee_id'] && $check_field('set','employee_id')) || (!form['employee_id'] && $check_field('add','employee_id'))" >
								<option v-for="o in list_user_employee_id" :value="o['user_id']">
									{{o['nickname'] + '-' + o['username']}}
								</option>
							</select>
							<span v-else-if="$check_field('get','employee_id')">{{ form['employee_id'] }}</span>
						</div>
					</div>
							<div v-if="$check_field('set','employee_name') || $check_field('add','employee_name') || $check_field('get','employee_name')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								员工姓名:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_employee_name" v-model="form['employee_name']" placeholder="请输入员工姓名" v-if="(form['employee_name'] && $check_field('set','employee_name')) || (!form['employee_name'] && $check_field('add','employee_name'))"  :disabled="disabledObj['employee_name_isDisabled']"/>
							<span v-else-if="$check_field('get','employee_name')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','task_name') || $check_field('add','task_name') || $check_field('get','task_name')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								任务名称:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_task_name" v-model="form['task_name']" placeholder="请输入任务名称" v-if="(form['task_name'] && $check_field('set','task_name')) || (!form['task_name'] && $check_field('add','task_name'))"  :disabled="disabledObj['task_name_isDisabled']"/>
							<span v-else-if="$check_field('get','task_name')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','dispatch_time') || $check_field('add','dispatch_time') || $check_field('get','dispatch_time')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								分派时间:
							</span>
						</div>
								<!-- 文本 -->
									<div class="diy_field diy_text">
							<input type="text" id="form_dispatch_time" v-model="form['dispatch_time']" placeholder="请输入分派时间" v-if="(form['dispatch_time'] && $check_field('set','dispatch_time')) || (!form['dispatch_time'] && $check_field('add','dispatch_time'))"  :disabled="disabledObj['dispatch_time_isDisabled']"/>
							<span v-else-if="$check_field('get','dispatch_time')">{{ form['${obj.name}'] }}</span>
						</div>
										</div>
							<div v-if="$check_field('set','completion') || $check_field('add','completion') || $check_field('get','completion')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								完成情况:
							</span>
						</div>
								<!-- 选项 -->
						<div class="diy_field diy_down">
							<select id="form_completion" v-model="form['completion']" v-if="(form['completion'] && $check_field('set','completion')) || (!form['completion'] && $check_field('add','completion'))" >
								<option v-for="o in list_completion" :value="o">
									{{o}}
								</option>
							</select>
							<span v-else-if="$check_field('get','completion')">{{ form['completion'] }}</span>
						</div>
							</div>
							<div v-if="$check_field('set','record_time') || $check_field('add','record_time') || $check_field('get','record_time')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								记录时间:
							</span>
						</div>
								<!-- 日期 -->
						<div class="diy_field diy_date">
							<input type="date" :disabled="disabledObj['record_time_isDisabled']" id="form_record_time" v-model="form['record_time']" placeholder="请输入记录时间" v-if="(form['record_time'] && $check_field('set','record_time')) || (!form['record_time'] && $check_field('add','record_time'))" />
							<span v-else-if="$check_field('get','record_time')">{{ form['${obj.name}'] }}</span>
						</div>
							</div>
							<div v-if="$check_field('set','details') || $check_field('add','details') || $check_field('get','details')" class="form-item col-12 col-md-6">
						<div class="diy_title">
							<span>
								详情:
							</span>
						</div>
								<!-- 多文本 -->
						<div class="diy_field diy_desc">
							<textarea id="form_details" v-model="form['details']" v-if="(form['details'] && $check_field('set','details')) || (!form['details'] && $check_field('add','details'))" :disabled="disabledObj['details_isDisabled']" />
							<span v-else-if="$check_field('get','details')">{{ form['${obj.name}'] }}</span>
						</div>
							</div>
	




				</div>
				<div class="diy_edit_submit_box row">
					<div class="col-12">
						<div class="btn_box">
							<button class="btn_submit" @click="submit()">提交</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
	import mixin from "@/mixins/page.js";
	export default {
		mixins: [mixin],
		components: {},
		data() {
			return {
				url_get_obj: "~/api/project_records/get_obj?",
				url_add: "~/api/project_records/add?",
				url_set: "~/api/project_records/set?",

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
						"project_records_id": 0,
				},

				obj: {
						"employee_id": 0, // 员工工号
							"employee_name":  '', // 员工姓名
							"task_name":  '', // 任务名称
							"dispatch_time":  '', // 分派时间
							"completion":  '', // 完成情况
							"record_time": new Date().getTime(),
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
							"record_time": new Date().getTime(),
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
												// 完成情况选项列表
				list_completion: ['已完成','进行中'],
						
				// ID字段
				field: "project_records_id",

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
			 * 修改文件
			 * @param { Object } files 上传文件对象
			 * @param { String } str 表单的属性名
			 */
			change_file(files, str) {
				var form = new FormData();
				form.append("file", files[0]);
				this.$post("~/api/project_records/upload?", form, (res) => {
					if (res.result) {
						this.form[str] = res.result.url;
					} else if (res.error) {
						this.$toast(res.error.message);
					}
				});
			},

			/**
			 * 获取对象后获取缓存表单
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_before(param){
				var form = $.db.get("form");
				// if (form) {
        //   delete(form.examine_state)
        //   delete(form.examine_reply)
        //   this.obj = $.push(this.obj ,form);
				// 	this.form = $.push(this.form ,form);
				// }
				// var arr = []
				// for (let key in form) {
				// 	arr.push(key)
				// }
				// for (var i=0;i<arr.length;i++){
				// 	this.disabledObj[arr[i] + '_isDisabled'] = true
				// }
        if (form) {
          var arr = []
          for (let key in form) {
            arr.push(key)
          }
          var arrForm = []
          for (let key in this.form) {
            arrForm.push(key)
          }
          for (var i=0;i<arr.length;i++){
            if (arr[i]!=='examine_state' && arr[i]!=='examine_reply') {
              for (var j = 0; j < arrForm.length; j++) {
                if (arrForm[j] === arr[i]) {
                  this.form[arrForm[j]] = form[arr[i]]
                  this.obj[arrForm[j]] = form[arr[i]]
                  this.disabledObj[arrForm[j] + '_isDisabled'] = true
                  break;
                }
              }
            }
          }
        }
												        if (JSON.stringify(this.form["record_time"]).indexOf("-")===-1) {
          this.form["record_time"] = this.$toTime(parseInt(this.form["record_time"]), "yyyy-MM-dd")
        }
			
        $.db.del("form");
				return param;
			},

			/**
			 * 获取对象后获取缓存表单
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json ,func){
				// var form = $.db.get("form");
				// var obj = Object.assign({} ,form ,this.obj);
				// if (obj) {
        //   delete(obj.examine_state)
        //   delete(obj.examine_reply)
				// 	this.obj = $.push(this.obj ,obj);
				// }
				// if (form) {
        //   delete(form.examine_state)
        //   delete(form.examine_reply)
				// 	this.form = $.push(this.form ,form);
				// }
				if(func){
					func(json);
				}
			},

		},
		created() {
						this.get_list_user_employee();
																					},
	}
</script>

<style>




</style>
