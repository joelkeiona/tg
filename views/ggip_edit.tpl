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
	<h2 id="title" v-text="i18n('GGIPS')"></h2>
</div>
<div id="main">
	<div class="toolbar">
		<button @click="back" v-text="i18n('Back')"></button>
		<button @click="submit" style="color: red" v-text="i18n('Submit')"></button>
	</div>
	<div class="toolbar" style="clear: both; ">
		<input type="text" required v-model="ip" placeholder="Enter IP">
		<button @click="addIP(ip)" v-text="i18n('AddIP')"></button>
	</div>
	<div  style="clear: both; color: orangered">
		<p v-text="i18n('提示：增加删除IP，点击提交才生效')">
		</p>
	</div>
	<form @submit.prevent="submit">
		<div class="table-wrapper">

			<table>
				<thead>
				<tr>
					<th v-text="i18n('IP')" width="70%"></th>
					<th v-text="i18n('operate')" width="30%"></th>
				</tr>
				</thead>
				<tbody>
				<tr v-for="ip in ips" track-by="$index">
					<td v-text="ip"></td>
					<td>
						<a class="option" style="color: red" @click="removeIP(ip)" v-text="i18n('DeleteIP')"></a>
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
<script src="/js/ggip_edit.js"></script>
</body>
</html>