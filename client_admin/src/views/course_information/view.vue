<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">

							<el-col v-if="user_group === '管理员' || $check_field('get','course_no') || $check_field('add','course_no') || $check_field('set','course_no')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="课程编号" prop="course_no">
												<el-input id="course_no" v-model="form['course_no']" placeholder="请输入课程编号"
							  v-if="user_group === '管理员' || (form['course_information_id'] && $check_field('set','course_no')) || (!form['course_information_id'] && $check_field('add','course_no'))" :disabled="true"></el-input>
					<div v-else-if="$check_field('get','course_no')">{{form['course_no']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','course_name') || $check_field('add','course_name') || $check_field('set','course_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="课程名称" prop="course_name">
												<el-input id="course_name" v-model="form['course_name']" placeholder="请输入课程名称"
							  v-if="user_group === '管理员' || (form['course_information_id'] && $check_field('set','course_name')) || (!form['course_information_id'] && $check_field('add','course_name'))" :disabled="disabledObj['course_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','course_name')">{{form['course_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','lecturer') || $check_field('add','lecturer') || $check_field('set','lecturer')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="授课教师" prop="lecturer">
													<el-select v-if="user_group === '管理员' || (form['course_information_id'] && $check_field('set','lecturer')) || (!form['course_information_id'] && $check_field('add','lecturer'))" id="lecturer" v-model="form['lecturer']" :disabled="disabledObj['lecturer_isDisabled']">
							<el-option v-for="o in list_user_lecturer" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
						<el-select v-else-if="$check_field('get','lecturer')" id="lecturer" v-model="form['lecturer']" :disabled="true">
							<el-option v-for="o in list_user_lecturer" :key="o['username']" :label="o['nickname'] + '-' + o['username']"
									   :value="o['user_id']">
							</el-option>
						</el-select>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','teachers_name') || $check_field('add','teachers_name') || $check_field('set','teachers_name')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="教师姓名" prop="teachers_name">
												<el-input id="teachers_name" v-model="form['teachers_name']" placeholder="请输入教师姓名"
							  v-if="user_group === '管理员' || (form['course_information_id'] && $check_field('set','teachers_name')) || (!form['course_information_id'] && $check_field('add','teachers_name'))" :disabled="disabledObj['teachers_name_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','teachers_name')">{{form['teachers_name']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','teaching_time') || $check_field('add','teaching_time') || $check_field('set','teaching_time')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="授课时间" prop="teaching_time">
								<el-date-picker :disabled="disabledObj['teaching_time_isDisabled']" v-if="user_group === '管理员' || (form['course_information_id'] && $check_field('set','teaching_time')) || (!form['course_information_id'] && $check_field('add','teaching_time'))" id="teaching_time"
						v-model="form['teaching_time']" type="datetime" placeholder="选择日期时间">
					</el-date-picker>
					<div v-else-if="$check_field('get','teaching_time')">{{form['teaching_time']}}</div>
							</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','lecture_section') || $check_field('add','lecture_section') || $check_field('set','lecture_section')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="授课课节" prop="lecture_section">
												<el-input id="lecture_section" v-model="form['lecture_section']" placeholder="请输入授课课节"
							  v-if="user_group === '管理员' || (form['course_information_id'] && $check_field('set','lecture_section')) || (!form['course_information_id'] && $check_field('add','lecture_section'))" :disabled="disabledObj['lecture_section_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','lecture_section')">{{form['lecture_section']}}</div>
											</el-form-item>
			</el-col>
								<el-col v-if="user_group === '管理员' || $check_field('get','remarks') || $check_field('add','remarks') || $check_field('set','remarks')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="备注信息" prop="remarks">
								<el-input type="textarea" id="remarks" v-model="form['remarks']" placeholder="请输入备注信息"
						v-if="user_group === '管理员' || (form['course_information_id'] && $check_field('set','remarks')) || (!form['course_information_id'] && $check_field('add','remarks'))" :disabled="disabledObj['remarks_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','remarks')">{{form['remarks']}}</div>
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
				field: "course_information_id",
				url_add: "~/api/course_information/add?",
				url_set: "~/api/course_information/set?",
				url_get_obj: "~/api/course_information/get_obj?",
				url_upload: "~/api/course_information/upload?",

				query: {
					"course_information_id": 0,
				},

				form: {
								"course_no": this.$get_stamp(), // 课程编号
										"course_name":  '', // 课程名称
										"lecturer": 0, // 授课教师
										"teachers_name":  '', // 教师姓名
										"teaching_time":  '', // 授课时间
										"lecture_section":  '', // 授课课节
										"remarks":  '', // 备注信息
											"course_information_id": 0, // ID
					
				},
				disabledObj:{
								"course_no_isDisabled": false,
										"course_name_isDisabled": false,
										"lecturer_isDisabled": false,
										"teachers_name_isDisabled": false,
										"teaching_time_isDisabled": false,
										"lecture_section_isDisabled": false,
										"remarks_isDisabled": false,
										},

	
		
		
					// 用户列表
				list_user_lecturer: [],
				
		
		
		
	
			}
		},
		methods: {


	
	
			
	
			
	
				/**
			 * 获取教师用户用户列表
			 */
			async get_list_user_lecturer() {
                // if(this.user_group !== "管理员" && this.form["lecturer"] === 0) {
                //     this.form["lecturer"] = this.user.user_id;
                // }
                var json = await this.$get("~/api/user/get_list?user_group=教师用户");
                if(json.result && json.result.list){
                    this.list_user_lecturer = json.result.list;
                }
                else if(json.error){
                    console.error(json.error);
                }
			},
					get_user_lecturer(id){
				var obj = this.list_user_lecturer.getObj({"user_id":id});
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
									        if (this.form["teaching_time"].indexOf("-")===-1){
            this.form["teaching_time"] = this.$toTime(parseInt(this.form["teaching_time"]),"yyyy-MM-dd hh:mm:ss")
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


													        if(this.form["teaching_time"]=="0000-00-00 00:00:00"){
          this.form["teaching_time"] = null;
        }
				if(parseInt(this.form["teaching_time"]) > 9999){
					this.form["teaching_time"] = this.$toTime(parseInt(this.form["teaching_time"]),"yyyy-MM-dd hh:mm:ss")
				}
									

			},


			is_view(){
				var bl = this.user_group == "管理员";

				if(!bl){
					bl = this.$check_action('/course_information/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/course_information/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/course_information/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/course_information/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/course_information/view','get');
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
									this.get_list_user_lecturer();
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
