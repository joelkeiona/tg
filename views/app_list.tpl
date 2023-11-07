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
	<% if (me['is_admin']) { %>
	<div class="toolbar">
		<button @click="addApp" v-text="i18n('Add Apps')"></button>
	</div>
	<% } %>
	<div class="toolbar" style="padding-right: 20px">
		<button @click="configureGGIP" v-text="i18n('Configure GGIP')"></button>
	</div>
	<div class="toolbar" style="padding-right: 20px">
		<button @click="refreshConfig" v-text="i18n('Refresh Config')"></button>
	</div>
	<h3 class="sub-title" v-text="i18n('APP List')"></h3>
	<div class="table-wrapper">
		<table>
			<thead>
			<tr>
				<th v-text="i18n('APP Name')"></th>
				<th v-text="i18n('ID')"></th>
				<th v-text="i18n('isA')"></th>
				<th v-text="i18n('APP Url')"></th>
				<th v-text="i18n('Status')"></th>
				<th v-text="i18n('Operator')"></th>
			</tr>
			</thead>
			<tbody>
			<tr v-for="app in apps" track-by="$index">
				<td>
					<a :href="'/apps/' + encodeURIComponent(app['name'])" v-text="app['name']"></a>
				</td>
				<td v-text="app['ID']"></td>
				<td v-text="app['isA']"></td>
				<td v-text="app['app_url']"></td>
				<td>
					<a class="tag {{app['status'] | statusColor}}" v-text="app['status'] | AppStatusStr"></a>
				</td>
				<td>
					<a class="option" @click="deleteApp(app, $index)" v-text="i18n('Delete')" v-else></a>
					<% if (me['is_admin']) { %>
					<a class="option" @click="editApp(app)" v-text="i18n('Configure')"></a>
					<% } %>
				</td>
			</tr>
			</tbody>
		</table>
	</div>
</div>
<div class="mask" :style="{display: curapp ? 'block' : null}"></div>
<div class="dialog" :style="{display: curapp ? 'block' : null}">
	<div colspan="2" class="title" v-text="i18n('Build app')"></div>
	<a class="close" @click="closeDialog"><i class="iconfont icon-close"></i></a>
	<div class="content">
		<form class="table-wrapper" @submit.prevent="buildapp()">
			<table v-if="curapp">
				<thead>
				<tr>
					<th v-text="i18n('Name')" width="30%"></th>
					<th align="left" v-text="curapp['name']"></th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td v-text="i18n('Ignores')"></td>
					<td align="left">
						<label v-if="curapp['ignores']" v-for="ignore in curapp['ignores'].split('\n')">
							<input type="checkbox" @change="toggleIgnore(ignore, $event)" checked>
							<span v-text="ignore"></span><br>
						</label>
						<span v-if="!curapp['ignores']" v-text="i18n('Empty')"></span>
					</td>
				</tr>
				<tr>
					<td v-text="i18n('Deploy Nodes')"></td>
					<td align="left">
						<label v-for="node in curapp['deploy_nodes']">
							<input type="checkbox" @change="toggleNode(node, $event)" checked>
							<span v-text="node['host'] + ':' + node['port']"></span><br>
						</label>
						<span v-if="!curapp['deploy_nodes'].length" v-text="i18n('Empty')"></span>
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
<script src="/js/app_list.js"></script>
</body>
</html>