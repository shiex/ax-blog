<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>个人中心</title>
    <link rel="stylesheet" href="/frontend/layui/css/layui.css">
    <link rel="stylesheet" href="/frontend/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/frontend/css/icofont.css">
    <link rel="stylesheet" type="text/css" href="/frontend/css/jquery.sPage.css">

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

        .center .center-left {
        }

        .center .center-right {
            position: relative;
            background-color: #fff;
            padding-bottom: 10px;
        }

        .center-right .article-list {
        }

        .blog i {
            color: #6b6b6b;
        }

        .nav li {
             margin-right: 15px;
         }

        .justify-content-end i {
            margin-right: 0px;
            margin-left: 15px;
        }

        .my-btn button {
            padding: 0px 5px;
        }

        .blog {
            padding: 15px;
            border-bottom: 1px solid #eeeeee;
        }

        .blog:hover {
            background-color: #f5f3f357;
        }

        .blog .article-status {
            display: inline-block;
        }

        .article-bottom .paging {
            width: 100%;
            background-color: #fff;
            padding: 0px 15px;
            line-height: 60px;
        }

        .paging .num {
            height: 50px;
            line-height: 50px;
            text-align: left;
        }

        .paging .demo {
            text-align: left;
        }

        .media a {
            color: #444444;
        }

        .media a:hover {
            color: #449fdb;
        }

        dd {
            margin-left: 15px;
        }

        #label-dialog .layui-form-radio > i:hover, .layui-form-radioed > i {
            color: #c82333;
        }

        #label-dialog .layui-input-block {
            margin-left: 0px;
        }
    </style>
