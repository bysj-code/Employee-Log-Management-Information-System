<template>
  <div class="page_search">
	<div class="warp">
	  <div class="container">
		<div class="row">
		  <div class="col-12">
			<div class="card_result_search">
			  <div class="title">搜索结果</div>

				<!-- 文章搜索结果 -->
			  <list_result_search
				:list="result_article"
				title="新闻资讯"
				source_table="article"
			  ></list_result_search>


									  <list_result_search
				v-if="$check_action('/staff/list', 'get')"
				:list="result_staff_employee_name"
				title="员工员工姓名"
				source_table="staff"
			  ></list_result_search>
												  <list_result_search
				v-if="$check_action('/notification_list/list', 'get')"
				:list="result_notification_list_title"
				title="通知列表标题"
				source_table="notification_list"
			  ></list_result_search>
																								  <list_result_search
				v-if="$check_action('/employee_information/list', 'get')"
				:list="result_employee_information_employee_name"
				title="员工信息员工姓名"
				source_table="employee_information"
			  ></list_result_search>
																																				  <list_result_search
				v-if="$check_action('/problem_feedback/list', 'get')"
				:list="result_problem_feedback_employee_name"
				title="问题反馈员工姓名"
				source_table="problem_feedback"
			  ></list_result_search>
																		  <list_result_search
				v-if="$check_action('/clock_in/list', 'get')"
				:list="result_clock_in_employee_name"
				title="打卡签到员工姓名"
				source_table="clock_in"
			  ></list_result_search>
																					  <list_result_search
				v-if="$check_action('/project_records/list', 'get')"
				:list="result_project_records_employee_name"
				title="项目记录员工姓名"
				source_table="project_records"
			  ></list_result_search>
								  <list_result_search
				v-if="$check_action('/project_records/list', 'get')"
				:list="result_project_records_task_name"
				title="项目记录任务名称"
				source_table="project_records"
			  ></list_result_search>
																					  <list_result_search
				v-if="$check_action('/employee_log/list', 'get')"
				:list="result_employee_log_log_title"
				title="员工日志日志标题"
				source_table="employee_log"
			  ></list_result_search>
																								  <list_result_search
				v-if="$check_action('/department_head/list', 'get')"
				:list="result_department_head_supervisor_name"
				title="部门主管主管姓名"
				source_table="department_head"
			  ></list_result_search>
															  <list_result_search
				v-if="$check_action('/task_arrangement/list', 'get')"
				:list="result_task_arrangement_employee_name"
				title="任务安排员工姓名"
				source_table="task_arrangement"
			  ></list_result_search>
														  <list_result_search
				v-if="$check_action('/task_arrangement/list', 'get')"
				:list="result_task_arrangement_task_name"
				title="任务安排任务名称"
				source_table="task_arrangement"
			  ></list_result_search>
																					  <list_result_search
				v-if="$check_action('/project_scoring/list', 'get')"
				:list="result_project_scoring_task_name"
				title="项目打分任务名称"
				source_table="project_scoring"
			  ></list_result_search>
																					  <list_result_search
				v-if="$check_action('/work_tracking/list', 'get')"
				:list="result_work_tracking_title"
				title="工作追踪标题"
				source_table="work_tracking"
			  ></list_result_search>
											  <list_result_search
				v-if="$check_action('/work_tracking/list', 'get')"
				:list="result_work_tracking_supervisor_name"
				title="工作追踪主管姓名"
				source_table="work_tracking"
			  ></list_result_search>
																					  <list_result_search
				v-if="$check_action('/general_manager/list', 'get')"
				:list="result_general_manager_full_name"
				title="总经理姓名"
				source_table="general_manager"
			  ></list_result_search>
												  <list_result_search
				v-if="$check_action('/agency_tasks/list', 'get')"
				:list="result_agency_tasks_title"
				title="代办任务标题"
				source_table="agency_tasks"
			  ></list_result_search>
																								</div>
		  </div>
		</div>
	  </div>
	</div>
  </div>
</template>

<script>
import mixin from "../../mixins/page.js";
import list_result_search from "../../components/diy/list_result_search.vue";

