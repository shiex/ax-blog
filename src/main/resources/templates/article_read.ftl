<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>博客界面</title>
    <link rel="stylesheet" href="/frontend/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/frontend/css/icofont.css">
    <link rel="stylesheet" href="/frontend/highlight/styles/atom-one-dark.css">
    <#--<link rel="stylesheet" href="/frontend/highlight/styles/github.css">-->

    <style>
        body {
            margin: 0px;
            padding: 0px;
        }

        .navbar-expand-lg {
            background-color: #fff;
            height: 70px;
            box-shadow: 0 1px 6px 0px rgba(0, 0, 0, 0.14);
        }

        .box-sh {
            box-shadow: 0 1px 6px 0px rgba(0, 0, 0, 0.2);
        }

        .article {
            border-top: 5px solid #eeeeee;
            padding-top: 20px;
        }

        .left-top {
            padding: 10px;
            border: 1px solid #eeeeee;
        }

        .left-top .media {
            padding-top: 5px;
            padding-bottom: 17px;
        }

        .left-top .attn:hover {
            border-bottom: 1px solid #007bff;
            cursor: pointer;
        }

        .left-top .ajn {
            padding-top: 5px;
        }

        .left-zj {
            margin-top: 25px;
            padding: 10px 0px;
        }

        .left-zj .item {
            margin-bottom: 15px;
        }

        .left-zj .item .item-title {
            border-radius: 20px;
            padding: 3px 10px;
            color: #fff;
            background-color: #ce9c9c;
        }

        .left-zj .item .item-con {
            padding: 3px 10px;
        }

        .item-con a {
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-box-orient: vertical;
            white-space: pre-wrap;
        }

        .article-con {
            min-height: 100px;
            margin-bottom: 20px;
            padding: 20px 10px;
            border-bottom: 1px solid #caccce;
        }

        .comment-con {
            padding: 0px 15px;
            border-bottom: 1px solid #e4e0e0;
            margin-top: 30px;
        }

        .comment-con .comment-txt {
            width: 100%;
            padding: 10px 0px;
            word-wrap: break-word;
            margin: 20px 0px;
        }

        .comment-txt .leave {
            width: 100%;
        }

        .comment-txt .leave textarea {
            display: block;
            width: 100%;
            padding: 7px 8px;
            background: #fff;
            border: 1px solid #c1c1c1;
            border-radius: 4px;
            resize: none;
            font-size: 14px;
            line-height: 22px;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            -webkit-transition: height .3s ease-in-out;
            transition: height .3s ease-in-out;
            height: 100px;
            vertical-align: top;
            outline: none;
        }

        .comment-list {
            padding: 20px 10px;
            margin-bottom: 15px;
        }

        .comment-list .comment .ry {
            margin-left: 40px;
            padding-left: 5px
        }

        .comment-list .reply-leave {
            padding: 10px 0px;
            margin-bottom: 10px;
            display: none;
            border-bottom: 1px dashed #cecbcb;
        }

        .comment-list .reply-leave textarea {
            display: block;
            width: 90%;
            padding: 7px 8px;
            background: #fff;
            border: 1px solid #c1c1c1;
            border-radius: 4px;
            resize: none;
            font-size: 14px;
            line-height: 22px;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            -webkit-transition: height .3s ease-in-out;
            transition: height .3s ease-in-out;
            height: 85px;
            vertical-align: top;
            outline: none;
        }

        .comment .leave .fb-button label {
            margin-right: 10px;
            color: #7db797;
        }

        .comment .label {
            color: #2D93CA;
            cursor: pointer;
            display: none;
        }

        .comment .label2 {
            color: #2D93CA;
            cursor: pointer;
            margin-right: 15px;
        }

        .comment .username-a {
            color: #444444;
        }

        .comment .com-con {
            display: block;
            word-break: break-all;
            word-wrap: break-word;
            margin: 0px;
        }

        .comment .comment-time {
            color: #9F9F9F;
            margin-right: 15px;
        }

        .fb-button {
            width: 100%;
            text-align: right;
        }

        .fb-button button {
            padding: 4px 6px;
            border-radius: 4px;
            background-color: #6ab4ca;
            border: 0px;
            color: #FFFFFF;
            margin-top: 10px;
            cursor: pointer;
        }

        .not-allowed {
            cursor: not-allowed;
        }

        .dis-none {
            display: none;
        }

        .na {
            padding: 0px;
            padding-bottom: 10px;
            border-bottom: 1px solid #caccce;
        }

        .na .icofont-heart-alt:hover {
            cursor: pointer;
        }

        .isAppluad {
            color: #e62020;
        }

        .minW-110 {
            min-width: 110px;
        }

        .minW-80 {
            min-width: 80px;
        }

        blockquote {
            display: block;
            border-left: 8px solid #d0e5f2;
            padding: 5px 10px;
            margin: 10px 0;
            line-height: 1.4;
            font-size: 100%;
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>
<#include "static_top.ftl">
<div class="article">
    <#setting datetime_format='yyyy-MM-dd hh:mm:ss'>
    <div class="container" style="margin-bottom: 30px">
        <div class="row">

            <#--    左侧区域    -->
            <div class="col-xl-9" style="border-right: 1px solid #caccce">
                <div style="line-height: 40px; position: relative">
                    <#if article.original>
                        <span class="badge badge-pill badge-success" style="padding: 8px; position: absolute; top: 6px">转载</span>
                    <#else >
                        <span class="badge badge-pill badge-danger" style="padding: 8px; position: absolute; top: 6px">原创</span>
                    </#if>
                    <h2 style="display: inline-block; margin-left: 50px">
                        ${article.title}
                    </h2>
                </div>
                <nav class="navbar navbar-expand-sm na" style="position: relative">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link text-muted minW-110">${article.issueTime?datetime}</a>
                        </li>
                        <li class="nav-item">
                            <#if article.collectId ??>
                                <a class="nav-link text-primary minW-80" style="cursor: pointer"
                                   collectId="${article.collectId?c}" articleId="${article.id?c}" onclick="isCollect(this)">
                                    取消收藏
                                </a>
                            <#else>
                                <a class="nav-link text-primary minW-80" style="cursor: pointer"
                                   collectId="0" articleId="${article.id?c}" onclick="isCollect(this)">
                                    点击收藏
                                </a>
                            </#if>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-muted minW-80">
                                阅读数：${article.readCount?c}
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-muted minW-80 appluad-count">
                                点赞量：${article.appluadCount?c}
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-muted minW-80 comment-count">评论量：${article.commentCount?c}1</a>
                        </li>
                        <#if article.label ??>
                            <li class="nav-item">
                                <a class="nav-link text-success minW-110"
                                   href="/label/list?labelId=${article.label.id?c}&labelName=${article.label.labelName}">
                                    标签：${article.label.labelName}
                                </a>
                            </li>
                        </#if>
                        <li class="nav-item" style="position: absolute; right: 0px; text-align: right">
                            <#if article.user.appluad ??>
                                <a class="nav-link text-muted" style="padding-right: 0px">
                                    <i class="icofont icofont-heart-alt isAppluad"
                                       appluadId="${article.user.appluad.id?c}"
                                       onclick="isAppluad(${article.id?c}, this)"></i>
                                </a>
                            <#else >
                                <a class="nav-link text-muted" style="padding-right: 0px">
                                    <i class="icofont icofont-heart-alt" appluadId="0"
                                       onclick="isAppluad(${article.id?c}, this)"></i>
                                </a>
                            </#if>
                        </li>
                    </ul>
                </nav>
                <div class="article-con">
                    ${article.content}
                </div>

                <#--    留言框     -->
                <div class="layui-form comment-con">
                    <div class="comment-txt">
                        <div class="leave">
                            <input name="articleId" value="${article.id?c}" style="display: none">
                            <textarea class="layui-input-block leave-text" name="content" placeholder="最多可输入500字符"
                                      lay-verify="required" lay-reqtext="留言内容不得为空" autocomplete="off"></textarea>
                            <div class="fb-button">
                                <label class="text-size" style="color: #28a745; margin-right: 15px"></label>
                                <button class="layui-btn" lay-submit lay-filter="comment-add"> 发表评论</button>
                            </div>
                        </div>
                    </div>
                </div>

                <#--    留言回复内容区域    -->
                <div class="comment-list" id="comment-list">
                    <#if commentList ??>
                        <#list commentList as comment>
                            <div class="comment">
                                <#--    留言内容区   -->
                                <div class="media">
                                    <div class="media-left">
                                        <img src="${comment.user.headPortrait}" class="media-object" style="width:30px">
                                    </div>
                                    <div class="media-body reply-show" style="padding: 0px 10px; width: 95%">
                                        <div class="com-con">
                                            <a class="username-a" href="#">${comment.user.username}</a>
                                            <a style="margin-right: 15px">：${comment.content}</a>
                                            <label class="comment-time">${comment.commentTime?datetime}</label>
                                            <div id="reply-look" replyCount="${comment.replyCount}"
                                                 style="display: inline-block">
                                                <#if comment.replyCount != 0>
                                                    <label class="label2 look" data-toggle="collapse"
                                                           data-parent="#accordion${comment.id?c}"
                                                           href="#collapseThree${comment.id?c}">查看回复(${comment.replyCount?c}
                                                        )
                                                    </label>
                                                </#if>
                                            </div>
                                            <a class="label" style="color: #2D93CA" onclick="showReply(this, 1)">回复</a>
                                        </div>
                                    </div>
                                </div>
                                <#--    回复内容区   -->
                                <div class="panel-group ry" id="accordion${comment.id?c}">
                                    <div id="collapseThree${comment.id?c}" class="panel-collapse collapse">
                                        <div id="reply-list">
                                            <#if comment.replyList ??>
                                                <#list comment.replyList as reply>
                                                    <div class="panel-body">
                                                        <div class="media">
                                                            <div class="media-left">
                                                                <img src="${reply.user.headPortrait}"
                                                                     class="media-object" style="width:30px">
                                                            </div>
                                                            <div class="media-body" style="padding: 0px 10px">
                                                                <div class="com-con">
                                                                    <a class="username-a"
                                                                       href="#">${reply.user.username}</a>
                                                                    <div style="color: #b1b0b0; display: inline-block">
                                                                        回复
                                                                    </div>${reply.byUsername}：${reply.content}
                                                                    <label class="comment-time">${reply.replyTime?datetime}</label>
                                                                    <a class="label" style="color: #2D93CA;"
                                                                       onclick="showReply(this, 0)">回复</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </#list>
                                            </#if>
                                        </div>
                                    </div>
                                </div>
                                <#--    回复框     -->
                                <div class="layui-form reply-leave ry">
                                    <input class="dis-none" name="commentId" value="${comment.id?c}">
                                    <input class="byUsername dis-none" name="byUsername">
                                    <textarea class="layui-input-block reply-input" name="content" placeholder=""
                                              lay-verify="required" lay-reqtext="回复内容不得为空"
                                              autocomplete="off"></textarea>
                                    <div class="fb-button" style="width: 90%; margin-top: 10px;">
                                        <button class="layui-btn" lay-submit lay-filter="reply-add">确定</button>
                                        <button onclick="callReply(this)">取消</button>
                                    </div>
                                </div>
                            </div>
                        </#list>
                    </#if>
                </div>
                <#--    留言回复内容区域    -->
            </div>

            <#--    右侧区域    -->
            <div class="col-xl-3">

                <#--    博主信息区域   -->
                <div class="left-top box-sh">
                    <div class="media" style="border-bottom: 1px solid #93b3d4">
                        <div class="media-left">
                            <a href="#">
                                <img class="media-object" src="${article.user.headPortrait}"
                                     style="width: 50px; height: 50px; border-radius: 50%">
                            </a>
                        </div>
                        <div class="media-body" style="margin-left: 10px">
                            <h6 class="media-heading">
                                <a href="#" style="color: #444">${article.user.username}</a>
                            </h6>
                            <#if article.user.attention ??>
                                <a class="attn" attentionId="${article.user.attention.id?c}"
                                   onclick="isAttention(${article.user.id?c}, this)"
                                   style="color: #007bff">取消关注</a>
                            <#else >
                                <a class="attn" attentionId="0" onclick="isAttention(${article.user.id?c}, this)"
                                   style="color: #007bff">关注</a>
                            </#if>
                        </div>
                    </div>
                    <div class="ajn">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link text-dark">博客数量：${article.user.articleCount?c}</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-dark">关注：${article.user.followCount?c}</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-dark fans-count">粉丝：${article.user.fansCount?c}</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-dark">人气值：${article.user.popularityCount?c}</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <#--    标签、热门博客、推荐博客    -->
                <div class="left-zj">
                    <#if labelList ??>
                        <#if (labelList?size > 0)>
                        <#--    标签分类    -->
                            <div class="item">
                                <div class="item-title box-sh">
                                    专属标签
                                </div>
                                <div class="item-con">
                                    <ul class="navbar-nav">
                                        <#list labelList as label>
                                            <li class="nav-item">
                                                <a class="nav-link text-primary" target="_blank" href="/label/list?labelId=${label.id?c}&labelName=${label.labelName}">${label.labelName}</a>
                                            </li>
                                        </#list>
                                    </ul>
                                </div>
                            </div>
                        </#if>
                    </#if>

                    <#--    热门博客    -->
                    <div class="item">
                        <div class="item-title box-sh">
                            热门博客
                        </div>
                        <div class="item-con">
                            <ul class="navbar-nav">
                                <#list articleHotList as articleHot>
                                    <li class="nav-item">
                                        <a class="nav-link text-primary" href="/article/read/${articleHot.id?c}">${articleHot.title}<#t><span class="badge badge-secondary" style="margin-left: 10px">阅读数：${articleHot.readCount?c}</span></a>
                                    </li>
                                </#list>
                            </ul>
                        </div>
                    </div>

                    <#--    博主推荐    -->
                    <#if articleRecommendList ??>
                        <#if (articleRecommendList?size > 0)>
                            <div class="item">
                                <div class="item-title box-sh">
                                    博主推荐
                                </div>
                                <div class="item-con">
                                    <ul class="navbar-nav">
                                        <#list articleRecommendList as articleRecommend>
                                            <li class="nav-item">
                                                <a class="nav-link text-primary" href="/article/read/${articleRecommend.id?c}">${articleRecommend.title}<#t></a>
                                            </li>
                                        </#list>
                                    </ul>
                                </div>
                            </div>
                        </#if>
                    </#if>
                </div>
            </div>

        </div>
    </div>
</div>
<div>

</div>
</body>

<#--    留言模板    -->
<script type="text/html" id="comment-tmp">
    <div class="comment">
        <div class="media">
            <div class="media-left">
                <img src="{{user.headPortrait}}" class="media-object" style="width:30px">
            </div>
            <div class="media-body reply-show" style="padding: 0px 10px; width: 95%">
                <div class="com-con">
                    <a class="username-a" href="#">{{user.username}}</a>
                    <a style="margin-right: 15px">：{{content}}</a>
                    <label class="comment-time">{{commentTime}}</label>
                    <div id="reply-look" replyCount="{{replyCount}}" style="display: inline-block">

                    </div>
                    <a class="label" style="color: #2D93CA" onclick="showReply(this, 1)">回复</a>
                </div>
            </div>
        </div>
        <div class="panel-group ry" id="accordion{{id}}">
            <div id="collapseThree{{id}}" class="panel-collapse collapse">
                <div id="reply-list">

                </div>
            </div>
        </div>
        <div class="layui-form reply-leave ry">
            <input class="dis-none" name="commentId" value="{{id}}">
            <input class="byUsername dis-none" name="byUsername">
            <textarea class="layui-input-block reply-input" name="content" placeholder=""
                      lay-verify="required" lay-reqtext="回复内容不得为空"
                      autocomplete="off"></textarea>
            <div class="fb-button" style="width: 90%; margin-top: 10px;">
                <button class="layui-btn" lay-submit lay-filter="reply-add">确定</button>
                <button onclick="callReply(this)">取消</button>
            </div>
        </div>
    </div>
</script>
<#--    回复模板    -->
<script type="text/html" id="reply-tmp">
    <div class="panel-body">
        <div class="media">
            <div class="media-left">
                <img src="{{user.headPortrait}}" class="media-object" style="width:30px">
            </div>
            <div class="media-body" style="padding: 0px 10px">
                <div class="com-con">
                    <a class="username-a" href="#">{{user.username}}</a>
                    <div style="color: #b1b0b0; display: inline-block">
                        回复
                    </div>
                    {{byUsername}}：{{content}}
                    <label class="comment-time">{{replyTime}}</label>
                    <a class="label" style="color: #2D93CA;" onclick="showReply(this, 0)">回复</a>
                </div>
            </div>
        </div>
    </div>
</script>
<#--    查看回复模板   -->
<script type="text/html" id="reply-look-tmp">
    <label class="label2 look" data-toggle="collapse"
           data-parent="#accordion{{commentId}}"
           href="#collapseThree{{commentId}}">查看回复(1)
    </label>
</script>

<script type="text/javascript" src="/frontend/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="/frontend/highlight/highlight.pack.js"></script>
<script type="text/javascript" src="/frontend/js/axquery.js"></script>
<script type="text/javascript" src="/frontend/js/template-web.js"></script>
<script type="text/javascript" src="/frontend/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/frontend/layui/layui.all.js"></script>
<script type="text/javascript" src="frontend/js/static-top.js"></script>

<script type="text/javascript">
    $(function () {
        $('pre code').each(function (i, block) {
            hljs.highlightBlock(block);
        });
    });
</script>
<#--<script >hljs.initHighlightingOnLoad();</script>-->

<script>

    // 是否关注，ID不为0：取消关注，反之为关注此博主
    function isAttention(followId, e) {
        var attention = {};
        attention.id = $(e).attr('attentionId');
        attention.followId = followId;
        Ax.rest('/attention/isAttention', attention, function (data) {
            var fansCount = $('.ajn .fans-count').text().substring(3);
            if (attention.id == 0) {
                $(e).attr('attentionId', data);
                $(e).text('取消关注');
                fansCount = parseInt(fansCount) + 1;
            } else {
                $(e).attr('attentionId', 0);
                $(e).text('关注');
                fansCount = parseInt(fansCount) - 1;
            }
            $('.ajn .fans-count').text('粉丝：' + fansCount);
        });
    }

    // 是否点赞，ID不为0：取消点赞，反之为点赞此博客
    function isAppluad(articleId, e) {
        var appluad = {};
        appluad.articleId = articleId;
        appluad.id = $(e).attr('appluadId');
        Ax.rest('/appluad/isAppluad', appluad, function (data) {
            var appluadCount = $('.na .appluad-count').text().trim().substring(4);
            if (appluad.id == 0) {
                $(e).attr('appluadId', data);
                $(e).addClass('isAppluad');
                appluadCount = parseInt(appluadCount) + 1;
            } else {
                $(e).attr('appluadId', 0);
                $(e).removeClass('isAppluad');
                appluadCount = parseInt(appluadCount) - 1;
            }
            $('.na .appluad-count').text('点赞量：' + appluadCount);
        });
    }

    // 是否收藏，ID不为0：取消收藏，反之为收藏此博客
    function isCollect(e) {
        var collect = {};
        collect.id = $(e).attr('collectId');
        collect.articleId = $(e).attr('articleId');
        Ax.rest('/collect/isCollect', collect, function (data) {
            if (collect.id == 0) {
                $(e).attr('collectId', data);
                $(e).text('取消收藏');
            } else {
                $(e).attr('collectId', 0);
                $(e).text('点击收藏');
            }
        });
    }

    // 显示回复框
    function showReply(e, is) {
        var replyEl;
        if (is == 0) {
            replyEl = $(e).parent().parent().parent().parent().parent().parent().parent().parent();
        } else {
            replyEl = $(e).parent().parent().parent().parent();
        }
        var usernameEl = $(e).parent();
        var username = $('.username-a', usernameEl).text().trim();
        $('.byUsername', replyEl).val(username);
        $('.reply-input', replyEl).attr('placeholder', '正在回复 @ ' + username + '...');
        $('.reply-leave', replyEl).show();
    }

    // 关闭回复框
    function callReply(e) {
        var replyLeave = $(e).parent().parent();
        $(replyLeave).hide();
        $('.reply-input', replyLeave).val('');
        $('.byUsername', replyLeave).val('');
    }

    layui.use('form', function () {
        var form = layui.form;

        // 添加评论
        form.on('submit(comment-add)', function (fromData) {
            Ax.rest('/comment/add', fromData.field, function (data) {
                var commentHtml = template('comment-tmp', data);
                $('#comment-list').append(commentHtml);

                var leaveEl = $(fromData.elem).parent().parent();
                $('.leave-text', leaveEl).val('');
                $('.text-size').text('');

                var commentCount = $('.na .comment-count').text().substring(4);
                commentCount = parseInt(commentCount) + 1;
                $('.na .comment-count').text('评论量：' + commentCount);

                monitorReply();
                layer.msg('留言成功');
            });
            return false;
        });

        // 添加回复
        form.on('submit(reply-add)', function (fromData) {
            Ax.rest('/reply/add', fromData.field, function (data) {
                var replyHtml = template('reply-tmp', data);
                var replyLeaveEl = $(fromData.elem).parent().parent();
                var commentEl = $(replyLeaveEl).parent();
                $('#reply-list', commentEl).append(replyHtml);
                $('.reply-input', replyLeaveEl).val('');
                if ($('.look', commentEl).length > 0) {
                    var replyCount = $('#reply-look', commentEl).attr('replyCount');
                    replyCount = parseInt(replyCount) + 1;
                    $('#reply-look', commentEl).attr('replyCount', replyCount);
                    $('.look', commentEl).text('查看回复(' + replyCount + ')');
                } else {
                    var replyLookHtml = template('reply-look-tmp', data);
                    $('#reply-look', commentEl).append(replyLookHtml);
                }
                monitorReply();
                layer.msg('回复成功');
            });
            return false;
        });

    });

    // 实时监控 textarea 内容长度
    $('.leave-text').bind('input propertychange', 'leave-text', function () {
        var text = $(this).val();
        if (text.length >= 500) {
            $('.text-size').text('字符数量已达到上限');
            $(this).addClass('not-allowed');

        } else {
            $('.text-size').text('已输入：' + text.length + '字符');
            $(this).removeClass('not-allowed');
        }
    });


    // 监听鼠标移上移开事件，动态显示隐藏回复按钮
    function monitorReply() {
        $(".media-body").mouseover(function () {
            $(".label", this).show();
        }).mouseout(function () {
            $(".label", this).hide();
        });
    }

    monitorReply();
</script>
</html>