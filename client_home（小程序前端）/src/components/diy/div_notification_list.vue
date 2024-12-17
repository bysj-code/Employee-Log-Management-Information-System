<template>
	<view class="diy_details diy_div_notification_list">
		<view v-if="Object.keys(obj).length!==0" class="warp">
			<view class="container">
				<view class="row">
					<view v-if="$check_field('get','title')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>标题:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["title"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','publisher')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>发布人:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["publisher"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','release_time')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>发布时间:</span>
						</view>
							<view class="diy_field diy_date">
							<text>
								{{ $toTime(obj["release_time"],"yyyy-MM-dd") }}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','content_related')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>内容相关:</span>
						</view>
							<view class="diy_field diy_text">
							<text>
								{{obj["content_related"]}}
							</text>
						</view>
						</view>
					<view v-if="$check_field('get','content_details')" class="col-12 col-md-6">
						<view class="diy_title">
							<span>内容详情:</span>
						</view>
							<view class="diy_field diy_desc">
							<text>
								{{ obj["content_details"] }}
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
						notification_list_id: 0
					}
				}
			}
		},
		data() {
			return {
				obj_goods_type: {},
				obj: {},
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
				var res = await this.$get("~/api/notification_list/get_obj", {
					notification_list_id:this.query.notification_list_id
				})

				if (res.result && res.result.obj) {
					this.obj = res.result.obj
				} else {
					console.log("没有请求到商品分类");
				}
			},
							},
		created() {
							},
		async onLoad(){
			if (Object.keys(this.obj_goods).length !== 0) {
				await this.get_obj_goods_type();
				await this.get_obj_by_goods();
			} else if (this.query["notification_list_id"] !==0) {
				await this.get_obj_by_id();
			}
		}
	}
</script>

<style scoped>
	.div_notification_list_details {}

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
