<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','title_name') || $check_field('add','title_name') || $check_field('set','title_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="标题名称" prop="title_name">
												<el-input id="title_name" v-model="form['title_name']" placeholder="请输入标题名称"
							  v-if="user_group === '管理员' || (form['teacher_workload_id'] && $check_field('set','title_name')) || (!form['teacher_workload_id'] && $check_field('add','title_name'))" :disabled="disabledObj['title_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','title_name')">{{form['title_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','teacher_information') || $check_field('add','teacher_information') || $check_field('set','teacher_information')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="教师信息" prop="teacher_information">
													<el-select v-if="user_group === '管理员' || (form['teacher_workload_id'] && $check_field('set','teacher_information')) || (!form['teacher_workload_id'] && $check_field('add','teacher_information'))" id="teacher_information" v-model="form['teacher_information']" :disabled="disabledObj['teacher_information_isDisabled']">
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
							  v-if="user_group === '管理员' || (form['teacher_workload_id'] && $check_field('set','teachers_name')) || (!form['teacher_workload_id'] && $check_field('add','teachers_name'))" :disabled="disabledObj['teachers_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','teachers_name')">{{form['teachers_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','number_of_students') || $check_field('add','number_of_students') || $check_field('set','number_of_students')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="学生数量" prop="number_of_students">
								<el-input-number id="number_of_students" v-model.number="form['number_of_students']"
						v-if="user_group === '管理员' || (form['teacher_workload_id'] && $check_field('set','number_of_students')) || (!form['teacher_workload_id'] && $check_field('add','number_of_students'))" :disabled="disabledObj['number_of_students_isDisabled']"></el-input-number>
					<div v-else-if="$check_field('get','number_of_students')">{{form['number_of_students']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','student_hours') || $check_field('add','student_hours') || $check_field('set','student_hours')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="学生学时" prop="student_hours">
								<el-select id="student_hours" v-model="form['student_hours']"
						v-if="user_group === '管理员' || (form['teacher_workload_id'] && $check_field('set','student_hours')) || (!form['teacher_workload_id'] && $check_field('add','student_hours'))">
						<el-option v-for="o in list_student_hours" :key="o" :label="o" :value="o">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','student_hours')">{{form['student_hours']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','total_workload') || $check_field('add','total_workload') || $check_field('set','total_workload')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="总工作量" prop="total_workload">
												<el-input id="total_workload" v-model="form['total_workload']" placeholder="请输入总工作量"
							  v-if="user_group === '管理员' || (form['teacher_workload_id'] && $check_field('set','total_workload')) || (!form['teacher_workload_id'] && $check_field('add','total_workload'))"  @focus="set_total_workload()" :disabled="disabledObj['total_workload_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','total_workload')">{{form['total_workload']}}</div>
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
				field: "teacher_workload_id",
				url_add: "~/api/teacher_workload/add?",
				url_set: "~/api/teacher_workload/set?",
				url_get_obj: "~/api/teacher_workload/get_obj?",
				url_upload: "~/api/teacher_workload/upload?",

				query: {
					"teacher_workload_id": 0,
				},

				form: {
								"title_name":  '', // 标题名称
										"teacher_information": 0, // 教师信息
										"teachers_name":  '', // 教师姓名
										"number_of_students":  0, // 学生数量
										"student_hours":  '', // 学生学时
										"total_workload":  '', // 总工作量
											"teacher_workload_id": 0, // ID
					
				},
				disabledObj:{
								"title_name_isDisabled": false,
										"teacher_information_isDisabled": false,
										"teachers_name_isDisabled": false,
					          			"number_of_students_isDisabled": false,
										"student_hours_isDisabled": false,
										"total_workload_isDisabled": false,
										},

	
		
					// 用户列表
				list_user_teacher_information: [],
				
		
						// 学生学时选项列表
				list_student_hours: ['8'],
	
		
	
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
			
	
			
	
			
	
			
	
										set_total_workload(){
				this.form.total_workload = parseFloat(this.form.number_of_students) * parseFloat(this.form.student_hours)
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
					bl = this.$check_action('/teacher_workload/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/teacher_workload/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/teacher_workload/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/teacher_workload/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/teacher_workload/view','get');
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
