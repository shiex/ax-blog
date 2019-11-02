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
            margin-bottom: 30px;
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
    <div class="center">
        <div class="container" style="margin-top: 10px">
            <div class="row">
                <#--    左侧区域    -->
                <div class="col-xl-9">
                    <div class="col-sm-12" style="background-color: #444; padding: 13px">
                        <h5 style="margin: 0px; color: #fff">- ${labelName} -</h5>
                    </div>
                    <div id="article-list" class="article-list">
                        <div class="list-group" style="margin-bottom: 10px">
                            <#if labelArticleList ??>
                                <#list labelArticleList as labelArticle >
                                    <div class="blog">
                                        <div class="media">
                                            <div class="media-body">
                                                <h4 class="media-heading" style="font-size: 22px">
                                                    <div class="article-status" style="display: inline-block">
                                                        <#if labelArticle.article.original>
                                                            <span class="badge badge-pill badge-danger">原</span>
                                                        <#else>
                                                            <span class="badge badge-pill badge-success">转</span>
                                                        </#if>
                                                        <#if labelArticle.article.recommend>
                                                            <span class="badge badge-pill badge-success recommend">荐</span>
                                                        </#if>
                                                        <#if labelArticle.article.stick>
                                                            <span class="badge badge-pill badge-primary stick">顶</span>
                                                        </#if>
                                                    </div>
                                                    <a href="/article/read/${labelArticle.article.id?c}"
                                                       class="a">${labelArticle.article.title}</a>
                                                </h4>
                                                <div style="color: #6b6b6b">${labelArticle.article.synopsis}</div>
                                            </div>
                                        </div>
                                        <div class="container" style="margin-top: 5px">
                                            <div class="row">
                                                <ul class="nav col-md-7">
                                                    <li class="nav-item">
                                                        <i class="icofont icofont-ui-calendar"></i>
                                                        ${labelArticle.article.issueTime?datetime}
                                                    </li>
                                                    <li class="nav-item">
                                                        <i class="icofont icofont-eye-alt" style="color: #ced23f;"></i>
                                                        ${labelArticle.article.readCount?c}
                                                    </li>
                                                    <li class="nav-item">
                                                        <i class="icofont icofont-heart-alt"
                                                           style="color: #d278c2;"></i>
                                                        ${labelArticle.article.appluadCount?c}
                                                    </li>
                                                    <li class="nav-item">
                                                        <i class="icofont icofont-comment" style="color: #449fdb"></i>
                                                        ${labelArticle.article.commentCount?c}
                                                    </li>
                                                </ul>
                                                <#if isUser ??>
                                                    <ul class="nav justify-content-end col-md-5 my-btn"
                                                        style="padding-right: 0px">
                                                        <li class="nav-item">
                                                            <div class="layui-form" action=""
                                                                 style="display: inline-block">
                                                                <button class="btn btn-danger" style="padding: 2px 4px"
                                                                        lay-submit lay-filter="label-dialog"
                                                                        labelArticleId="${labelArticle.id?c}">
                                                                    更换标签
                                                                </button>
                                                            </div>
                                                        </li>
                                                        <li class="nav-item">
                                                            <button type="button" class="btn btn-dark" style="padding: 2px 4px"
                                                                    onclick="deleteLabelArticle(${labelArticle.id?c}, this)">
                                                                删除
                                                            </button>
                                                        </li>
                                                    </ul>
                                                </#if>
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
                <#--    右侧区域    -->
                <#include "static_user.ftl">
            </div>
        </div>
    </div>
</div>

<#if isUser ??>
    <div id="label-dialog" style="display: none; padding: 5px">
        <div class="container">
            <div style="border-bottom: 1px solid #eeeeee; padding: 10px; font-size: 20px">
                - 更换标签 -
            </div>
            <div class="layui-form" action="" style="padding: 10px;">
                <div class="layui-form-item" style="display: none">
                    <div class="layui-input-block">
                        <input type="text" name="id" class="layui-input labelArticleId">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block" style="margin-left: 0px">
                        <#list labelList as label >
                            <input type="radio" name="labelId" value="${label.id}" title="${label.labelName}">
                        </#list>
                    </div>
                </div>
                <div class="layui-form-item" style="margin-top: 25px">
                    <div class="layui-input-block" style="text-align: right">
                        <button class="layui-btn" lay-submit lay-filter="formDemo" style="background-color: #6c757d;">
                            确定
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</#if>
</body>