</head>
<body>
<#setting datetime_format='yyyy-MM-dd hh:mm:ss'>
<#include "static_top.ftl">
<div class="center">
    <div class="container">
        <div class="row">
            <div class="col-xl-2" style="padding: 10px">
                <div class="center-left">
                    <div class="list-group">
                        <a href="/user/center" class="list-group-item">个人资料</a>
                        <a href="/collect/index" class="list-group-item">我的收藏</a>
                        <a href="/attention/list/0" class="list-group-item">我的关注</a>
                        <a href="/attention/list/1" class="list-group-item">我的粉丝</a>
                        <a href="/article/manage" class="list-group-item active">博客管理</a>
                        <a href="/label/index" class="list-group-item">标签分类</a>
                        <a href="#" class="list-group-item">浏览足迹</a>
                    </div>
                </div>
            </div>
            <div class="col-xl-10" style="padding: 10px">
                <div class="center-right">
                    <div class="row" style="padding: 10px;margin: 0px 10px; border-bottom: 1px solid #adb5bd">
                        <div class="col-sm-5" style="margin: 5px 0px">
                            <h5 style="margin: 0px;">- 博客管理 -</h5>
                        </div>
                    </div>
                    <div id="article-list" class="article-list" style="margin-top: 15px; padding: 10px 30px;">
                        <div class="list-group" style="margin-bottom: 10px">
                            <#if articleList ??>
                                <#list articleList as article >
                                    <div class="blog">
                                        <div class="media">
                                            <div class="media-body">
                                                <h4 class="media-heading" style="font-size: 22px">
                                                    <div class="article-status">
                                                        <#if article.original>
                                                            <span class="badge badge-pill badge-danger">原</span>
                                                        <#else>
                                                            <span class="badge badge-pill badge-success">转</span>
                                                        </#if>
                                                        <#if article.recommend>
                                                            <span class="badge badge-pill badge-success recommend">荐</span>
                                                        </#if>
                                                        <#if article.stick>
                                                            <span class="badge badge-pill badge-primary stick">顶</span>
                                                        </#if>
                                                    </div>
                                                    <a href="/article/read/${article.id?c}" class="a">${article.title}</a>
                                                </h4>
                                                <div style="color: #6b6b6b">${article.synopsis}</div>
                                            </div>
                                        </div>
                                        <div class="container" style="margin-top: 5px">
                                            <div class="row">
                                                <ul class="nav col-md-7">
                                                    <li class="nav-item label" style="margin: 0px">
                                                        <#if article.label ??>
                                                            <a style="color: #096; margin-right: 15px"
                                                               href="/label/list?labelId=${article.label.id?c}&labelName=${article.label.labelName}" target="_blank">
                                                                <i class="icofont icofont-label"
                                                                   style="color: #e91e6370;"></i>
                                                                ${article.label.labelName}
                                                            </a>
                                                        </#if>
                                                    </li>
                                                    <li class="nav-item" style="margin-left: 0px;">
                                                        <i class="icofont icofont-ui-calendar"></i>
                                                        ${article.issueTime?datetime}
                                                    </li>
                                                    <li class="nav-item">
                                                        <i class="icofont icofont-eye-alt"></i>
                                                        ${article.readCount?c}
                                                    </li>
                                                    <li class="nav-item">
                                                        <i class="icofont icofont-heart-alt"></i>
                                                        ${article.appluadCount?c}
                                                    </li>
                                                    <li class="nav-item">
                                                        <i class="icofont icofont-comment"></i>
                                                        ${article.commentCount?c}
                                                    </li>
                                                </ul>
                                                <ul class="nav justify-content-end col-md-5 my-btn"
                                                    style="padding-right: 0px">
                                                    <#if article.recommend>
                                                        <li class="nav-item">
                                                            <button type="button" class="btn btn-success"
                                                                    isRecommend="0"
                                                                    articleId="${article.id?c}"
                                                                    onclick="isRecommend(this)">
                                                                取消推荐
                                                            </button>
                                                        </li>
                                                    <#else>
                                                        <li class="nav-item">
                                                            <button type="button" class="btn btn-success"
                                                                    isRecommend="1"
                                                                    articleId="${article.id?c}"
                                                                    onclick="isRecommend(this)">
                                                                设为推荐
                                                            </button>
                                                        </li>
                                                    </#if>
                                                    <#if article.stick>
                                                        <li class="nav-item">
                                                            <button type="button" class="btn btn-primary"
                                                                    isStick="0"
                                                                    articleId="${article.id?c}"
                                                                    onclick="isStick(this)">
                                                                取消置顶
                                                            </button>
                                                        </li>
                                                    <#else>
                                                        <li class="nav-item">
                                                            <button type="button" class="btn btn-primary"
                                                                    isStick="1"
                                                                    articleId="${article.id?c}"
                                                                    onclick="isStick(this)">
                                                                置顶
                                                            </button>
                                                        </li>
                                                    </#if>
                                                    <#if article.label ??>
                                                    <#else >
                                                        <li class="nav-item">
                                                            <div class="layui-form" action="" style="display: inline-block">
                                                                <button class="btn btn-danger"
                                                                        lay-submit lay-filter="label-dialog"
                                                                        articleId="${article.id?c}">
                                                                    标签
                                                                </button>
                                                            </div>
                                                        </li>
                                                    </#if>
                                                    <li class="nav-item">
                                                        <a class="btn btn-secondary" style="padding: 0px 5px"
                                                           target="_blank" href="/article/${article.id?c}/edit.html">
                                                            编辑
                                                        </a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <button type="button" class="btn btn-dark"
                                                                onclick="deleteArticle(${article.id?c}, this)">
                                                            删除
                                                        </button>
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
                        <div class="paging">
                            <div id="articlePage" class="demo"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="label-dialog" style="display: none; padding: 5px">
    <div class="container">
        <div style="border-bottom: 1px solid #eeeeee; padding: 10px; font-size: 20px">
            设置标签 --- 只可设置1个对应标签
        </div>
        <div class="layui-form" action="" style="padding: 10px;">
            <div class="layui-form-item" style="display: none">
                <div class="layui-input-block">
                    <input type="text" name="articleId" class="layui-input articleId">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <#if labelList?size != 0>
                        <#list labelList as label >
                            <input type="radio" name="labelId" value="${label.id?c}" title="${label.labelName}">
                        </#list>
                    <#else>
                        <input type="radio" name="labelId" value="0" title="暂无标签" checked>
                    </#if>
                </div>
            </div>
            <div class="layui-form-item" style="margin-top: 25px">
                <div class="layui-input-block" style="text-align: right">
                    <#if labelList?size != 0>
                        <button class="layui-btn" lay-submit lay-filter="formDemo" style="background-color: #6c757d;">
                            添加
                        </button>
                    <#else>
                        <a class="btn btn-secondary" style="padding: 0px 5px"
                           target="_blank" href="/label/index">
                            前往标签管理页面
                        </a>
                    </#if>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

