import Vue from 'vue';
import VueRouter from 'vue-router';
import index from '../views/index.vue'
import login from '../views/account/login.vue';

Vue.use(VueRouter)

const routes = [
	// 主页ss
	{
		path: '/',
		name: 'index',
		component: index
	},
	// 登录
	{
		path: '/account/login',
		name: 'login',
		component: login
	},
	// 忘记密码
	{
		path: '/account/forgot',
		name: 'forgot',
		component: () => import('../views/account/forgot.vue')
	},
	// 注册账号
	{
		path: '/account/register',
		name: 'register',
		component: () => import('../views/account/register.vue')
	},
	// 媒体图片
	{
		path: '/media/image',
		name: 'media_image',
		component: () => import('../views/media/image.vue')
	},
	// 音乐
	{
		path: '/media/music',
		name: 'media_music',
		component: () => import('../views/media/music.vue')
	},
	// 媒体视频
	{
		path: '/media/video',
		name: 'media_video',
		component: () => import('../views/media/video.vue')
	},
	// 文章路由
	{
		path: '/article/list',
		name: 'article_list',
		component: () => import('../views/article/list.vue')
	},
	{
		path: '/article/details',
		name: 'article_details',
		component: () => import('../views/article/details.vue')
	},
	// 浏览网站






	// 公告路由
	{
		path: '/notice/list',
		name: 'notice_list',
		component: () => import('../views/notice/list.vue')
	},
	{
		path: '/notice/details',
		name: 'notice_details',
		component: () => import('../views/notice/details.vue')
	},

	
	
		
		// 通知列表列表路由
	{
		path: '/notification_list/list',
		name: '/notification_list_list',
		component: () => import('../views/notification_list/list.vue')
	},
	
		// 通知列表详情路由
	{
		path: '/notification_list/details',
		name: '/notification_list_details',
		component: () => import('../views/notification_list/details.vue')
	},
		
		// 员工信息列表路由
	{
		path: '/employee_information/list',
		name: '/employee_information_list',
		component: () => import('../views/employee_information/list.vue')
	},
	
		
		// 问题反馈列表路由
	{
		path: '/problem_feedback/list',
		name: '/problem_feedback_list',
		component: () => import('../views/problem_feedback/list.vue')
	},
	
		
		// 打卡签到列表路由
	{
		path: '/clock_in/list',
		name: '/clock_in_list',
		component: () => import('../views/clock_in/list.vue')
	},
	
			// 项目记录添加路由
	{
		path: '/project_records/edit',
		name: '/project_records_edit',
		component: () => import('../views/project_records/edit.vue')
	},
	
		// 项目记录列表路由
	{
		path: '/project_records/list',
		name: '/project_records_list',
		component: () => import('../views/project_records/list.vue')
	},
	
		
		// 员工日志列表路由
	{
		path: '/employee_log/list',
		name: '/employee_log_list',
		component: () => import('../views/employee_log/list.vue')
	},
	
		
	
		
		// 任务安排列表路由
	{
		path: '/task_arrangement/list',
		name: '/task_arrangement_list',
		component: () => import('../views/task_arrangement/list.vue')
	},
	
		
		// 项目打分列表路由
	{
		path: '/project_scoring/list',
		name: '/project_scoring_list',
		component: () => import('../views/project_scoring/list.vue')
	},
	
		
	
		
	
		
	
	
	// 用户路由
	{
		path: '/user/index',
		name: 'user_index',
		component: () => import('../views/user/index.vue')
	},
	// 基本信息
	{
		path: '/user/info',
		name: 'user_info',
		component: () => import('../views/user/info.vue')
	},
	// 找回密码
	{
		path: '/user/password',
		name: 'user_password',
		component: () => import('../views/user/password.vue')
	},

	// 搜索
	{
		path: '/search',
		name: 'search',
		component: () => import('../views/search/index.vue')
	},
	// 局部搜索
	{
		path: '/search/details',
		name: 'search_details',
		component: () => import('../views/search/details.vue')
	}
]

const router = new VueRouter({
	mode: 'history',
	base: process.env.BASE_URL,
	routes
})

router.afterEach((to, from, next) => {
	let title = "员工日志管理信息系统-home";
	document.title = title;
	document.logo = "员工日志管理信息系统"
})

export default router
