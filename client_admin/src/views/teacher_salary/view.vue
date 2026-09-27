<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','title_name') || $check_field('add','title_name') || $check_field('set','title_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="标题名称" prop="title_name">
												<el-input id="title_name" v-model="form['title_name']" placeholder="请输入标题名称"
							  v-if="user_group === '管理员' || (form['teacher_salary_id'] && $check_field('set','title_name')) || (!form['teacher_salary_id'] && $check_field('add','title_name'))" :disabled="disabledObj['title_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','title_name')">{{form['title_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','teacher_information') || $check_field('add','teacher_information') || $check_field('set','teacher_information')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="教师信息" prop="teacher_information">
													<el-select v-if="user_group === '管理员' || (form['teacher_salary_id'] && $check_field('set','teacher_information')) || (!form['teacher_salary_id'] && $check_field('add','teacher_information'))" id="teacher_information" v-model="form['teacher_information']" :disabled="disabledObj['teacher_information_isDisabled']">
							<el-option v-for="o in list_user_teacher_information" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
						<el-select v-else-if="$check_field('get','teacher_information')" id="teacher_information" v-model="form['teacher_information']" :disabled="true">
							<el-option v-for="o in list_user_teacher_information" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','teachers_name') || $check_field('add','teachers_name') || $check_field('set','teachers_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="教师姓名" prop="teachers_name">
												<el-input id="teachers_name" v-model="form['teachers_name']" placeholder="请输入教师姓名"
							  v-if="user_group === '管理员' || (form['teacher_salary_id'] && $check_field('set','teachers_name')) || (!form['teacher_salary_id'] && $check_field('add','teachers_name'))" :disabled="disabledObj['teachers_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','teachers_name')">{{form['teachers_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','teacher_education') || $check_field('add','teacher_education') || $check_field('set','teacher_education')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="教师学历" prop="teacher_education">
								<el-select id="teacher_education" v-model="form['teacher_education']"
						v-if="user_group === '管理员' || (form['teacher_salary_id'] && $check_field('set','teacher_education')) || (!form['teacher_salary_id'] && $check_field('add','teacher_education'))">
						<el-option v-for="o in list_teacher_education" :key="o" :label="o" :value="o">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','teacher_education')">{{form['teacher_education']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','academic_salary') || $check_field('add','academic_salary') || $check_field('set','academic_salary')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="学历工资" prop="academic_salary">
								<el-select id="academic_salary" v-model="form['academic_salary']"
						v-if="user_group === '管理员' || (form['teacher_salary_id'] && $check_field('set','academic_salary')) || (!form['teacher_salary_id'] && $check_field('add','academic_salary'))">
						<el-option v-for="o in list_academic_salary" :key="o" :label="o" :value="o">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','academic_salary')">{{form['academic_salary']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','teacher_title') || $check_field('add','teacher_title') || $check_field('set','teacher_title')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="教师职称" prop="teacher_title">
								<el-select id="teacher_title" v-model="form['teacher_title']"
						v-if="user_group === '管理员' || (form['teacher_salary_id'] && $check_field('set','teacher_title')) || (!form['teacher_salary_id'] && $check_field('add','teacher_title'))">
						<el-option v-for="o in list_teacher_title" :key="o" :label="o" :value="o">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','teacher_title')">{{form['teacher_title']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','title_salary') || $check_field('add','title_salary') || $check_field('set','title_salary')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="职称工资" prop="title_salary">
								<el-select id="title_salary" v-model="form['title_salary']"
						v-if="user_group === '管理员' || (form['teacher_salary_id'] && $check_field('set','title_salary')) || (!form['teacher_salary_id'] && $check_field('add','title_salary'))">
						<el-option v-for="o in list_title_salary" :key="o" :label="o" :value="o">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','title_salary')">{{form['title_salary']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','number_of_courses') || $check_field('add','number_of_courses') || $check_field('set','number_of_courses')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="课程数量" prop="number_of_courses">
								<el-input-number id="number_of_courses" v-model.number="form['number_of_courses']"
						v-if="user_group === '管理员' || (form['teacher_salary_id'] && $check_field('set','number_of_courses')) || (!form['teacher_salary_id'] && $check_field('add','number_of_courses'))" :disabled="disabledObj['number_of_courses_isDisabled']"></el-input-number>
					<div v-else-if="$check_field('get','number_of_courses')">{{form['number_of_courses']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','teaching_evaluation_grade') || $check_field('add','teaching_evaluation_grade') || $check_field('set','teaching_evaluation_grade')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="评教等级" prop="teaching_evaluation_grade">
								<el-select id="teaching_evaluation_grade" v-model="form['teaching_evaluation_grade']"
						v-if="user_group === '管理员' || (form['teacher_salary_id'] && $check_field('set','teaching_evaluation_grade')) || (!form['teacher_salary_id'] && $check_field('add','teaching_evaluation_grade'))">
						<el-option v-for="o in list_teaching_evaluation_grade" :key="o" :label="o" :value="o">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','teaching_evaluation_grade')">{{form['teaching_evaluation_grade']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','teaching_evaluation_bonus') || $check_field('add','teaching_evaluation_bonus') || $check_field('set','teaching_evaluation_bonus')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="评教奖金" prop="teaching_evaluation_bonus">
								<el-select id="teaching_evaluation_bonus" v-model="form['teaching_evaluation_bonus']"
						v-if="user_group === '管理员' || (form['teacher_salary_id'] && $check_field('set','teaching_evaluation_bonus')) || (!form['teacher_salary_id'] && $check_field('add','teaching_evaluation_bonus'))">
						<el-option v-for="o in list_teaching_evaluation_bonus" :key="o" :label="o" :value="o">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','teaching_evaluation_bonus')">{{form['teaching_evaluation_bonus']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','annual_salary') || $check_field('add','annual_salary') || $check_field('set','annual_salary')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="年度工资" prop="annual_salary">
												<el-input id="annual_salary" v-model="form['annual_salary']" placeholder="请输入年度工资"
							  v-if="user_group === '管理员' || (form['teacher_salary_id'] && $check_field('set','annual_salary')) || (!form['teacher_salary_id'] && $check_field('add','annual_salary'))"  @focus="set_annual_salary()" :disabled="disabledObj['annual_salary_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','annual_salary')">{{form['annual_salary']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','salary_details') || $check_field('add','salary_details') || $check_field('set','salary_details')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="工资详情" prop="salary_details">
								<el-input type="textarea" id="salary_details" v-model="form['salary_details']" placeholder="请输入工资详情"
						v-if="user_group === '管理员' || (form['teacher_salary_id'] && $check_field('set','salary_details')) || (!form['teacher_salary_id'] && $check_field('add','salary_details'))" :disabled="disabledObj['salary_details_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','salary_details')">{{form['salary_details']}}</div>
							</el-form-item>
			</el-col>
					
	
	
	
	
	
			<el-col :xs="24" :sm="12" :lg="8" class="el_form_btn_warp">
				<el-form-item>
					<el-button type="primary" @click="submit()">提交</el-button>
					<el-button @click="cancel()">取消</el-button>
				</el-form-item>
			</el-col>

		</el-form>
	</el-main>
</template>

<script>
	import mixin from "@/mixins/page.js";

	export default {
		mixins: [mixin],
		data() {
			return {
				field: "teacher_salary_id",
				url_add: "~/api/teacher_salary/add?",
				url_set: "~/api/teacher_salary/set?",
				url_get_obj: "~/api/teacher_salary/get_obj?",
				url_upload: "~/api/teacher_salary/upload?",

				query: {
					"teacher_salary_id": 0,
				},

				form: {
								"title_name":  '', // 标题名称
										"teacher_information": 0, // 教师信息
										"teachers_name":  '', // 教师姓名
										"teacher_education":  '', // 教师学历
										"academic_salary":  '', // 学历工资
										"teacher_title":  '', // 教师职称
										"title_salary":  '', // 职称工资
										"number_of_courses":  0, // 课程数量
										"teaching_evaluation_grade":  '', // 评教等级
										"teaching_evaluation_bonus":  '', // 评教奖金
										"annual_salary":  '', // 年度工资
										"salary_details":  '', // 工资详情
											"teacher_salary_id": 0, // ID
					
				},
				disabledObj:{
								"title_name_isDisabled": false,
										"teacher_information_isDisabled": false,
										"teachers_name_isDisabled": false,
										"teacher_education_isDisabled": false,
										"academic_salary_isDisabled": false,
										"teacher_title_isDisabled": false,
										"title_salary_isDisabled": false,
					          			"number_of_courses_isDisabled": false,
										"teaching_evaluation_grade_isDisabled": false,
										"teaching_evaluation_bonus_isDisabled": false,
										"annual_salary_isDisabled": false,
										"salary_details_isDisabled": false,
										},

	
		
					// 用户列表
				list_user_teacher_information: [],
				
						// 教师学历选项列表
				list_teacher_education: ['本科','硕士','博士'],
	
						// 学历工资选项列表
				list_academic_salary: ['100','200','800'],
	
						// 教师职称选项列表
				list_teacher_title: ['助教','讲师','副教授','教授'],
	
						// 职称工资选项列表
				list_title_salary: ['100','200','400','800'],
	
		
						// 评教等级选项列表
				list_teaching_evaluation_grade: ['优','良','差'],
	
						// 评教奖金选项列表
				list_teaching_evaluation_bonus: ['30000','20000','15000'],
	
		
		
	
			}
		},
		methods: {


	
	
			
	
				/**
			 * 获取教师用户用户列表
			 */
			async get_list_user_teacher_information() {
                // if(this.user_group !== "管理员" && this.form["teacher_information"] === 0) {
                //     this.form["teacher_information"] = this.user.user_id;
                // }
                var json = await this.$get("~/api/user/get_list?user_group=教师用户");
                if(json.result && json.result.list){
                    this.list_user_teacher_information = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
					get_user_teacher_information(id){
				var obj = this.list_user_teacher_information.getObj({"user_id":id});
				var ret = "";
				if(obj){
					if(obj.nickname){
						ret = obj.nickname;}
					else{
						ret = obj.username;
					}
				}
				return ret;
			},
			
	
			
	
			
	
			
	
			
	
			
	
			
	
			
	
			
	
										set_annual_salary(){
				this.form.annual_salary = (parseFloat(this.form.academic_salary) + parseFloat(this.form.title_salary)) * parseFloat(this.form.number_of_courses) + parseFloat(this.form.teaching_evaluation_bonus)
			},
							
	
		
			/**
			 * 获取对象之前
			 * @param {Object} param
			 */
			get_obj_before(param) {
				var form = "";
									
				if(this.form && form){
					Object.keys(this.form).forEach(key => {
						Object.keys(form).forEach(dbKey => {
							// if(dbKey === "charging_standard"){
							// 	this.form['charging_rules'] = form[dbKey];
							// 	this.disabledObj['charging_rules_isDisabled'] = true;
							// };
							if(key === dbKey){
								this.disabledObj[key+'_isDisabled'] = true;
							}
						})
					})
				}
																												$.db.del("form");
				return param;
			},

			/**
			 * 获取对象之后
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json, func){


																																				

			},


			is_view(){
				var bl = this.user_group == "管理员";

				if(!bl){
					bl = this.$check_action('/teacher_salary/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/teacher_salary/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/teacher_salary/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/teacher_salary/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/teacher_salary/view','get');
					console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
				}

				console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

				return bl;
			},
			/**
			 * 上传文件
			 * @param {Object} param
			 */
			uploadimg(param) {
				this.uploadFile(param.file, "avatar");
			},


		},
		created() {
							this.get_list_user_teacher_information();
																									},
	}
</script>

<style>
	.avatar-uploader .el-upload {
		border: 1px dashed #d9d9d9;
		border-radius: 6px;
		cursor: pointer;
		position: relative;
		overflow: hidden;
	}

	.avatar-uploader .el-upload:hover {
		border-color: #409EFF;
	}

	.avatar-uploader-icon {
		font-size: 28px;
		color: #8c939d;
		width: 178px;
		height: 178px;
		line-height: 178px;
		text-align: center;
	}

	.avatar {
		width: 178px;
		height: 178px;
		display: block;
	}




</style>
