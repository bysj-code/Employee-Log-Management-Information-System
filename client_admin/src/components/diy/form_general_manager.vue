<template>
	<div>
			<el-form-item v-if="$check_register_field('add','general_manager_no','/general_manager/view')" label="总经理编号" prop="general_manager_no">
				<el-input id="general_manager_no" v-model="form['general_manager_no']" placeholder="请输入总经理编号"></el-input>
				</el-form-item>
				<el-form-item v-if="$check_register_field('add','full_name','/general_manager/view')" label="姓名" prop="full_name">
				<el-input id="full_name" v-model="form['full_name']" placeholder="请输入姓名"></el-input>
				</el-form-item>
				<el-form-item v-if="$check_register_field('add','gender','/general_manager/view')" label="性别" prop="gender">
				<el-select id="gender" v-model="form['gender']">
			<el-option v-for="o in list_gender" :key="o" :label="o" :value="o">
			</el-option>
		</el-select>
				</el-form-item>
	
	</div>
</template>

<script>
	import mixin from "@/mixins/component.js";

	export default {
		mixins: [mixin],
		props:{

			form:{
				type: Object,
				default: function(){
					return {
							"general_manager_no":  '' ,
								"full_name":  '' ,
								"gender":  '' ,
						}
				}
			},

		},
		data() {
			return {
				field: "general_manager_id",
				url_add: "~/api/general_manager/add?",
				url_set: "~/api/general_manager/set?",
				url_upload: "~/api/general_manager/upload?",

							list_gender: ['男','女'],
	
				rules: {
					"general_manager_no": [    {required: true,message: '总经理编号不能为空'},  ],
					"full_name": [    {required: true,message: '姓名不能为空'},  ],
					"gender": [    {required: true,message: '性别不能为空'},  ],
				}

			}
		},
		methods: {

	
	
	

	
	
	

	
	
	

		},
		created() {
					}
	}
</script>