<script type="text/html" id="label-tmp">
    <div class="list-group" style="margin-bottom: 10px">
        {{each labelArticleList as labelArticle}}
        <div class="blog">
            <div class="media">
                <div class="media-body">
                    <h4 class="media-heading" style="font-size: 22px">
                        <div class="article-status">
                            {{if labelArticle.article.original}}
                            <span class="badge badge-pill badge-danger">原</span>
                            {{else}}
                            <span class="badge badge-pill badge-success">转</span>
                            {{/if}}
                            {{if labelArticle.article.recommend}}
                            <span class="badge badge-pill badge-success recommend">荐</span>
                            {{/if}}
                            {{if labelArticle.article.stick}}
                            <span class="badge badge-pill badge-primary stick">顶</span>
                            {{/if}}
                        </div>
                        <a href="/article/read/{{labelArticle.article.id}}"
                           class="a">{{labelArticle.article.title}}</a>
                    </h4>
                    <div style="color: #6b6b6b">{{labelArticle.article.synopsis}}</div>
                </div>
            </div>
            <div class="container" style="margin-top: 5px">
                <div class="row">
                    <ul class="nav col-md-6">
                        <li class="nav-item" style="margin-left: 0px">
                            <i class="icofont icofont-ui-calendar"></i>
                            {{labelArticle.article.issueTime}}
                        </li>
                        <li class="nav-item">
                            <i class="icofont icofont-eye-alt" style="color: #ced23f;"></i>
                            {{labelArticle.article.readCount}}
                        </li>
                        <li class="nav-item">
                            <i class="icofont icofont-heart-alt" style="color: #d278c2;"></i>
                            {{labelArticle.article.appluadCount}}
                        </li>
                        <li class="nav-item">
                            <i class="icofont icofont-comment" style="color: #449fdb"></i>
                            {{labelArticle.article.commentCount}}
                        </li>
                    </ul>
                    <ul class="nav justify-content-end col-md-6 my-btn">
                        <li class="nav-item">
                            <div class="layui-form" action="" style="display: inline-block">
                                <button class="btn btn-danger"
                                        lay-submit lay-filter="label-dialog"
                                        labelArticleId="{{labelArticle.id}}">
                                    更换标签
                                </button>
                            </div>
                        </li>
                        <li class="nav-item">
                            <button type="button" class="btn btn-dark"
                                    onclick="deleteArticle({{labelArticle.article.id}}, this)">
                                删除
                            </button>
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

    layui.use('form', function () {
        var form = layui.form;
        var labelBtn;
        //监听提交
        form.on('submit(formDemo)', function (formData) {
            var labelArticle = formData.field;
            Ax.rest('/label/article/save', labelArticle, function (data) {
                $(labelBtn).parent().parent().parent().parent().parent().parent().remove();
                layer.closeAll();
                layer.msg('已更换至 - [' + data.labelName + ']');
            })
            return false;
        });

        // 弹出编辑框
        form.on('submit(label-dialog)', function () {
            labelBtn = $(this);
            $('.labelArticleId').val($(this).attr('labelArticleId'));
            layer.open({
                type: 1,
                area: '545px',
                title: false,
                content: $('#label-dialog')
            });
            return true;
        });
    });

    function deleteLabelArticle(labelArticleId, e) {
        var labelArticle = {};
        labelArticle.id = labelArticleId;
        Ax.rest('/label/article/delete', labelArticle, function (data) {
            $(e).parent().parent().parent().parent().parent().remove();
        })
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
                var pageInfo = {};
                pageInfo.id = ${labelId?c}
                    pageInfo.page = (page - 1) * 15;
                pageInfo.limit = 15;
                Ax.rest('/label/article/load/data', pageInfo, function (data) {
                    var labelArticleListData = {
                        labelArticleList: data
                    }
                    var labelArticleHtml = template('labelArticle-tmp', labelArticleListData);
                    $('#article-list').empty();
                    $('#article-list').append(labelArticleHtml);
                    $("#pNum").text(page);
                    $('html,body').animate({scrollTop: 0}, 20);
                })
            }
        });
    }

    loadPage();
</script>
</html>