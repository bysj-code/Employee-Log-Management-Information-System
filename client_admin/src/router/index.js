import Vue from 'vue';
import VueRouter from 'vue-router';
import index from '../views/index.vue';
import login from '../views/login.vue';
import forgot from '../views/forgot.vue';
import register from '../views/register.vue';
Vue.use(VueRouter)

const routes = [
	// 主页
	{
		path: '/',
		name: 'index',
		component: index,
		meta: {
			index: 0,
			title: '首页'
		}
	},

	// 登录
	{
		path: '/login',
		name: 'login',
		component: login,
		meta: {
			index: 0,
			title: '登录'
		}
	},

	// 注册
	{
		path: '/register',
		name: 'register',
		component: register,
		meta: {
			index: 0,
			title: '注册'
		}
	},

	// 忘记密码
	{
		path: '/forgot',
		name: "forgot",
		component: forgot,
		meta: {
			index: 0,
			title: '忘记密码'
		}
	},

	// 修改密码
	{
		path: '/user/password',
		name: "password",
		component: () => import("../views/user/password.vue"),
		meta: {
			index: 0,
			title: '修改密码'
		}
	},

	// 视频播放页
	{
		path: "/media/video",
		name: "video",
		component: () => import('../views/media/video.vue'),
		meta: {
			index: 0,
			title: "视频"
		}
	},

	// 音频播放页
	{
		path: "/media/audio",
		name: "audio",
		component: () => import('../views/media/audio.vue'),
		meta: {
			index: 0,
			title: "音频"
		}
	},



	// 友情链接路由
	// {
	// 	path: '/link/table',
	// 	name: 'link_table',
	// 	component: () => import('../views/link/table.vue'),
	// 	meta: {
	// 		index: 0,
	// 		title: '链接列表'
	// 	}
	// },
	// {
	// 	path: '/link/view',
	// 	name: 'link_view',
	// 	component: () => import('../views/link/view.vue'),
	// 	meta: {
	// 		index: 0,
	// 		title: '链接详情'
	// 	}
	// },

	// 轮播图路由
	{
		path: '/slides/table',
		name: 'slides_table',
		component: () => import('../views/slides/table.vue'),
		meta: {
			index: 0,
			title: '轮播图列表'
		}
	},
	{
		path: '/slides/view',
		name: 'slides_view',
		component: () => import('../views/slides/view.vue'),
		meta: {
			index: 0,
			title: '轮播图详情'
		}
	},
		// 文章路由
	{
		path: '/article/table',
		name: 'article_table',
		component: () => import('../views/article/table.vue'),
		meta: {
			index: 0,
			title: '文章列表'
		}
	},
	{
		path: '/article/view',
		name: 'article_view',
		component: () => import('../views/article/view.vue'),
		meta: {
			index: 0,
			title: '文章详情'
		}
	},

	// 文章分类路由
	{
		path: '/article_type/table',
		name: 'article_type_table',
		component: () => import('../views/article_type/table.vue'),
		meta: {
			index: 0,
			title: '文章分类列表'
		}
	},
	{
		path: '/article_type/view',
		name: 'article_type_view',
		component: () => import('../views/article_type/view.vue'),
		meta: {
			index: 0,
			title: '文章分类详情'
		}
	},
	
	// 广告路由
	// {
	// 	path: '/ad/table',
	// 	name: 'ad_table',
	// 	component: () => import('../views/ad/table.vue'),
	// 	meta: {
	// 		index: 0,
	// 		title: '广告列表'
	// 	}
	// },
	// {
	// 	path: '/ad/view',
	// 	name: 'ad_view',
	// 	component: () => import('../views/ad/view.vue'),
	// 	meta: {
	// 		index: 0,
	// 		title: '广告详情'
	// 	}
	// },



	// 公告路由
	{
		path: '/notice/table',
		name: 'notice_table',
		component: () => import('../views/notice/table.vue'),
		meta: {
			index: 0,
			title: '公告消息列表'
		}
	},
	{
		path: '/notice/view',
		name: 'notice_view',
		component: () => import('../views/notice/view.vue'),
		meta: {
			index: 0,
			title: '公告消息详情'
		}
	},


	// 评论路由
	{
		path: '/comment/table',
		name: 'comment_table',
		component: () => import('../views/comment/table.vue'),
		meta: {
			index: 0,
			title: '评论列表'
		}
	},
	{
		path: '/comment/view',
		name: 'comment_view',
		component: () => import('../views/comment/view.vue'),
		meta: {
			index: 0,
			title: '评论详情'
		}
	},

	// 员工路由
	{
		path: '/staff/table',
		name: 'staff_table',
		component: () => import('../views/staff/table.vue'),
		meta: {
			index: 0,
			title: '员工列表'
		}
	},
	{
		path: '/staff/view',
		name: 'staff_view',
		component: () => import('../views/staff/view.vue'),
		meta: {
			index: 0,
			title: '员工详情'
		}
	},
	// 通知列表路由
	{
		path: '/notification_list/table',
		name: 'notification_list_table',
		component: () => import('../views/notification_list/table.vue'),
		meta: {
			index: 0,
			title: '通知列表列表'
		}
	},
	{
		path: '/notification_list/view',
		name: 'notification_list_view',
		component: () => import('../views/notification_list/view.vue'),
		meta: {
			index: 0,
			title: '通知列表详情'
		}
	},
	// 员工信息路由
	{
		path: '/employee_information/table',
		name: 'employee_information_table',
		component: () => import('../views/employee_information/table.vue'),
		meta: {
			index: 0,
			title: '员工信息列表'
		}
	},
	{
		path: '/employee_information/view',
		name: 'employee_information_view',
		component: () => import('../views/employee_information/view.vue'),
		meta: {
			index: 0,
			title: '员工信息详情'
		}
	},
	// 问题反馈路由
	{
		path: '/problem_feedback/table',
		name: 'problem_feedback_table',
		component: () => import('../views/problem_feedback/table.vue'),
		meta: {
			index: 0,
			title: '问题反馈列表'
		}
	},
	{
		path: '/problem_feedback/view',
		name: 'problem_feedback_view',
		component: () => import('../views/problem_feedback/view.vue'),
		meta: {
			index: 0,
			title: '问题反馈详情'
		}
	},
	// 打卡签到路由
	{
		path: '/clock_in/table',
		name: 'clock_in_table',
		component: () => import('../views/clock_in/table.vue'),
		meta: {
			index: 0,
			title: '打卡签到列表'
		}
	},
	{
		path: '/clock_in/view',
		name: 'clock_in_view',
		component: () => import('../views/clock_in/view.vue'),
		meta: {
			index: 0,
			title: '打卡签到详情'
		}
	},
	// 项目记录路由
	{
		path: '/project_records/table',
		name: 'project_records_table',
		component: () => import('../views/project_records/table.vue'),
		meta: {
			index: 0,
			title: '项目记录列表'
		}
	},
	{
		path: '/project_records/view',
		name: 'project_records_view',
		component: () => import('../views/project_records/view.vue'),
		meta: {
			index: 0,
			title: '项目记录详情'
		}
	},
	// 员工日志路由
	{
		path: '/employee_log/table',
		name: 'employee_log_table',
		component: () => import('../views/employee_log/table.vue'),
		meta: {
			index: 0,
			title: '员工日志列表'
		}
	},
	{
		path: '/employee_log/view',
		name: 'employee_log_view',
		component: () => import('../views/employee_log/view.vue'),
		meta: {
			index: 0,
			title: '员工日志详情'
		}
	},
	// 部门主管路由
	{
		path: '/department_head/table',
		name: 'department_head_table',
		component: () => import('../views/department_head/table.vue'),
		meta: {
			index: 0,
			title: '部门主管列表'
		}
	},
	{
		path: '/department_head/view',
		name: 'department_head_view',
		component: () => import('../views/department_head/view.vue'),
		meta: {
			index: 0,
			title: '部门主管详情'
		}
	},
	// 任务安排路由
	{
		path: '/task_arrangement/table',
		name: 'task_arrangement_table',
		component: () => import('../views/task_arrangement/table.vue'),
		meta: {
			index: 0,
			title: '任务安排列表'
		}
	},
	{
		path: '/task_arrangement/view',
		name: 'task_arrangement_view',
		component: () => import('../views/task_arrangement/view.vue'),
		meta: {
			index: 0,
			title: '任务安排详情'
		}
	},
	// 项目打分路由
	{
		path: '/project_scoring/table',
		name: 'project_scoring_table',
		component: () => import('../views/project_scoring/table.vue'),
		meta: {
			index: 0,
			title: '项目打分列表'
		}
	},
	{
		path: '/project_scoring/view',
		name: 'project_scoring_view',
		component: () => import('../views/project_scoring/view.vue'),
		meta: {
			index: 0,
			title: '项目打分详情'
		}
	},
	// 工作追踪路由
	{
		path: '/work_tracking/table',
		name: 'work_tracking_table',
		component: () => import('../views/work_tracking/table.vue'),
		meta: {
			index: 0,
			title: '工作追踪列表'
		}
	},
	{
		path: '/work_tracking/view',
		name: 'work_tracking_view',
		component: () => import('../views/work_tracking/view.vue'),
		meta: {
			index: 0,
			title: '工作追踪详情'
		}
	},
	// 总经理路由
	{
		path: '/general_manager/table',
		name: 'general_manager_table',
		component: () => import('../views/general_manager/table.vue'),
		meta: {
			index: 0,
			title: '总经理列表'
		}
	},
	{
		path: '/general_manager/view',
		name: 'general_manager_view',
		component: () => import('../views/general_manager/view.vue'),
		meta: {
			index: 0,
			title: '总经理详情'
		}
	},
	// 代办任务路由
	{
		path: '/agency_tasks/table',
		name: 'agency_tasks_table',
		component: () => import('../views/agency_tasks/table.vue'),
		meta: {
			index: 0,
			title: '代办任务列表'
		}
	},
	{
		path: '/agency_tasks/view',
		name: 'agency_tasks_view',
		component: () => import('../views/agency_tasks/view.vue'),
		meta: {
			index: 0,
			title: '代办任务详情'
		}
	},

	// 用户路由
	{
		path: '/user/table',
		name: 'user_table',
		component: () => import('../views/user/table.vue'),
		meta: {
			index: 0,
			title: '用户列表'
		}
	},
	{
		path: '/user/view',
		name: 'user_view',
		component: () => import('../views/user/view.vue'),
		meta: {
			index: 0,
			title: '用户详情'
		}
	},
	{
		path: '/user/info',
		name: 'user_info',
		component: () => import('../views/user/info.vue'),
		meta: {
			index: 0,
			title: '个人信息'
		}
	},
	// 用户组路由
	{
		path: '/user_group/table',
		name: 'user_group_table',
		component: () => import('../views/user_group/table.vue'),
		meta: {
			index: 0,
			title: '用户组列表'
		}
	},
	{
		path: '/user_group/view',
		name: 'user_group_view',
		component: () => import('../views/user_group/view.vue'),
		meta: {
			index: 0,
			title: '用户组详情'
		}
	}
]

const router = new VueRouter({
	mode: 'history',
	base: process.env.BASE_URL,
	routes
})

router.beforeEach((to, from, next) => {
	let token = to.query.token;
	if (token){
		$.db.set("token",token,120);
	}
	next();
})

router.afterEach((to, from, next) => {
	let title = "员工日志管理信息系统-admin";
	document.title = title;
})

export default router
