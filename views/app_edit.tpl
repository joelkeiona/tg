<!doctype html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<title>APP Manager</title>
	<link rel="stylesheet" href="/css/style.css">
	<link rel="stylesheet" href="/css/iconfont.css">
</head>
<body>
<%- include('sidebar') %>
<div id="toast-wrapper"><label id="toast"></label></div>
<div id="header">
	<h2 id="title" v-text="i18n('Apps')"></h2>
</div>
<div id="main">
	<div class="toolbar">
		<button @click="back" v-text="i18n('Back')"></button>
	</div>
	<h3 class="sub-title" v-text="i18n(name ? 'Configure App' : 'Add App')"></h3>
	<form @submit.prevent="submit">
		<div class="table-wrapper">
			<table>
				<thead>
				<tr>
					<th v-text="i18n('Name')" width="20%"></th>
					<th align="left">
						<input type="text" required v-model="app['name']" v-if="!name"  placeholder="app name">
						<span v-text="app['name']" v-if="name"></span>
					</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td v-text="i18n('App url')"></td>
					<td align="left"><input type="text" v-model="app['app_url']"></td>
				</tr>
				<tr >
					<td v-text="i18n('ID')"></td>
					<td align="left"><input type="text" v-model="app['ID']" placeholder="com...."></td>
				</tr>
				<tr>
					<td v-text="i18n('Status')"></td>
					<td align="left">
						<label>
							<input type="text" required v-model="app['status']" placeholder="Enter status">
							<p>
								0未审核 1驳回 2一审通过 3二审中 4通过 5已给项目方 6删除或被封
							</p>
						</label>
					</td>
				</tr>
				<tr>
					<td v-text="i18n('isA')"></td>
					<td align="left">
						<label>
							<input type="checkbox" v-model="app['isA']">
							isA
						</label>
					</td>
				</tr>
				<tr>
					<td v-text="i18n('maidianType')"></td>
					<td align="left">
						<label>
							<input type="radio" name="maidian_type" value="Adjust" v-model="app['maidianType']">
							Adjust
						</label>
						<label>
							<input type="radio" name="maidian_type" value="AppsFlay" v-model="app['maidianType']">
							AppsFlay
						</label>
						<label>
							<input type="radio" name="maidian_type" value="Adjust-AppsFlay" v-model="app['maidianType']">
							Adjust and AppsFlay
						</label>
					</td>
				</tr>
				<tr>
					<td v-text="i18n('maidianKeys')"></td>
					<td align="left">
						<textarea v-model="app['maidianKeys']" placeholder="Enter Json"></textarea>
						<p  >
							<label>AF-eg: {"Key":"","ID":"","appInviteOneLinkID":""}
							</label>
							<label>
								AD-eg: {"token":"", "scheme":""}
							</label>
						</p>
					</td>
				</tr>
				<tr>
					<td v-text="i18n('maidianMap')"></td>
					<td align="left">
						<textarea v-model="app['maidianMap']" placeholder="Enter Json"></textarea>
						<p  >
							<label>eg: {"event":"","register":""}
							</label>

						</p>
					</td>
				</tr>
				<tr>
					<td v-text="i18n('Promotion Code')"></td>
					<td align="left"><textarea v-model="app['promotion_codes']" placeholder="Enter string:code,code"></textarea></td>
				</tr>
				<tr>
					<td v-text="i18n('bList')"></td>
					<td align="left"><textarea v-model="app['bList']" placeholder="Enter Json:[IP,IP]"></textarea></td>
				</tr>
				<tr>
					<td v-text="i18n('wList')"></td>
					<td align="left"><textarea v-model="app['wList']" placeholder="Enter Json:[IP,IP]"></textarea></td>
				</tr>
				<tr>
					<td v-text="i18n('Notes')"></td>
					<td align="left"><textarea v-model="app['notes']"  placeholder="Enter notes"></textarea></td>
				</tr>
				<tr >
					<td v-text="i18n('privacy')"></td>
					<td align="left"><input type="text" v-model="app['privacy']" placeholder="Enter privacy"></td>
				</tr>
				<tr >
					<td v-text="i18n('agreement')"></td>
					<td align="left"><input type="text" v-model="app['agreement']" placeholder="Enter agreement"></td>
				</tr>
				<tr >
					<td  v-text="i18n('Party')"></td>
					<td align="left">
						<label>
							<input type="text" v-model="app['party']" placeholder="Enter party" >
							项目方
						</label>
					</td>
				</tr>
				<tr >
					<td  v-text="i18n('Need duration')"></td>
					<td align="left">
						<label>
							<input type="text" v-model="app['need_duration']" placeholder="Enter days">
							需要保时长(天)
						</label>
					</td>
				</tr>
				<td  v-text="i18n('Given time')"></td>
				<td align="left">
					<label>
						<input type="text" v-model="app['given_time']" placeholder="eg: 8.13">
						给项目方的时间
					</label>
				</td>
				<tr>
					<td v-text="i18n('Managers')" :rowspan="app['managers'].length + 1"></td>
					<td align="left">
						<select v-model="addingManager">
							<option :value="null" v-text="i18n('Please Select A User')"></option>
							<option :value="user['username']" v-text="user['username']" v-for="user in users"
									v-if="app['managers'].indexOf(user['username']) < 0"></option>
						</select>
						<a class="option" @click="addManager" :disabled="!addingManager"
						   v-text="i18n('Add Manager')"></a>
					</td>
				</tr>
				<tr v-for="username in app['managers']">
					<td align="left">
						<span v-text="username"></span>
						<a class="option" @click="removeManager(username)" v-text="i18n('Remove')"></a>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="button" class="color-danger" v-text="i18n('Delete')"
								@click="deleteApp"></button>
						<button type="submit" class="color-primary" v-text="i18n('Submit')"></button>
					</td>
				</tr>
				</tbody>
			</table>
		</div>
	</form>
</div>
<script src="/js/libs/vue.min.js"></script>
<script src="/js/libs/reqwest.min.js"></script>
<script src="/js/common.js"></script>
<script src="/js/app_edit.js"></script>
</body>
</html>