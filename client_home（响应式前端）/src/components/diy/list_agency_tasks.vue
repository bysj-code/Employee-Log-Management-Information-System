<template>
	<div class="diy_home diy_list diy_agency_tasks" id="diy_agency_tasks_list">
		<!-- 列表 -->
		<div class="diy_view_list list list-x" v-if="show">
			<router-link class="diy_card goods diy_list_box_wrap" v-for="(o, i) in list" :key="i"
				:to="'/agency_tasks/details?agency_tasks_id=' + o['agency_tasks_id']">
				<!-- 图片 -->
				<div class="diy_list_img_box" v-if="imgList.length" >
					<div class="diy_row" v-for="(item,index) in imgList" :key="item+index" v-show="$check_field('get',item.name,'/agency_tasks/details') && +item.is_img_list">
						<div class="diy_title diy_list_img_title">
							<span>{{item.title}}:</span>
						</div>
						<div class="diy_field diy_img">
							<img :src="$fullUrl(o[item.name])" style="width:100%;height:100%" />
						</div>
					</div>
				</div>
				<!-- 内容 -->
				<div class="diy_list_item_box">
					<div class="diy_list_item_content" v-for="(item,index) in showItemList" :key="item+index">
						<div class="diy_row" :class="{[item.name]:true}" v-if="$check_field('get',item.name,'/agency_tasks/details') && +item.is_img_list">
							<div class="diy_title">
								<span>{{item.title}}:</span>
							</div>
							<div class="diy_field diy_text">
								<span v-if="item.type == 'UID'" v-text="get_user_name(item.name,o[item.name])"></span>
								<span v-else-if="item.type == '日期'" v-text="$toTime(o[item.name],'yyyy-MM-dd')"></span>
								<span v-else-if="item.type == '时间'" v-text="$toTime(o[item.name],'hh:mm:ss')"></span>
								<span v-else-if="item.type == '日长'" v-text="$toTime(o[item.name],'yyyy-MM-dd hh:mm:ss')"></span>
								<span v-else v-text="o[item.name]"></span>
							</div>
						</div>
					</div>
				</div>
			</router-link>
		</div>
		<!-- 表格 -->
		<div class="diy_view_table" v-else>
			<table class="diy_table">
				<tr class="diy_row">
						<th class="diy_title" v-if="$check_field('get','title')">
						标题
					</th>
							<th class="diy_title" v-if="$check_field('get','general_manager_no')">
						总经理编号
					</th>
							<th class="diy_title" v-if="$check_field('get','full_name')">
						姓名
					</th>
							<th class="diy_title" v-if="$check_field('get','task_name')">
						任务名称
					</th>
							<th class="diy_title" v-if="$check_field('get','creation_time')">
						创建时间
					</th>
							<th class="diy_title" v-if="$check_field('get','closing_date')">
						截止日期
					</th>
							<th class="diy_title" v-if="$check_field('get','task_details')">
						任务详情
					</th>
					</tr>
				<tr class="diy_row" v-for="(o,i) in list" :key="o+i">
						<td class="diy_field diy_text" v-if="$check_field('get','title')">
						<span>
							{{ o["title"] }}
						</span>
					</td>
							<td class="diy_field diy_uid" v-if="$check_field('get','general_manager_no')">
						<span>
							{{ get_user_name('general_manager_no',o['general_manager_no']) }}
						</span>
					</td>
							<td class="diy_field diy_text" v-if="$check_field('get','full_name')">
						<span>
							{{ o["full_name"] }}
						</span>
					</td>
							<td class="diy_field diy_text" v-if="$check_field('get','task_name')">
						<span>
							{{ o["task_name"] }}
						</span>
					</td>
							<td class="diy_field diy_date" v-if="$check_field('get','creation_time')">
						<span>
							{{ $toTime(o["creation_time"] ,"yyyy-MM-dd") }}
						</span>
					</td>
							<td class="diy_field diy_date" v-if="$check_field('get','closing_date')">
						<span>
							{{ $toTime(o["closing_date"] ,"yyyy-MM-dd") }}
						</span>
					</td>
							<td class="diy_field diy_text" v-if="$check_field('get','task_details')">
						<span>
							{{ o["task_details"] }}
						</span>
					</td>
					</tr>
			</table>
		</div>
	</div>
</template>

<script>
	export default {
		props: {
			list: {
				type: Array,
				default: function() {
					return [];
				},
			},
			show: {
				type: Boolean,
				default: function(){
					return true;
				}
			}
		},
		data() {
			return {
						imgList: [
						],
						itemList: [
								{
									title: "标题",
									name: "title",
									type: "文本",
									is_img_list: "0"
								},
								{
									title: "总经理编号",
									name: "general_manager_no",
									type: "UID",
									is_img_list: "0"
								},
								{
									title: "姓名",
									name: "full_name",
									type: "文本",
									is_img_list: "0"
								},
								{
									title: "任务名称",
									name: "task_name",
									type: "文本",
									is_img_list: "0"
								},
								{
									title: "创建时间",
									name: "creation_time",
									type: "日期",
									is_img_list: "0"
								},
								{
									title: "截止日期",
									name: "closing_date",
									type: "日期",
									is_img_list: "0"
								},
						],
						richList: [
								{
									title: "任务详情",
									name: "task_details",
									type: "多文本"
								},
						],
						// 用户列表
				list_user_general_manager_no: [],
									};
		},
		methods: {
			get_user_name(name,id){
				var obj = null;
						if (name == 'general_manager_no'){
					obj = this.list_user_general_manager_no.getObj({"user_id":id});
				}
										var ret = "";
				if(obj){
					ret = obj.nickname+"-"+obj.username;
					// if(obj.nickname){
					// 	ret = obj.nickname;
					// }
					// else{
					// 	ret = obj.username;
					// }
				}
				return ret;
			},
					/**
			 * 获取总经理用户列表
			 */
			async get_list_user_general_manager_no() {
				var json = await this.$get("~/api/user/get_list?user_group=总经理");
				if(json.result && json.result.list){
					this.list_user_general_manager_no = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},
								},
		created() {
					this.get_list_user_general_manager_no();
								},
		computed:{
			showItemList(){
				let arr = [];
				let _type = ["视频","音频","文件"];
				this.itemList.forEach(item => {
					if(_type.indexOf(item.type) === -1 && !!+item.is_img_list){
						arr.push(item)
					}
				})
				return arr.slice(0,4);
			}
		}
	};
</script>

<style scoped>
	.media {
		display: flex;
		flex-direction: column;
		justify-content: space-between;
		flex-basis: 75%;
		min-height: 10rem;
	}

	.goods {
		display: flex;
		width: calc(25% - 1rem);
		margin: 0.5rem;
		padding: 0.5rem;
		flex-direction: column;
		justify-content: space-between;
		background-color: white;
		border-radius: 0.5rem;
	}

	.goods:hover {
		border: 0.2rem solid #909399;
		box-shadow: 0 0.1rem 0.3rem rgba(0, 0, 0, 0.15);
	}

	.goods:hover img {
		filter: blur(1px);
	}

	.price {
		font-size: 1rem;
		margin-right: 3px;
	}

	.price_ago {
		text-decoration: line-through;
		font-size: 0.5rem;
		color: #999;

	}

	.title {
		word-break: break-all;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
		font-weight: 700;
		padding: .25rem;
	}

	.icon_cart {
		color: #FF5722;
		float: right;
	}

	@media (max-width: 992px) {

		.goods {
			width: calc(33% - 1rem);
			;
		}

	}

	@media (max-width: 768px) {

		.goods {
			width: calc(50% - 1rem);
			;
		}

	}
</style>