<script type="text/html" id="article-tmp">
    <div class="list-group" style="margin-bottom: 10px">
            {{each articleList as article }}
                <div class="blog">
                    <div class="media">
                        <div class="media-body">
                            <h4 class="media-heading" style="font-size: 22px">
                                <div class="article-status">
                                    {{if article.original}}
                                        <span class="badge badge-pill badge-danger">原</span>
                                    {{else}}
                                        <span class="badge badge-pill badge-success">转</span>
                                    {{/if}}
                                    {{if article.recommend}}
                                        <span class="badge badge-pill badge-success recommend">荐</span>
                                    {{/if}}
                                    {{if article.stick}}
                                        <span class="badge badge-pill badge-primary stick">顶</span>
                                    {{/if}}
                                </div>
                                <a href="/article/read/{{article.id}}" class="a">{{article.title}}</a>
                            </h4>
                            <div style="color: #6b6b6b">{{article.synopsis}}</div>
                        </div>
                    </div>
                    <div class="container" style="margin-top: 5px">
                        <div class="row">
                            <ul class="nav col-md-7">
                                <li class="nav-item label" style="margin: 0px">
                                    {{if article.label }}
                                        <a style="color: #096; margin-right: 15px"
                                           target="_blank" href="/label/{{article.label.id}}.list">
                                            <i class="icofont icofont-label"
                                               style="color: #e91e6370;"></i>
                                            {{article.label.labelName}}
                                        </a>
                                    {{/if}}
                                </li>
                                <li class="nav-item" style="margin-left: 0px;">
                                    <i class="icofont icofont-ui-calendar"></i>
                                    {{article.issueTime}}
                                </li>
                                <li class="nav-item">
                                    <i class="icofont icofont-eye-alt"></i>
                                    {{article.readCount}}
                                </li>
                                <li class="nav-item">
                                    <i class="icofont icofont-heart-alt"></i>
                                   {{article.appluadCount}}
                                </li>
                                <li class="nav-item">
                                    <i class="icofont icofont-comment"></i>
                                    {{article.commentCount}}
                                </li>
                            </ul>
                            <ul class="nav justify-content-end col-md-5 my-btn"
                                style="padding-right: 0px">
                                {{if article.recommend}}
                                    <li class="nav-item">
                                        <button type="button" class="btn btn-success"
                                                isRecommend="0"
                                                articleId="{{article.id}}"
                                                onclick="isRecommend(this)">
                                            取消推荐
                                        </button>
                                    </li>
                                {{else}}
                                    <li class="nav-item">
                                        <button type="button" class="btn btn-success"
                                                isRecommend="1"
                                                articleId="{{article.id}}"
                                                onclick="isRecommend(this)">
                                            设为推荐
                                        </button>
                                    </li>
                                {{/if}}
                                {{if article.stick}}
                                    <li class="nav-item">
                                        <button type="button" class="btn btn-primary"
                                                isStick="0"
                                                articleId="{{article.id}}"
                                                onclick="isStick(this)">
                                            取消置顶
                                        </button>
                                    </li>
                                {{else}}
                                    <li class="nav-item">
                                        <button type="button" class="btn btn-primary"
                                                isStick="1"
                                                articleId="{{article.id}}"
                                                onclick="isStick(this)">
                                            置顶
                                        </button>
                                    </li>
                                {{/if}}
                                {{if article.label == null}}
                                    <li class="nav-item">
                                        <div class="layui-form" action="" style="display: inline-block">
                                            <button class="btn btn-danger"
                                                    lay-submit lay-filter="label-dialog"
                                                    articleId="{{article.id}}">
                                                标签
                                            </button>
                                        </div>
                                    </li>
                                {{/if}}
                                <li class="nav-item">
                                    <a class="btn btn-secondary" style="padding: 0px 5px"
                                       target="_blank" href="/article/{{article.id}}/edit.html">
                                        编辑
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <button type="button" class="btn btn-dark"
                                            onclick="deleteArticle({{article.id}}, this)">
                                        删除
                                    </button>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            {{/each}}
    </div>
    </div>
