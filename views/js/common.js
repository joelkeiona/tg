(function (global) {

	global.utils = {
		parseParams: function (rule) {
			var pathname = location.pathname;
			var params = {};
			var groups = {};
			var count = 0;
			var pattern = rule
				.replace(/:([^\/]+)/g, function (match, $1) {
					groups[++count] = $1;
					return '([^\/]+)';
				})
				.replace(/\//g, '\\\/');
			var re = new RegExp(pattern);
			pathname.replace(re, function () {
				for (var i = 1; i <= count; ++i) {
					params[groups[i]] = decodeURIComponent(arguments[i]);
				}
			});
			return params;
		},
		extend: function (target, /** ..., **/ objects) {
			target = target || {};
			for (var i = 1, l = arguments.length; i < l; ++i) {
				var object = arguments[i];
				Object.keys(object).forEach(function (key) {
					target[key] = object[key];
				});
			}
			return target;
		},
		showToast: function (message) {
			var toast = document.getElementById('toast');
			var wrapper = document.getElementById('toast-wrapper');
			toast.innerHTML = message;
			wrapper.className = 'show';
			clearTimeout(utils.showToast.timer);
			utils.showToast.timer = setTimeout(function () {
				wrapper.className = '';
			}, 1800);
		},
		i18n: function (str) {
			return str;
		},
	};

	if (document.getElementById('nav')) {
		global.nav = new Vue({
			el: '#nav',
			data: {
				curPage: '',
				menus: [
				// 	{
				// 	name: 'projects',
				// 	icon: 'project',
				// 	label: 'Projects',
				// 	link: '/projects'
				// },
					// {
				// 	name: 'histories',
				// 	icon: 'history',
				// 	label: 'Histories',
				// 	link: '/histories'
				// },
					{
						name: 'apps',
						icon: 'project',
						label: 'Apps',
						link: '/apps'
					},
					{
					name: 'users',
					icon: 'user',
					label: 'Users',
					link: '/users'
				}, {
					name: 'profile',
					icon: 'profile',
					label: 'Profile',
					link: '/profile'
				}, {
					name: 'logout',
					icon: 'logout',
					label: 'Logout',
					link: '/logout'
				}]
			},
			methods: {
				init: function (page) {
					this.curPage = page;
				},
				i18n: utils.i18n
			}
		});
	}

	Vue.directive('display', {
		update: function (value) {
			if (value) {
				this.el.style.display = this.arg;
			} else {
				this.el.style.display = 'none';
			}
		}
	});

	Vue.filter('datetime', function (time) {
		var d = new Date(time);
		if (!d.getTime()) {
			return;
		}
		var year = d.getFullYear();
		var month = d.getMonth() + 1;
		var date = d.getDate();
		var hours = d.getHours();
		var minutes = d.getMinutes();
		var seconds = d.getSeconds();
		month = month < 10 ? '0' + month : month;
		date = date < 10 ? '0' + date : date;
		hours = hours < 10 ? '0' + hours : hours;
		minutes = minutes < 10 ? '0' + minutes : minutes;
		seconds = seconds < 10 ? '0' + seconds : seconds;
		return year + '-' + month + '-' + date + ' ' + hours + ':' + minutes + ':' + seconds;
	});

	Vue.filter('duration', function (duration) {
		var oneSecond = 1000;
		var oneMinute = oneSecond * 60;
		var oneHour = oneMinute * 60;
		var oneDay = oneHour * 24;
		if (duration > oneDay * 2) {
			return (duration / oneDay).toFixed(2) + ' ' + utils.i18n('days');
		} else if (duration > oneHour) {
			return (duration / oneHour).toFixed(2) + ' ' + utils.i18n('hr');
		} else if (duration > oneMinute) {
			return (duration / oneMinute).toFixed(2) + ' ' + utils.i18n('min');
		} else if (duration > oneSecond) {
			return (duration / oneSecond).toFixed(0) + ' ' + utils.i18n('sec');
		} else if (duration > 0) {
			return duration + ' ' + utils.i18n('ms');
		} else {
			return '';
		}
	});

	Vue.filter('command', function (script, length) {
		script = script.replace(/\n/g, ' ');
		length = length || 100;
		if (script.length > length) {
			script = script.slice(0, length) + '...';
		}
		return script;
	});

	Vue.filter('i18n', utils.i18n);

	Vue.filter('statusStr', function (status) {
		return utils.i18n(['Initial', 'Updating', 'Building', 'Testing', 'Packing', 'Deploying', 'Success', 'Failed', 'Aborted'][status]);
	});

	Vue.filter('AppStatusStr', function (status) {
		return utils.i18n(['未审核', '驳回', '一审通过', '二审中', '通过', '已给出', '删除或被封'][status]);
	});

	Vue.filter('statusColor', function (status) {
		return ['', 'color-info', 'color-info', 'color-info', 'color-info', 'color-primary', 'color-success', 'color-danger', 'color-warning'][status];
	});

	Vue.filter('i18n', utils.i18n);

})(window);
