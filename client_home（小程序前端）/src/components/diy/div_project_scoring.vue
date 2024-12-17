<template>
	<view class="diy_details diy_div_project_scoring">
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
					<view v-if="$check_field('get','task_name')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>任务名称:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["task_name"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','completion')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>完成情况:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["completion"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','scoring_time')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>打分时间:</span>
						</view>
							<view class="diy_field diy_date">
							<text>
								{{ $toTime(obj["scoring_time"],"yyyy-MM-dd") }}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','fraction')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>分数:</span>
						</view>
							<view class="diy_field diy_number">
							<text>
								{{ obj["fraction"] }}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','annotation_notes')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>标注说明:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["annotation_notes"]}}
							</text>
						</view>
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
						project_scoring_id: 0
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
				var res = await this.$get("~/api/project_scoring/get_obj", {
					project_scoring_id:this.query.project_scoring_id
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
			} else if (this.query["project_scoring_id"] !==0) {
				await this.get_obj_by_id();
			}
		}
	}
</script>

<style scoped>
	.div_project_scoring_details {}

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
