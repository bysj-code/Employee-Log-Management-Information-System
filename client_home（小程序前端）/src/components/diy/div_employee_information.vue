<template>
	<view class="diy_details diy_div_employee_information">
		<view v-if="Object.keys(obj).length!==0" class="warp">
			<view class="container">
				<view class="row">
					<view v-if="$check_field('get','employee_id')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>员工工号:</span>
						</view>
							<view class="diy_field diy_uid">
							<text>
								{{ get_user_employee_id(obj['employee_id']) }}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','employee_name')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>员工姓名:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["employee_name"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','gender')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>性别:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["gender"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','age')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>年龄:</span>
						</view>
							<view class="diy_field diy_number">
							<text>
								{{ obj["age"] }}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','native_place')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>籍贯:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["native_place"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','contact_number')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>联系电话:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["contact_number"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','professional_skills')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>专业技能:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["professional_skills"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','average')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>平均分:</span>
						</view>
							<view class="diy_field diy_number">
							<text>
								{{ obj["average"] }}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','number_of_completed_projects')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>完成项目数量:</span>
						</view>
							<view class="diy_field diy_number">
							<text>
								{{ obj["number_of_completed_projects"] }}
							</text>
						</view>
						</view>
				</view>
			</view>
		</view>

			<view class="warp">
			<view class="container">
				<view class="row">
					<view class="col">
						<button type="button" class="diy_btn" @click="to_form('/pages/task_arrangement/edit')" v-if="$check_action('/task_arrangement/edit','add') || $check_action('/task_arrangement/edit','set')" >分派</button>
					</view>
				</view>
			</view>
		</view>
		</view>
</template>

<script>
	import mixin from "@/libs/mixins/component.js";
	export default {
		mixins: [mixin],
		props: {
			obj_goods: {
				type: Object,
				default(){
					return {}
				}
			},
			query:{
				type: Object,
				default(){
					return {
						employee_information_id: 0
					}
				}
			}
		},
		data() {
			return {
				obj_goods_type: {},
				obj: {},
					// 用户列表
				list_user_employee_id: [],
												}
		},
		methods: {
			async get_obj_goods_type() {
				var res = await this.$get("~/api/goods_type/get_obj", {
					name: this.obj_goods.type
				})

				if (res.result.obj) {
					this.obj_goods_type = res.result.obj
				} else {
					console.log("没有请求到商品分类");
				}
			},
			async get_obj_by_goods() {
				var {
					source_table,
					source_field
				} = this.obj_goods_type
				var {
					source_id
				} = this.obj_goods
				var query = {}
				query[source_field] = source_id
				this.$get("~/api/" + source_table + "/get_obj", {}, (res) => {
					if (res.result.obj) {
						this.obj = res.result.obj
					} else {
						console.log("没有请求到商品分类");
					}
				})
			},
			async get_obj_by_id(){
				var res = await this.$get("~/api/employee_information/get_obj", {
					employee_information_id:this.query.employee_information_id
				})

				if (res.result && res.result.obj) {
					this.obj = res.result.obj
				} else {
					console.log("没有请求到商品分类");
				}
			},
				/**
			 * 获取员工用户列表
			 */
			async get_list_user_employee() {
				var json = await this.$get("~/api/user/get_list?user_group=员工");
				if(json.result && json.result.list){
					this.list_user_employee_id = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
			get_user_employee_id(id){
				let obj = this.list_user_employee_id;
				let ret = "";
				for(let i=0;i<obj.length;i++){
					if(obj[i].user_id==id){
						ret = obj[i].nickname+"-"+obj[i].username;
					}
				}
				return ret;
			},
											},
		created() {
				this.get_list_user_employee();
											},
		async onLoad(){
			if (Object.keys(this.obj_goods).length !== 0) {
				await this.get_obj_goods_type();
				await this.get_obj_by_goods();
			} else if (this.query["employee_information_id"] !==0) {
				await this.get_obj_by_id();
			}
		}
	}
</script>

<style scoped>
	.div_employee_information_details {}

	.details {
		background-color: #fff;
		margin-bottom: 0.5rem;
		padding: 1rem;
		font-size: 10px;
	}

	.item {
		display: flex;
		padding: 0.2rem 0;
		border-bottom: 1px solid #eee;
	}

	.left_text {
		flex: 0 0 25%;
	}

	.right_text {
		flex: 0 0 75%;
	}
	.edit_nav{
		text-align: center;
		background-color: #fff;
		padding: 0.3rem;
		margin: 0.1rem 1rem;
		border: 1px solid #eee;
		border-radius: 0.5rem;
	}
</style>
