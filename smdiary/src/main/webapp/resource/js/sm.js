if (typeof JSON !== 'object') {JSON = {};}
(function () {'use strict';function f(n) {return n < 10 ? '0' + n : n;}
    if (typeof Date.prototype.toJSON !== 'function') {Date.prototype.toJSON = function (key) {return isFinite(this.valueOf())? this.getUTCFullYear()+'-'+f(this.getUTCMonth() + 1) + '-' +f(this.getUTCDate())+'T'+f(this.getUTCHours())+':'+f(this.getUTCMinutes())+':'+f(this.getUTCSeconds())+'Z':null;};String.prototype.toJSON=Number.prototype.toJSON=Boolean.prototype.toJSON = function (key){return this.valueOf();};}
    var cx = /[\u0000\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,escapable = /[\\\"\x00-\x1f\x7f-\x9f\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,gap,indent, meta = {'\b': '\\b','\t': '\\t','\n': '\\n','\f': '\\f','\r': '\\r','"' : '\\"','\\': '\\\\'},rep;
    function quote(string) {escapable.lastIndex = 0; return escapable.test(string) ? '"' + string.replace(escapable, function(a){var c = meta[a];return typeof c === 'string'? c: '\\u' + ('0000' + a.charCodeAt(0).toString(16)).slice(-4);})+'"':'"'+string+'"';}
    function str(key, holder) { var i,k,v,length,mind = gap,partial,value = holder[key];if (value && typeof value==='object' && typeof value.toJSON==='function') {value = value.toJSON(key);}if (typeof rep === 'function') {value = rep.call(holder, key, value);}switch (typeof value) { case 'string':return quote(value);case 'number': return isFinite(value) ? String(value) : 'null';case 'boolean':case 'null':return String(value);case 'object': if (!value){return 'null';}gap += indent;partial = [];if (Object.prototype.toString.apply(value) === '[object Array]') {length = value.length;for (i = 0; i < length; i += 1) {partial[i] = str(i, value) || 'null';}v = partial.length === 0 ? '[]' : gap ? '[\n' + gap + partial.join(',\n' + gap) + '\n' + mind + ']' : '[' + partial.join(',') + ']';gap = mind;return v;}if (rep && typeof rep === 'object') {length=rep.length;for (i=0; i<length;i+=1){if (typeof rep[i] === 'string') {k = rep[i];v = str(k, value);if(v){partial.push(quote(k) + (gap ? ': ' : ':') + v);}}}}else{for(k in value){if (Object.prototype.hasOwnProperty.call(value, k)){v = str(k, value);if(v){partial.push(quote(k) + (gap ? ': ' : ':') + v);}}}}v = partial.length === 0 ? '{}' : gap ? '{\n' + gap + partial.join(',\n' + gap) + '\n' + mind + '}' : '{' + partial.join(',') + '}';gap = mind;return v;}}
   if (typeof JSON.stringify !== 'function') {JSON.stringify = function (value, replacer, space) { var i;gap = '';indent = '';if (typeof space === 'number') {for (i = 0; i < space; i += 1) {indent += ' ';}}else if (typeof space === 'string') {indent = space;}rep = replacer;if (replacer && typeof replacer !== 'function' && (typeof replacer !== 'object' || typeof replacer.length !== 'number')) {throw new Error('JSON.stringify');} return str('', {'': value});};}
   if (typeof JSON.parse !== 'function') {JSON.parse = function (text, reviver) { var j;function walk(holder, key) {var k, v, value = holder[key];if (value && typeof value === 'object') {for (k in value) {if (Object.prototype.hasOwnProperty.call(value, k)) {v = walk(value, k);if (v !== undefined) {value[k] = v;}else{delete value[k];}}}}return reviver.call(holder, key, value);}text = String(text);cx.lastIndex = 0; if (cx.test(text)) {text = text.replace(cx, function (a) {return '\\u' +('0000' + a.charCodeAt(0).toString(16)).slice(-4);});}if (/^[\],:{}\s]*$/ .test(text.replace(/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g, '@').replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g, ']').replace(/(?:^|:|,)(?:\s*\[)+/g, ''))) {j = eval('(' + text + ')');return typeof reviver === 'function' ? walk({'': j}, ''): j; } throw new SyntaxError('JSON.parse');};}
}());

/**
 * @Author Ken
 * @Since 2014-09-17
 */
var sm;
if (typeof sm !== 'object') {
	sm = {};
}
(function() {
	/** 弹出窗口 */
	sm.pop = function(msg, title, icon) {
		alert(msg);
	};
	/** 成功时的返回函数 */
	sm.success = function(msg, title, icon) {
		sm.pop(msg, title, icon);
	};
	/** 成功时的返回函数 */
	sm.error = function(msg, title, icon) {
		sm.pop(msg, title, icon);
	};
	/** ajax请求，请参照sm.ajax.request方法 */
	sm.ajax = function() {
		/** opt ,json 对象,元素：async method data success error */
		function request(opt) {
			var url = opt.url || "";
			var async = opt.async || true, method = opt.method || 'GET', data = opt.data
					|| null, success = opt.success || sm.success, error = opt.failure
					|| sm.error;
			method = method.toUpperCase();
			if (method == 'GET' && data) {
				var args = "";
				if (typeof data == 'string') {
					args = data;
				} else if (typeof data == 'object') {
					var arr = new Array();
					for ( var k in data) {
						var v = data[k];
						arr.push(k + "=" + v);
					}
					args = arr.join("&");
				}
				url += (url.indexOf('?') == -1 ? '?' : '&') + args;
				data = null;
			}
			var xhr = window.XMLHttpRequest ? new XMLHttpRequest()
					: new ActiveXObject('Microsoft.XMLHTTP');
			xhr.onreadystatechange = function() {
				_onStateChange(xhr, success, error);
			};
			xhr.open(method, url, async);
			if (method == 'POST') {
				xhr.setRequestHeader('Content-type',
						'application/x-www-form-urlencoded;');
			}
			/*
			 * console.log(xhr); console.log(data);
			 */
			xhr.send(method == "POST" ? JSON.stringify(data) : null);
			return xhr;
		}
		function _onStateChange(x, success, failure) {
			if (x.readyState == 4) {
				if (x.status >= 200 && x.status < 300) {
					success(x);
				} else {
					failure(x);
				}
			} else {
			}
		}
		return {
			request : request
		};
	}();

}());