export default {
  mixins: [mixin],
  data() {
	return {
	  "query": {
		word: "",
	  },
	  "result_article": [],
									"result_staff_employee_name":[],
												"result_notification_list_title":[],
																								"result_employee_information_employee_name":[],
																																				"result_problem_feedback_employee_name":[],
																		"result_clock_in_employee_name":[],
																					"result_project_records_employee_name":[],
								"result_project_records_task_name":[],
																					"result_employee_log_log_title":[],
																								"result_department_head_supervisor_name":[],
															"result_task_arrangement_employee_name":[],
														"result_task_arrangement_task_name":[],
																					"result_project_scoring_task_name":[],
																					"result_work_tracking_title":[],
											"result_work_tracking_supervisor_name":[],
																					"result_general_manager_full_name":[],
												"result_agency_tasks_title":[],
																						};
  },
  methods: {
	/**
	 * 获取文章
	 */
	get_article() {
	  this.$get("~/api/article/get_list?like=0", { page: 1, size: 10, title: this.query.word }, (json) => {
		if (json.result) {
		  this.result_article = json.result.list;
		}
	  });
	},

							/**
	 * 获取employee_name
	 */
	get_staff_employee_name(){
		this.$get("~/api/staff/get_list?like=0", { page: 1, size: 10, "employee_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_staff_employee_name = json.result.list;
			result_staff_employee_name.map(o => o.title = o['employee_name'])
	  			this.result_staff_employee_name = result_staff_employee_name
		 	}
		});
	},
										/**
	 * 获取title
	 */
	get_notification_list_title(){
		this.$get("~/api/notification_list/get_list?like=0", { page: 1, size: 10, "title": this.query.word }, (json) => {
		  if (json.result) {
			var result_notification_list_title = json.result.list;
			result_notification_list_title.map(o => o.title = o['title'])
	  			this.result_notification_list_title = result_notification_list_title
		 	}
		});
	},
																						/**
	 * 获取employee_name
	 */
	get_employee_information_employee_name(){
		this.$get("~/api/employee_information/get_list?like=0", { page: 1, size: 10, "employee_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_employee_information_employee_name = json.result.list;
			result_employee_information_employee_name.map(o => o.title = o['employee_name'])
	  			this.result_employee_information_employee_name = result_employee_information_employee_name
		 	}
		});
	},
																																		/**
	 * 获取employee_name
	 */
	get_problem_feedback_employee_name(){
		this.$get("~/api/problem_feedback/get_list?like=0", { page: 1, size: 10, "employee_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_problem_feedback_employee_name = json.result.list;
			result_problem_feedback_employee_name.map(o => o.title = o['employee_name'])
	  			this.result_problem_feedback_employee_name = result_problem_feedback_employee_name
		 	}
		});
	},
																/**
	 * 获取employee_name
	 */
	get_clock_in_employee_name(){
		this.$get("~/api/clock_in/get_list?like=0", { page: 1, size: 10, "employee_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_clock_in_employee_name = json.result.list;
			result_clock_in_employee_name.map(o => o.title = o['employee_name'])
	  			this.result_clock_in_employee_name = result_clock_in_employee_name
		 	}
		});
	},
																			/**
	 * 获取employee_name
	 */
	get_project_records_employee_name(){
		this.$get("~/api/project_records/get_list?like=0", { page: 1, size: 10, "employee_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_project_records_employee_name = json.result.list;
			result_project_records_employee_name.map(o => o.title = o['employee_name'])
	  			this.result_project_records_employee_name = result_project_records_employee_name
		 	}
		});
	},
						/**
	 * 获取task_name
	 */
	get_project_records_task_name(){
		this.$get("~/api/project_records/get_list?like=0", { page: 1, size: 10, "task_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_project_records_task_name = json.result.list;
			result_project_records_task_name.map(o => o.title = o['task_name'])
	  			this.result_project_records_task_name = result_project_records_task_name
		 	}
		});
	},
																			/**
	 * 获取log_title
	 */
	get_employee_log_log_title(){
		this.$get("~/api/employee_log/get_list?like=0", { page: 1, size: 10, "log_title": this.query.word }, (json) => {
		  if (json.result) {
			var result_employee_log_log_title = json.result.list;
			result_employee_log_log_title.map(o => o.title = o['log_title'])
	  			this.result_employee_log_log_title = result_employee_log_log_title
		 	}
		});
	},
																						/**
	 * 获取supervisor_name
	 */
	get_department_head_supervisor_name(){
		this.$get("~/api/department_head/get_list?like=0", { page: 1, size: 10, "supervisor_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_department_head_supervisor_name = json.result.list;
			result_department_head_supervisor_name.map(o => o.title = o['supervisor_name'])
	  			this.result_department_head_supervisor_name = result_department_head_supervisor_name
		 	}
		});
	},
													/**
	 * 获取employee_name
	 */
	get_task_arrangement_employee_name(){
		this.$get("~/api/task_arrangement/get_list?like=0", { page: 1, size: 10, "employee_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_task_arrangement_employee_name = json.result.list;
			result_task_arrangement_employee_name.map(o => o.title = o['employee_name'])
	  			this.result_task_arrangement_employee_name = result_task_arrangement_employee_name
		 	}
		});
	},
												/**
	 * 获取task_name
	 */
	get_task_arrangement_task_name(){
		this.$get("~/api/task_arrangement/get_list?like=0", { page: 1, size: 10, "task_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_task_arrangement_task_name = json.result.list;
			result_task_arrangement_task_name.map(o => o.title = o['task_name'])
	  			this.result_task_arrangement_task_name = result_task_arrangement_task_name
		 	}
		});
	},
																			/**
	 * 获取task_name
	 */
	get_project_scoring_task_name(){
		this.$get("~/api/project_scoring/get_list?like=0", { page: 1, size: 10, "task_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_project_scoring_task_name = json.result.list;
			result_project_scoring_task_name.map(o => o.title = o['task_name'])
	  			this.result_project_scoring_task_name = result_project_scoring_task_name
		 	}
		});
	},
																			/**
	 * 获取title
	 */
	get_work_tracking_title(){
		this.$get("~/api/work_tracking/get_list?like=0", { page: 1, size: 10, "title": this.query.word }, (json) => {
		  if (json.result) {
			var result_work_tracking_title = json.result.list;
			result_work_tracking_title.map(o => o.title = o['title'])
	  			this.result_work_tracking_title = result_work_tracking_title
		 	}
		});
	},
									/**
	 * 获取supervisor_name
	 */
	get_work_tracking_supervisor_name(){
		this.$get("~/api/work_tracking/get_list?like=0", { page: 1, size: 10, "supervisor_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_work_tracking_supervisor_name = json.result.list;
			result_work_tracking_supervisor_name.map(o => o.title = o['supervisor_name'])
	  			this.result_work_tracking_supervisor_name = result_work_tracking_supervisor_name
		 	}
		});
	},
																			/**
	 * 获取full_name
	 */
	get_general_manager_full_name(){
		this.$get("~/api/general_manager/get_list?like=0", { page: 1, size: 10, "full_name": this.query.word }, (json) => {
		  if (json.result) {
			var result_general_manager_full_name = json.result.list;
			result_general_manager_full_name.map(o => o.title = o['full_name'])
	  			this.result_general_manager_full_name = result_general_manager_full_name
		 	}
		});
	},
										/**
	 * 获取title
	 */
	get_agency_tasks_title(){
		this.$get("~/api/agency_tasks/get_list?like=0", { page: 1, size: 10, "title": this.query.word }, (json) => {
		  if (json.result) {
			var result_agency_tasks_title = json.result.list;
			result_agency_tasks_title.map(o => o.title = o['title'])
	  			this.result_agency_tasks_title = result_agency_tasks_title
		 	}
		});
	},
																					
  },
  components: { list_result_search },
	created(){
    this.query.word = this.$route.query.word || "";
  },
  mounted() {
	this.get_article();
								this.get_staff_employee_name();
											this.get_notification_list_title();
																							this.get_employee_information_employee_name();
																																			this.get_problem_feedback_employee_name();
																	this.get_clock_in_employee_name();
																				this.get_project_records_employee_name();
							this.get_project_records_task_name();
																				this.get_employee_log_log_title();
																							this.get_department_head_supervisor_name();
														this.get_task_arrangement_employee_name();
													this.get_task_arrangement_task_name();
																				this.get_project_scoring_task_name();
																				this.get_work_tracking_title();
										this.get_work_tracking_supervisor_name();
																				this.get_general_manager_full_name();
											this.get_agency_tasks_title();
																					  },
  watch: {
	$route() {
	  $.push(this.query, this.$route.query);
	  this.get_article();
							  this.get_staff_employee_name();
										  this.get_notification_list_title();
																						  this.get_employee_information_employee_name();
																																		  this.get_problem_feedback_employee_name();
																  this.get_clock_in_employee_name();
																			  this.get_project_records_employee_name();
						  this.get_project_records_task_name();
																			  this.get_employee_log_log_title();
																						  this.get_department_head_supervisor_name();
													  this.get_task_arrangement_employee_name();
												  this.get_task_arrangement_task_name();
																			  this.get_project_scoring_task_name();
																			  this.get_work_tracking_title();
									  this.get_work_tracking_supervisor_name();
																			  this.get_general_manager_full_name();
										  this.get_agency_tasks_title();
																						},
  },
};
</script>

<style scoped>
.card_search {
  text-align: center;
}
.card_result_search>.title {
  text-align: center;
  padding: 10px 0;
}
</style>