</script>

<script type="text/javascript" src="/frontend/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="/frontend/js/jquery.sPage.js"></script>
<script type="text/javascript" src="/frontend/js/axquery.js"></script>
<script type="text/javascript" src="/frontend/js/template-web.js"></script>
<script type="text/javascript" src="/frontend/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/frontend/layui/layui.all.js"></script>

<script>

    // 是否推荐，ID为1：推荐，反之取消推荐
    function isRecommend(e) {
        var article = {};
        article.id = $(e).attr('articleId');
        article.recommend = $(e).attr('isRecommend');
        Ax.rest('/article/manage/status/update', article, function (data) {
            var blog = $(e).parent().parent().parent().parent().parent();
            if (article.recommend == 0) {
                $('.recommend', blog).empty();
                $(e).text('设为推荐');
                $(e).attr('isRecommend', 1);
            } else {
                $('.article-status', blog).append('<span class="badge badge-pill badge-success recommend">荐</span>');
                $(e).text('取消推荐');
                $(e).attr('isRecommend', 0);
            }
        });
    }

    // 是否置顶，ID为1：置顶，反之取消置顶
    function isStick(e) {
        var article = {};
        article.id = $(e).attr('articleId');
        article.stick = $(e).attr('isStick');
        Ax.rest('/article/manage/status/update', article, function (data) {
            var blog = $(e).parent().parent().parent().parent().parent();
            if (article.stick == 0) {
                $('.stick', blog).empty();
                $(e).text('置顶');
                $(e).attr('isStick', 1);
            } else {
                $('.article-status', blog).append('<span class="badge badge-pill badge-primary stick">顶</span>');
                $(e).text('取消置顶');
                $(e).attr('isStick', 0);
            }
        });
    }

    // 删除博客
    function deleteArticle(articleId, e) {
        var article = {};
        article.id = articleId;
        Ax.rest("/article/manage/delete", article, function (data) {
            var blog = $(e).parent().parent().parent().parent().parent();
            $(blog).remove();
            layer.msg('删除成功');
        });
    }

    layui.use('form', function () {
        var form = layui.form;
        var labelBtn;
        //监听提交
        form.on('submit(formDemo)', function (formData) {
            var labelArticle = formData.field;
            Ax.rest('/label/article/save', labelArticle, function (data) {
                var labelEl = $(labelBtn).parent().parent().parent().parent();
                $('.label', labelEl).append(
                    '<a style="color: #096; margin-right: 15px"' +
                    'target="_blank" href="/label/' + data.id + 'list">' +
                    '<i class="icofont icofont-label" style="color: #e91e6370;"></i>' +
                    data.labelName +
                    '</a>'
                );
                $(labelBtn).parent().parent().remove();
                layer.closeAll();
                layer.msg('已添加至 - [' + data.labelName + ']');
            })
            return false;
        });

        // 弹出编辑框
        form.on('submit(label-dialog)', function () {
            labelBtn = $(this);
            $('.articleId').val($(this).attr('articleId'));
            layer.open({
                type: 1,
                area: '545px',
                title: false,
                content: $('#label-dialog')
            });
            return true;
        });
    });

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
                var pageInfo = {};
                pageInfo.page = (page - 1) * 15;
                pageInfo.limit = 15;
                Ax.rest('/article/manage/load/data', pageInfo, function (data) {
                    var articleListData = {
                        articleList: data
                    }
                    var articleHtml = template('article-tmp', articleListData);
                    $('#article-list').empty();
                    $('#article-list').append(articleHtml);
                    $("#pNum").text(page);
                    $('html,body').animate({scrollTop: 0}, 20);
                })
            }
        });
    }

    loadPage();
</script>
</html>