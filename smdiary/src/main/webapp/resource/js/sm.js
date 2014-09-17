/**
 * @Author Ken
 * @Since 2014-09-17
 */
var sm;
if(!sm) sm= {};
/** 弹出窗口 */
sm.pop = function(msg,title,icon) {
	alert(msg);
};
/** 成功时的返回函数 */
sm.success = function(msg,title,icon){
	sm.pop(msg, title, icon);
};
/** 成功时的返回函数 */
sm.error =function (msg,title,icon){
	sm.pop(msg, title, icon);
};
/** ajax工具类url,method,params,success */
sm.ajax = function(json) {
	if(!json || !json.url){
		sm.error("ajax query no url params");
		return ;
	}
	new Ajax.Request(json.url, {
		method : !json.method ? 'GET' : jsonmethod,
		evalScripts : true,
		parameters : !json.params ? '' : json.params,
		onComplete : !josn.success ?sm.success:josn.success
	});
};
sm.parse = function(text, reviver) {
		cx = /[\u0000\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g;
		var j;
		function walk(holder, key) {
			var k, v, value = holder[key];
			if (value && typeof value === 'object') {
				for (k in value) {
					if (Object.prototype.hasOwnProperty.call(value, k)) {
						v = walk(value, k);
						if (v !== undefined) {
							value[k] = v;
						} else {
							delete value[k];
						}
					}
				}
			}
			return reviver.call(holder, key, value);
		}
		text = String(text);
		cx.lastIndex = 0;
		if (cx.test(text)) {
			text = text.replace(cx,function(a) {return '\\u' + ('0000' + a.charCodeAt(0).toString(16)).slice(-4);});
		}

		if (/^[\],:{}\s]*$/
				.test(text
						.replace(/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g, '@')
						.replace(
								/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g,
								']').replace(/(?:^|:|,)(?:\s*\[)+/g, ''))) {
			j = eval('(' + text + ')');
			return typeof reviver === 'function' ? walk({'' : j}, '') : j; 
		}
};
 