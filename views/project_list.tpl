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
	<h2 id="title" v-text="i18n('Projects')"></h2>
</div>
<div id="main">
	<% if (me['is_admin']) { %>
	<div class="toolbar">
		<button @click="addProject" v-text="i18n('Add Project')"></button>
	</div>
	<% } %>
	<h3 class="sub-title" v-text="i18n('Project List')"></h3>
	<div class="table-wrapper">
		<table>
			<thead>
			<tr>
				<th v-text="i18n('Project Name')"></th>
				<th v-text="i18n('Build ID')"></th>
				<th v-text="i18n('Start Time')"></th>
				<th v-text="i18n('Duration')"></th>
				<th v-text="i18n('Operator')"></th>
			</tr>
			</thead>
			<tbody>
			<tr v-for="project in projects" track-by="$index">
				<td>
					<a :href="'/projects/' + encodeURIComponent(project['name'])" v-text="project['name']"></a>
				</td>
				<td v-text="project['last_build_time'] | datetime"></td>
				<td v-text="project['last_duration'] | duration"></td>
				<td>
					<a class="tag {{project['status'] | statusColor}}" v-text="project['status'] | statusStr"
					   :href="project['status'] ? '/projects/' + encodeURIComponent(project['name']) + '/histories/' + project['last_build_id'] : null"></a>
				</td>
				<td>
					<a class="option" @click="chooseProject(project, $index)" v-text="i18n('Build')"
					   v-if="project['status'] < STATUS_UPDATING || project['status'] > STATUS_DEPLOYING"></a>
					<a class="option" @click="abortProject(project, $index)" v-text="i18n('Abort')" v-else></a>
					<% if (me['is_admin']) { %>
					<a class="option" @click="editProject(project)" v-text="i18n('Configure')"></a>
					<% } %>
				</td>
			</tr>
			</tbody>
		</table>
	</div>
</div>
<div class="mask" :style="{display: curProject ? 'block' : null}"></div>
<div class="dialog" :style="{display: curProject ? 'block' : null}">
	<div colspan="2" class="title" v-text="i18n('Build Project')"></div>
	<a class="close" @click="closeDialog"><i class="iconfont icon-close"></i></a>
	<div class="content">
		<form class="table-wrapper" @submit.prevent="buildProject()">
			<table v-if="curProject">
				<thead>
				<tr>
					<th v-text="i18n('Name')" width="30%"></th>
					<th align="left" v-text="curProject['name']"></th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td v-text="i18n('Ignores')"></td>
					<td align="left">
						<label v-if="curProject['ignores']" v-for="ignore in curProject['ignores'].split('\n')">
							<input type="checkbox" @change="toggleIgnore(ignore, $event)" checked>
							<span v-text="ignore"></span><br>
						</label>
						<span v-if="!curProject['ignores']" v-text="i18n('Empty')"></span>
					</td>
				</tr>
				<tr>
					<td v-text="i18n('Deploy Nodes')"></td>
					<td align="left">
						<label v-for="node in curProject['deploy_nodes']">
							<input type="checkbox" @change="toggleNode(node, $event)" checked>
							<span v-text="node['host'] + ':' + node['port']"></span><br>
						</label>
						<span v-if="!curProject['deploy_nodes'].length" v-text="i18n('Empty')"></span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="submit" class="color-primary" v-text="i18n('Build')"></button>
						<button type="button" @click="closeDialog" v-text="i18n('Cancel')"></button>
					</td>
				</tr>
				</tbody>
			</table>
		</form>
	</div>
</div>
<script src="/js/libs/vue.min.js"></script>
<script src="/js/libs/reqwest.min.js"></script>
<script src="/js/common.js"></script>
<script src="/js/project_list.js"></script>
</body>
</html>