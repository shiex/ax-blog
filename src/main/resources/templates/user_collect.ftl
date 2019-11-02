<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>个人中心</title>
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

        .center-right .collect-list{
        }

        .justify-content-end i{
            margin-left: 15px;
        }
        .justify-content-end .isCollect{
            color: #449fdb;
            cursor: pointer;
        }
        .blog{
            padding: 15px;
            border-bottom: 1px solid #eeeeee;
        }
        .blog:hover{
            background-color: #f5f3f357;
        }
        .collect-bottom .paging {
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

        .media a{
            color: #444444;
        }
        .media a:hover{
            color: #449fdb;
        }
        dd {
            margin-left: 15px;
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
                        <a href="javascript:;" class="list-group-item active disabled">我的收藏</a>
                        <a href="/attention/list/0" class="list-group-item">我的关注</a>
                        <a href="/attention/list/1" class="list-group-item">我的粉丝</a>
                        <a href="/article/manage" class="list-group-item">博客管理</a>
                        <a href="/label/index" class="list-group-item">标签分类</a>
                        <a href="#" class="list-group-item">浏览足迹</a>
                    </div>
                </div>
            </div>
            <div class="col-xl-10" style="padding: 10px">
                <div class="center-right">
                    <div class="row" style="padding: 10px;margin: 0px 10px; border-bottom: 1px solid #adb5bd">
                        <div class="col-sm-5" style="margin: 5px 0px">
                            <h5 style="margin: 0px;">- 收藏列表 -</h5>
                        </div>
                    </div>
                    <div id="collect-list" class="collect-list" style="margin-top: 15px; padding: 10px 30px;">
                        <div class="list-group" style="margin-bottom: 10px">
                            <#if collectList ??>
                                <#list collectList as collect >
                                    <div class="blog">
                                        <div class="media">
                                            <div class="media-body">
                                                <h4 class="media-heading">
                                                    <a href="/article/read/${collect.article.id?c}" class="a">
                                                        ${collect.article.title}
                                                    </a>
                                                </h4>
                                                <div style="color: #6b6b6b">${collect.article.synopsis}</div>
                                            </div>
                                        </div>
                                        <div class="container" style="margin-top: 5px">
                                            <div class="row">
                                                <ul class="nav justify-content-end col-md-12" style="text-align: right">
                                                    <li class="nav-item">
                                                        <i class="icofont icofont-ui-calendar"></i>
                                                        ${collect.article.issueTime?datetime}
                                                    </li>
                                                    <li class="nav-item">
                                                        <i class="icofont icofont-eye-alt" style="color: #ced23f;"></i>
                                                        ${collect.article.readCount?c}
                                                    </li>
                                                    <li class="nav-item">
                                                        <i class="icofont icofont-heart-alt" style="color: #d278c2;"></i>
                                                        ${collect.article.appluadCount?c}
                                                    </li>
                                                    <li class="nav-item">
                                                        <i class="icofont icofont-comment" style="color: #449fdb"></i>
                                                        ${collect.article.commentCount?c}
                                                    </li>
                                                    <li class="nav-item isCollect" style="margin-left: 15px"
                                                        collectId="${collect.id?c}"
                                                        articleId="${collect.article.id?c}"
                                                        onclick="isCollect(this)">
                                                        取消收藏
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </#list>
                            </#if>
                        </div>
                    </div>
                    <div class="collect-bottom">
                        <div class="paging">
                            <div id="collectPage" class="demo"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

<script type="text/html" id="collect-tmp">
    <div class="list-group" style="margin-bottom: 10px">
        {{each collectList as collect}}
        <div class="blog">
            <div class="media">
                <div class="media-body">
                    <h4 class="media-heading">
                        <a href="/article/read/{{collect.article.id}}" class="a">
                            {{collect.article.title}}
                        </a>
                    </h4>
                    <div style="color: #6b6b6b">{{collect.article.synopsis}}</div>
                </div>
            </div>
            <div class="container" style="margin-top: 5px">
                <div class="row">
                    <ul class="nav justify-content-end col-md-12" style="text-align: right">
                        <li class="nav-item">
                            <i class="icofont icofont-ui-calendar"></i>
                            {{collect.article.issueTime}}
                        </li>
                        <li class="nav-item">
                            <i class="icofont icofont-eye-alt" style="color: #ced23f;"></i>
                            {{collect.article.readCount}}
                        </li>
                        <li class="nav-item">
                            <i class="icofont icofont-heart-alt" style="color: #d278c2;"></i>
                            {{collect.article.appluadCount}}
                        </li>
                        <li class="nav-item">
                            <i class="icofont icofont-comment" style="color: #449fdb"></i>
                            {{collect.article.commentCount}}
                        </li>
                        <li class="nav-item isCollect"
                            collectId="{{collect.id}}"
                            articleId="{{collect.article.id}}"
                            onclick="isCollect(this)">
                            取消收藏
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
    // 分页插件
    function loadPage() {
        $("#collectPage").sPage({
            page: 1,// 当前页码
            total: ${total},// 数据总条数
            pageSize: 15,// 每页显示多少条数据
            showTotal: false,// 是否显示总条数，默认关闭：false
            totalTxt: "共{total}条",// 数据总条数文字描述，{total}为占位符，默认"共{total}条"
            noData: false,// 没有数据时是否显示分页，默认false不显示，true显示第一页
            showSkip: false,// 是否显示跳页，默认关闭：false
            showPN: true,// 是否显示上下翻页，默认开启：true
            prevPage: "上一页",// 上翻页文字描述，默认“上一页”
            nextPage: "下一页",// 下翻页文字描述，默认“下一页”
            backFun: function (page) {
                //点击分页按钮回调函数，返回当前页码
                var pageInfo = {};
                pageInfo.page = (page - 1) * 15;
                pageInfo.limit = 15;
                Ax.rest('/collect/load/data', pageInfo, function (data) {
                    var collectListData = {
                        collectList:data
                    }
                    var collectHtml = template('collect-tmp', collectListData);
                    $('#collect-list').empty();
                    $('#collect-list').append(collectHtml);
                    $("#pNum").text(page);
                    $('html,body').animate({scrollTop: 0}, 20);
                })
            }
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

    loadPage();
</script>
</html>