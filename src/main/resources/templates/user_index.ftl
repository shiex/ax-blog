<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>博客界面</title>
    <link rel="stylesheet" href="/frontend/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/frontend/css/icofont.css">
    <link rel="stylesheet" type="text/css" href="/frontend/css/jquery.sPage.css">

    <style>
        body {
            margin: 0px;
            padding: 0px;
            background-color: #eeeeee;
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
            padding-top: 5px;
        }

        .left-top {
            background-color: #fff;
            padding: 0px 20px;
        }

        .left-top .media {
            padding-top: 5px;
            padding-bottom: 17px;
        }

        .left-top .ajn {
            padding: 10px;
            border-bottom: 1px solid #c5c4c1;
        }

        .left-top .attn:hover {
            border-bottom: 1px solid #007bff;
            cursor: pointer;
        }

        .left-top .justify-content-end li{
            margin-left: 15px;
            color: #6b6b6b;
        }

        .left-zj {
            background-color: #fff;
            padding: 20px 17px;
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

        .article .article-top{
            background-color: #fff;
            padding: 15px;
            border-bottom: 1px solid #dedddd;
            text-align: right;
        }

        .article .article-list{
            background-color: #fff;
        }

        .article .blog{
            padding: 15px;
            border: 1px solid #fff;
            border-bottom: 1px solid #dedddd;
        }

        .article .blog:hover{
            border: 1px solid #449fdb;
        }

        .blog h4{
            margin-bottom: 6px;
            font-size: 22px;
            line-height: 24px;
            color: #3d3d3d;
            display: inline-block;
        }

        .blog .nav li{
            margin-right: 10px;
        }

        .article-bottom{

        }

        .article-bottom .paging {
            float: left;
            width: 100%;
            background-color: #fff;
            padding: 0px 15px;
            line-height: 60px;
            margin-bottom: 20px;
        }

        .paging .num {
            height: 50px;
            line-height: 50px;
            text-align: left;
        }

        .paging .demo {
            text-align: left;
        }

        .media a{
            color: #444444;
        }
        .media a:hover{
            color: #449fdb;
        }
    </style>
</head>
<body>
<#setting datetime_format='yyyy-MM-dd hh:mm:ss'>
<#include "static_top.ftl">
<div class="article">
    <div class="container" style="margin-bottom: 30px">
        <div class="row">

            <#--    左侧区域    -->
            <div class="col-xl-9">
                <div class="article-top">
                    <div class="btn-group btn-group-sm">
                        <div class="btn btn-dark">排序</div>
                        <button type="button" class="btn btn-primary btn-secondary" style="margin-left: 7px">默认</button>
                        <button type="button" class="btn btn-primary" style="margin-left: 7px">阅读数</button>
                        <button type="button" class="btn btn-primary" style="margin-left: 7px">点赞量</button>
                        <button type="button" class="btn btn-primary" style="margin-left: 7px">发布时间</button>
                    </div>
                </div>
                <div id="article-list" class="article-list">
                    <div class="list-group" style="margin-bottom: 10px">
                        <#if articleList ??>
                            <#list articleList as article >
                                <div class="blog">
                                    <div class="media">
                                        <div class="media-body">
                                            <h4 class="media-heading">
                                                <#if article.original>
                                                    <span class="badge badge-pill badge-danger">原</span>
                                                <#else>
                                                    <span class="badge badge-pill badge-success">转</span>
                                                </#if>
                                                <#if article.stick>
                                                    <span class="badge badge-pill badge-primary">顶</span>
                                                </#if>
                                                <a href="/article/read/${article.id}" class="a">${article.title}</a>
                                            </h4>
                                            <div style="color: #6b6b6b">${article.synopsis}</div>
                                        </div>
                                    </div>
                                    <div class="container" style="margin-top: 5px">
                                        <div class="row">
                                            <ul class="nav col-md-12" style="text-align: right">
                                                <li class="nav-item">
                                                    <i class="icofont icofont-ui-calendar"></i> ${article.issueTime?datetime}
                                                </li>
                                                <li class="nav-item">
                                                    <i class="icofont icofont-eye-alt" style="color: #ced23f;"></i> ${article.readCount?c}
                                                </li>
                                                <li class="nav-item">
                                                    <i class="icofont icofont-heart-alt" style="color: #d278c2;"></i> ${article.appluadCount?c}
                                                </li>
                                                <li class="nav-item">
                                                    <i class="icofont icofont-comment" style="color: #449fdb"></i> ${article.commentCount?c}
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </#list>
                        </#if>
                    </div>
                </div>
                <div class="article-bottom">
                    <div class="paging" queryType="默认">
                        <div id="articlePage" class="demo"></div>
                    </div>
                </div>
            </div>

            <#--    右侧区域    -->
            <#include "static_user.ftl">

        </div>
    </div>
</div>
</body>

<script type="text/html" id="article-tmp">
    <div class="list-group" style="margin-bottom: 10px">
        {{each articleList as article}}
            <div class="blog">
                <div class="media">
                    <div class="media-body">
                        <h4 class="media-heading">
                            {{if article.original}}
                                <span class="badge badge-pill badge-danger">原</span>
                            {{else}}
                                <span class="badge badge-pill badge-success">转</span>
                            {{/if}}
                            {{if article.stick}}
                                <span class="badge badge-pill badge-primary">顶</span>
                            {{/if}}
                            <a href="/article/read/{{article.id}}">{{article.title}}</a>
                        </h4>
                        <div style="color: #6b6b6b">{{article.synopsis}}</div>
                    </div>
                </div>
                <div class="container" style="margin-top: 5px">
                    <div class="row">
                        <ul class="nav col-md-12">
                            <li class="nav-item">
                                <i class="icofont icofont-ui-calendar"></i> {{article.issueTime}}
                            </li>
                            <li class="nav-item">
                                <i class="icofont icofont-eye-alt" style="color: #ced23f;"></i> {{article.readCount}}
                            </li>
                            <li class="nav-item">
                                <i class="icofont icofont-heart-alt" style="color: #d278c2;"></i> {{article.appluadCount}}
                            </li>
                            <li class="nav-item">
                                <i class="icofont icofont-comment" style="color: #449fdb"></i> {{article.commentCount}}
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        {{/each}}
    </div>
</script>

<script type="text/javascript" src="/frontend/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="/frontend/js/jquery.sPage.js"></script>
<script type="text/javascript" src="/frontend/js/axquery.js"></script>
<script type="text/javascript" src="/frontend/js/template-web.js"></script>
<script type="text/javascript" src="/frontend/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/frontend/layui/layui.all.js"></script>
<script type="text/javascript" src="/frontend/js/static-top.js"></script>

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

    // 分页插件
    function loadPage() {
        $("#articlePage").sPage({
            page: 1,// 当前页码
            total: ${total},// 数据总条数
            pageSize: 15,// 每页显示多少条数据
            showTotal: true,// 是否显示总条数，默认关闭：false
            totalTxt: "共{total}条",// 数据总条数文字描述，{total}为占位符，默认"共{total}条"
            noData: false,// 没有数据时是否显示分页，默认false不显示，true显示第一页
            showSkip: true,// 是否显示跳页，默认关闭：false
            showPN: true,// 是否显示上下翻页，默认开启：true
            prevPage: "上一页",// 上翻页文字描述，默认“上一页”
            nextPage: "下一页",// 下翻页文字描述，默认“下一页”
            backFun: function (page) {
                //点击分页按钮回调函数，返回当前页码
                loadPageData(page);
                $('html,body').animate({scrollTop: 0}, 20);
            }
        });
    }

    // 分页数据
    function loadPageData(page) {
        var pageInfo = {};
        pageInfo.id = ${user.id};
        pageInfo.page = page;
        pageInfo.queryType = $('.paging').attr('queryType');
        Ax.rest('/user/page/data', pageInfo, function (data) {
            var articleListData = {
                articleList : data
            }
            var articleHtml = template('article-tmp', articleListData);
            $('#article-list').empty();
            $('#article-list').append(articleHtml);
            $("#pNum").text(page);
        });
    }

    // 排序按钮点击事项
    $('.article-top .btn-primary').click(function () {
        var btnPrimarys = $('.article-top .btn-primary');
        for (var i=0; i<btnPrimarys.length; i++) {
            $(btnPrimarys[i]).removeClass('btn-secondary');
        }
        $(this).addClass('btn-secondary');
        $('.paging').attr('queryType', $(this).text().trim());
        loadPage();
        loadPageData(1);
        $('html,body').animate({scrollTop: 0}, 20);
    });

    loadPage();
</script>
</html>