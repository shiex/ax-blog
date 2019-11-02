var Ax = {};

/* 输出日志 */
Ax.log = function (msg) {
    try {
        console.log(msg);
    } catch (err) {
    }
};

/* RESTful 调用的封装 
 *  示例  Af.rest("uri_of_rest_service", req, function(ans){
 * 	
 * });
 */

// 错误码的预处理： 返回true表示已过滤处理; 返回false表示未过滤
Ax.restErrFilter = function (error, reason) {
    return false;
}
// 默认错误处理
Ax.restErrHandler = function (error, reason) {
    layer.msg(reason);
};
// rest没有返回200 ( 可能返回500等错误，或者网络不可连接)
Ax.httpErrHandler = function () {
    // alert("服务器HTTP错误");
};
// serviceUri 服务名, req 请求参象 , dataHandler 应答数据处理函数
Ax.rest = function (serviceUri, req, dataHandler, restErrHandler) {
    jQuery.ajax({
        url: serviceUri,
        method: "POST",
        processData: false,
        data: JSON.stringify(req),
        dataType: 'json',
        contentType: "application/json; charset=utf-8",
        success: function (ans) {
            if (ans.error != 0) {
                if (ans.error == 403) {
                    location.href = "login.html";
                    return;
                }
                // 先由统一的过滤器进行处理
                if (Ax.restErrFilter(ans.error, ans.reason)) return;

                // 接下来，先用第4个参数(用户自己处理器处理)
                if (restErrHandler != null)
                    restErrHandler(ans.error, ans.reason);
                else
                // 如果未提供第4个参数，则进入默认处理(alert)
                    Ax.restErrHandler(ans.error, ans.reason); // 默认错误处理
            } else {
                dataHandler(ans.data);
            }
        }
    });
}

/* JSONP 调用 */
Ax.jsonp = function (URI, req, resultHanlder) {
    jQuery.ajax({
        url: URI,
        method: "GET", // get方式
        dataType: "jsonp", // 1: jsonp
        //jsonpCallback: "callback",
        data: req, // 参数
        success: resultHanlder
    });
}

/* 动态加载页面 */
Ax.loadPage = function (container, url) {
    // container可以是选择器字符串
    if (container.constructor == String)
        container = $(container);

    $.get(url, function (content) {
        container.html(content);
    });
}




	