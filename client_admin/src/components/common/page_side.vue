<template>
  <el-menu
    class="side el-menu-vertical-demo"
    default-active="/"
    @open="handleOpen"
    @close="handleClose"
    text-color="#fff"
    active-text-color="#38f"
    :collapse="isCollapse"
    :router="true"
    mode="horizontal"
    menu-trigger="click"
  >
    <el-menu-item index="/">
      <i class="el-icon-s-home"></i>
      <span slot="title">首页</span>
    </el-menu-item>

    
    <el-submenu
      index="user"
      v-show="user_group == '管理员' || $check_group(['/user/table','/user_group/table','/auth/table'
				,'/teacher_user/table'
									])"
    >
      <template slot="title"
        ><i class="el-icon-user-solid"></i><span>人员管理</span></template
      >
      <el-menu-item index="/user/table" v-show="user_group == '管理员'"
        ><span>管理员</span></el-menu-item
      >
             <el-menu-item
        index="/teacher_user/table"
        v-show="user_group == '管理员' || $check_action('/teacher_user/table')"
        ><span>教师用户</span></el-menu-item
      >
                       <!-- <el-menu-item index="/user_group/table"><span>用户组</span></el-menu-item> -->
    </el-submenu>

       
    <el-submenu index="more" v-show="auth.length">
      <template slot="title"
        ><i class="el-icon-copy-document"></i><span>模块管理</span></template
      >
      <el-menu-item
        v-for="(o, idx) in auth"
        v-show="$check_action(o.path)"
        :index="o.path"
      >
        <span>{{ o.page_title }}</span>
      </el-menu-item>
    </el-submenu>
    <el-submenu index="individual">
      <template slot="title"
        ><i src="/img/error.png"></i><span>个人管理</span></template
      >
      <el-menu-item index="/user/info" class="bg-hover"
        ><span>个人信息</span></el-menu-item
      >
      <el-menu-item index="/user/password" class="bg-hover"
        ><span>修改密码</span></el-menu-item
      >
    </el-submenu>

    <el-menu-item>
      <div class="action_right">
        <el-dropdown @command="handleCommand" trigger="click">
          <div class="el-dropdown-link" style="margin-right: 2rem">
            <el-avatar
              style="margin-top: 0.25rem; width: 2.3rem; overflow: hidden"
              :src="$fullUrl(user.avatar)"
            >
              <img
                style="width: 2.3rem; overflow: hidden"
                src="/img/error.png"
              />
            </el-avatar>
            <span class="info_color" style="margin-left: 0.5rem">{{
              user.nickname || user.username
            }}</span>
          </div>
          <el-dropdown-menu slot="dropdown" class="el-drop">
                        <el-dropdown-item command="/quit" class="el-item"
              >退出</el-dropdown-item
            >
          </el-dropdown-menu>
        </el-dropdown>
      </div>
    </el-menu-item>
  </el-menu>
</template>

<script>
	export default {
		props: {
			isCollapse: {
				trye: Boolean,
				default: false
			}
		},
		data: function() {
			return {
				user_group: this.$store.state.user.user_group,
				user: this.$store.state.user
			}
		},
		methods: {
			handleOpen(key, keyPath) {
				// console.log(key, keyPath);
			},

			handleClose(key, keyPath) {
				// console.log(key, keyPath);
			},
      handleCommand(command) {
      if (command === '/quit') {
        this.$get('~/api/user/quit', {}, (res) => {
          this.$store.commit('quit')
          this.$router.push('/login')
        })
      } else if (command.indexOf('http') !== -1) {
        let token = $.db.get('token')
        if (token) {
          location.href = command + '?token=' + token
        }
      } else {
        this.$router.push(command)
      }
    }
		},
		computed: {
			auth() {
				var tables = this.$store.state.web.auth;
				var lt = [];
				for (var i = 0; i < tables.length; i++) {
					var o = tables[i];
					if (o.path.indexOf("/table") !== -1) {
						let list = ["exam","article", "article_type", ];
							list.push("teacher_user");
												if (list.indexOf(o.table_name) === -1) {
							lt.push(o);
						}
					}
				}
				return lt;
			}
		}
	}
</script>

<style scoped="scoped">
.el-menu-vertical-demo:not(.el-menu--collapse) {
  width: 100%;
}
.side::-webkit-scrollbar {
  display: none;
}
</style>
