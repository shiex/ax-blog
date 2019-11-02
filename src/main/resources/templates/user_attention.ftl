<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>个人中心</title>
    <link rel="stylesheet" href="/frontend/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/frontend/css/icofont.css">

    <style>
        body {
            margin: 0px;
            padding: 0px;
            background-color: #eeeeee;
        }

        .navbar {
            background-color: #fff;
            height: 70px;
            box-shadow: 0 1px 6px 0px rgba(0, 0, 0, 0.14);
        }

        .center {
        }

        .center .center-left {

        }

        .center .center-right {
            position: relative;
            background-color: #fff;
            padding: 0px 10px;
            padding-bottom: 10px;
        }

        dd {
            margin-left: 15px;
        }

        .center-right .card a {
            color: #444;
        }

        .center-right .card .btn-outline-primary{
            position: absolute;
            right: 10px;
            top: 18px;
            padding: 4px
        }
    </style>
</head>
<body>
<#include "static_top.ftl">
<div class="center">
    <div class="container">
        <div class="row">
            <div class="col-xl-2" style="padding: 10px">
                <div class="center-left">
                    <div class="list-group">
                        <a href="/user/center" class="list-group-item">个人资料</a>
                        <a href="/collect/index" class="list-group-item">我的收藏</a>
                        <#if queryType == '0'>
                            <a href="/attention/list/0" class="list-group-item active">我的关注</a>
                            <a href="/attention/list/1" class="list-group-item">我的粉丝</a>
                        <#else>
                            <a href="/attention/list/0" class="list-group-item">我的关注</a>
                            <a href="/attention/list/1" class="list-group-item active">我的粉丝</a>
                        </#if>
                        <a href="/article/manage" class="list-group-item">博客管理</a>
                        <a href="/label/index" class="list-group-item">标签分类</a>
                        <a href="#" class="list-group-item">浏览足迹</a>
                    </div>
                </div>
            </div>
            <div class="col-xl-10" style="padding: 10px">
                <div class="center-right">
                    <#if queryType == '0'>
                        <div class="row" style="padding: 10px;margin: 0px 10px; border-bottom: 1px solid #adb5bd">
                            <div class="col-sm-5" style="margin: 5px 0px">
                                <h5 style="margin: 0px;">- 关注列表 -</h5>
                            </div>
                        </div>
                    <#else>
                        <div class="row" style="padding: 10px;margin: 0px 10px; border-bottom: 1px solid #adb5bd">
                            <div class="col-sm-5" style="margin: 5px 0px">
                                <h5 style="margin: 0px;">- 粉丝列表 -</h5>
                            </div>
                        </div>
                    </#if>
                    <div id="attentionList" style="margin-top: 15px; padding: 10px 30px;">
                        <div class="container">
                            <div class="row">
                                <#if attentionList ??>
                                    <#list attentionList as attention>
                                        <div class="col-xl-6" style="padding: 10px">
                                            <div class="card">
                                                <div class="card-body" style="padding: 10px; position: relative">
                                                    <a href="/user/index/${attention.user.id?c}"><img
                                                                src="${attention.user.headPortrait}" width="50px"
                                                                height="50px"></a>
                                                    <a href="/user/index/${attention.user.id?c}">
                                                        ${attention.user.username}
                                                    </a>
                                                    <label style="color: #4caf50; margin-left: 3px">
                                                        (人气值:${attention.user.popularityCount?c})
                                                    </label>
                                                    <#if queryType == '0'>
                                                        <button class="btn btn-outline-primary"
                                                                attentionId="${attention.id?c}"
                                                                followId="${attention.user.id?c}"
                                                                onclick="isAttention(this)">
                                                            取消关注
                                                        </button>
                                                    </#if>
                                                </div>
                                            </div>
                                        </div>
                                    </#list>
                                </#if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

<script type="text/javascript" src="/frontend/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="/frontend/js/axquery.js"></script>
<script type="text/javascript" src="/frontend/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/frontend/layui/layui.js"></script>
<script type="text/javascript" src="/frontend/js/template-web.js"></script>
<script type="text/javascript" src="frontend/js/static-top.js"></script>

<script>
    // 是否关注，ID不为0：取消关注，反之为关注此博主
    function isAttention(e) {
        var attention = {};
        attention.id = $(e).attr('attentionId');
        attention.followId = $(e).attr('followId');
        Ax.rest('/attention/isAttention', attention, function (data) {
            if (attention.id == 0) {
                $(e).attr('attentionId', data);
                $(e).text('取消关注');
            } else {
                $(e).attr('attentionId', 0);
                $(e).text('关注');
            }
        });
    }
</script>
</html>