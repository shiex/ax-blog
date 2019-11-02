<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>首页</title>
    <link rel="stylesheet" href="frontend/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="frontend/css/icofont.css">

    <style>
        body {
            background-color: #eeeeee;
        }

        .navbar-nav a:hover {
            color: #1E88E5;
        }

        .md-30 {
            margin-top: 40px;
        }

        .blog-slider-section {

        }

        .navbar {
            background-color: #fff;
            height: 70px;
            box-shadow: 0 1px 6px 0px rgba(0, 0, 0, 0.14);
        }

        .blog {
            position: relative;
            background-color: #fff;
            transition: box-shadow .25s;
            border-radius: 2px;
            padding: 20px;
            margin-bottom: 30px;
        }

        .media-object {
            width: 64px;
            height: 64px;
        }

        .carousel {
            height: 400px;
            box-shadow: 0 0 2px 1px rgba(0, 0, 0, 0.14);
        }

        .blog-slider-section .nav-item {
            display: inline-block;
            margin-left: 10px;
        }

        .blog-slider-section .list-group-flush a:hover {
            background-color: #eeeeee;
            color: #1E88E5;
        }

        .list-group li:hover {
            cursor: pointer;
        }

        .xz {
            background-color: #fff;
            color: #1E88E5;
        }

        .blog .nav-item {
            color: #8e8787;
        }

        .blog .nav-item a {
            color: #8e8787;
        }

        .blog .nav-item:hover {
            cursor: auto;
        }
        .l-blue:hover {
            cursor: pointer;
        }

        .article-hot a {
            width: 100%;
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-box-orient: vertical;
            white-space: nowrap;
            padding: 0px;
        }
    </style>
</head>
<body>
<#setting datetime_format='yyyy-MM-dd hh:mm:ss'>
<#include "static_top.ftl">
<div class="blog-slider md-30">
    <div class="container">
        <div id="demo" class="carousel slide" data-ride="carousel">
            <!-- 指示符 -->
            <ul class="carousel-indicators">
                <li data-target="#demo" data-slide-to="0" class="active"></li>
                <li data-target="#demo" data-slide-to="1"></li>
                <li data-target="#demo" data-slide-to="2"></li>
            </ul>

            <!-- 轮播图片 -->
            <div class="carousel-inner h-100 w-100">
                <div class="carousel-item active h-100 w-100">
                    <img class="w-100 h-100" src="frontend/img/lifestyle.jpg">
                </div>
                <div class="carousel-item h-100 w-100">
                    <img class="w-100 h-100" src="frontend/img/lifestyle.jpg">
                </div>
                <div class="carousel-item h-100 w-100">
                    <img class="w-100 h-100" src="frontend/img/fashion.jpg">
                </div>
            </div>

            <!-- 左右切换按钮 -->
            <a class="carousel-control-prev" href="#demo" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#demo" data-slide="next">
                <span class="carousel-control-next-icon"></span>
            </a>

        </div>
    </div>
</div>

<div class="blog-slider-section md-30" style="margin-bottom: 30px">
    <div class="container">
        <div class="row">

            <div class="col-xl-2">
                <#--    分类区域    -->
                <div id="classify-list">
                    <div class="list-group" style="margin-bottom: 15px">
                        <ul class="list-group list-group-flush">
                            <li href="#" class="list-group-item list-group-item-action active disabled">
                                分类列表
                            </li>
                            <#list classifyList as classify >
                                <li onclick="loadClassifyArticle(this)" classifyId="${classify.id?c}"
                                    class="list-group-item list-group-item-action left-li">
                                    ${classify.name}
                                </li>
                            </#list>
                        </ul>
                    </div>
                </div>
                <#--    分类区域    -->
            </div>

            <div class="col-xl-7"style="padding-left: 0px; padding-right: 0px">
                <#--    博客区域    -->
                <div id="article-list" class="article-list">
                    <div class="list-group" style="margin-bottom: 15px">
                        <#list articleList as article>
                            <div class="blog">
                                <div class="media">
                                    <div class="media-left">
                                        <a href="/user/index/${article.user.id?c}">
                                            <img class="media-object" src="${article.user.headPortrait}">
                                        </a>
                                    </div>
                                    <div class="media-body" style="margin-left: 10px">
                                        <h4 class="media-heading">
                                            <a href="/article/read/${article.id?c}" target="_blank" style="color: #444">${article.title}</a>
                                        </h4>
                                        <div style="color: #8e8787">
                                            ${article.synopsis}
                                        </div>
                                    </div>
                                </div>
                                <div class="container" style="margin-top: 10px">
                                    <div class="row">
                                        <ul class="nav col-md-12" style="position: relative">
                                            <li class="nav-item">
                                                <a href="/user/index/${article.user.id?c}" style="color: #444">${article.user.username}</a>
                                            </li>
                                            <li class="nav-item">
                                                <i class="icofont icofont-ui-calendar"></i> ${article.issueTime?datetime}
                                            </li>
                                            <#if article.classify ??>
                                                <li class="nav-item">
                                                    <a class="l-blue" style="color: #096" onclick="loadClassifyArticle(this)" classifyId="${article.classify.id?c}">
                                                        <i class="icofont icofont-label" style="color: #e91e6370;"></i>${article.classify.name}
                                                    </a>
                                                </li>
                                            </#if>
                                            <li class="nav-item">
                                                <i class="icofont icofont-eye-alt" style="color: #ced23f;"></i> ${article.readCount?c}
                                            </li>
                                            <li class="nav-item">
                                                <i class="icofont icofont-heart-alt" style="color: #d278c2;"></i> ${article.appluadCount?c}
                                            </li>
                                            <li class="nav-item">
                                                <i class="icofont icofont-comment" style="color: #449fdb"></i> ${article.commentCount?c}
                                            </li>
                                            <li class="nav-item" style="position: absolute; right: 0px">
                                                <a href="/article/read/${article.id?c}" target="_blank" style="color: #2196F3">
                                                    阅读全文>>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </#list>
                    </div>
                    <div id="articleLoad-btn" style="width: 100%">
                        <#if articleList?size < 30>
                            <button type="button" id="article-btn" page="0" classifyId="0" onclick="loadArticle(this)"
                                    class="btn btn-secondary" style="width: 100%; margin-bottom: 30px">
                                到底啦!!!
                            </button>
                            <#else>
                                <button type="button" id="article-btn" page="0" classifyId="0" onclick="loadArticle(this)"
                                        class="btn btn-secondary" style="width: 100%; margin-bottom: 30px">
                                    点击加载更多博客
                                </button>
                        </#if>
                    </div>
                </div>
                <#--    博客区域    -->
            </div>

            <div class="col-xl-3">
                <#--    热门博客区域  -->
                <div id="blogHot-list">
                    <div class="list-group article-hot" style="margin-bottom: 15px">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item list-group-item-action active disabled"
                                style="color: #1E88E5; background-color: #fff">热门博客排行榜
                            </li>
                            <#list articleHotList as articleHot >
                                <li class="list-group-item">
                                    <a href="/article/read/${articleHot.id?c}" target="_blank"
                                       class="list-group-item list-group-item-action">${articleHot.title}</a>
                                </li>
                            </#list>
                        </ul>
                    </div>
                </div>
                <#--    热门博客区域  -->
            </div>

        </div>
    </div>
</div>
</body>

<!--    分类模板    -->
<script type="text/html" id="classify-tmp">
    <div class="list-group" style="margin-bottom: 15px">
        <ul class="list-group list-group-flush">
            <li href="#" class="list-group-item list-group-item-action active disabled">
                分类列表
            </li>
            {{each classifyList as classify}}
            <li onclick="loadClassifyArticle(this)" classifyId="{{classify.id}}"
                class="list-group-item list-group-item-action left-li">
                {{classify.name}}
            </li>
            {{/each}}
        </ul>
    </div>
</script>
<!--    博客模板    -->
<script type="text/html" id="article-tmp">
    <div class="list-group" style="margin-bottom: 15px">
        {{each articleList as article}}
        <div class="blog">
            <div class="media">
                <div class="media-left">
                    <a href="#">
                        <img class="media-object" src="{{article.user.headPortrait}}">
                    </a>
                </div>
                <div class="media-body" style="margin-left: 10px">
                    <h4 class="media-heading">
                        <a href="/article/read/{{article.id}}" target="_blank" style="color: #444">{{article.title}}</a>
                    </h4>
                    <div style="color: #8e8787">
                        {{article.synopsis}}
                    </div>
                </div>
            </div>
            <div class="container" style="margin-top: 10px">
                <div class="row">
                    <ul class="nav col-md-12" style="position: relative">
                        <li class="nav-item">
                            <a href="#" style="color: #444">{{article.user.username}}</a>
                        </li>
                        <li class="nav-item">
                            <i class="icofont icofont-ui-calendar"></i> {{article.issueTime}}
                        </li>
                        {{if article.classify.name != null}}
                        <li class="nav-item">
                            <a class="l-blue" style="color: #096" onclick="loadClassifyArticle(this)" classifyId="{{article.classify.id}}">
                                <i class="icofont icofont-label" style="color: #e91e6370;"></i>{{article.classify.name}}
                            </a>
                        </li>
                        {{/if}}
                        <li class="nav-item">
                            <i class="icofont icofont-eye-alt" style="color: #ced23f;"></i> {{article.readCount}}
                        </li>
                        <li class="nav-item">
                            <i class="icofont icofont-heart-alt" style="color: #d278c2;"></i> {{article.appluadCount}}
                        </li>
                        <li class="nav-item">
                            <i class="icofont icofont-comment" style="color: #449fdb"></i> {{article.commentCount}}
                        </li>
                        <li class="nav-item" style="position: absolute; right: 0px">
                            <a href="/article/read/{{article.id}}" target="_blank" style="color: #2196F3">
                                阅读全文>>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        {{/each}}
        <div id="articleLoad-btn" style="width: 100%">
            <button type="button" id="article-btn" page="0" classifyId="0" onclick="loadArticle(this)"
                    class="btn btn-secondary" style="width: 100%; margin-bottom: 30px">
                点击加载更多博客
            </button>
        </div>
    </div>
</script>
<!--    热门博客模板   -->
<script type="text/html" id="articleHot-tmp">
    <div class="list-group article-hot" style="margin-bottom: 15px">
        <ul class="list-group list-group-flush">
            <li class="list-group-item list-group-item-action active disabled"
                style="color: #1E88E5; background-color: #fff">热门博客排行榜
            </li>
            {{each articleHotList as articleHot}}
            <li class="list-group-item">
                <a href="/article/read/{{articleHot.id}}" target="_blank"
                   class="list-group-item list-group-item-action">{{articleHot.title}}</a>
            </li>
            {{/each}}
        </ul>
    </div>
</script>


<script type="text/javascript" src="/frontend/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="/frontend/js/axquery.js"></script>
<script type="text/javascript" src="/frontend/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/frontend/js/template-web.js"></script>

<script>

    function loadClassifyArticle(e) {
        var classifyId = $(e).attr('classifyId');
        $('#article-list').empty();
        $('#article-btn').attr('classifyId', classifyId);
        $('html,body').animate({scrollTop: 0}, 10);//回到顶端
        var leftLi = $('.left-li');
        for (var i = 0; i < leftLi.length; i++) {
            $(leftLi[i]).removeClass('xz');
            if ($(leftLi[i]).text().trim() == $(e).text().trim()) {
                $(leftLi[i]).addClass('xz');
            }
        }
        indexInitData(classifyId);
    }

    function loadArticle(e) {
        var page = $(e).attr('page');
        var classifyId = $(e).attr('classifyId');
        if (page > 0) {
            var req = {};
            req.page = page;
            req.id = classifyId;
            Ax.rest('/classify/article/load/data', req, function (data) {
                loadArticleHtml(data.articleList);
                $(e).attr('page', data.page);
                if (data.articleList < 30) {
                    $('#articleLoad-btn').empty();
                    $('#articleLoad-btn').html(
                        "<button  class='btn btn-secondary' style='width: 100%; margin-bottom: 30px'>" +
                        " 到底啦!!!" +
                        "</button>"
                    );
                }
            });
        }
    }

    /*function loadClassifyHtml(data) {
        var classifyData = {
            classifyList: data
        };
        var classifyHtml = template('classify-tmp', classifyData);
        $('#classify-list').append(classifyHtml);
    }*/

    function loadArticleHtml(data) {
        var articleData = {
            articleList: data
        };
        var articleHtml = template('article-tmp', articleData);
        $('#article-list').append(articleHtml);
    }

    /*function loadArticleHotHtml(data) {
        var articleHotData = {
            articleHotList: data
        };
        var articleHotHtml = template('articleHot-tmp', articleHotData);
        $('#blogHot-list').append(articleHotHtml);
    }*/

    function indexInitData(classifyId) {
        Ax.rest('/index/load/data', classifyId, function (data) {
            loadArticleHtml(data.articleList);

            /*if (data.classifyId == 0) {
                loadClassifyHtml(data.classifyList);
                loadArticleHotHtml(data.articleHotList);
            }*/

            if (data.articleList.length >= 30) {
                $('#article-btn').attr('page', 1);
            } else {
                $('#articleLoad-btn').empty();
                $('#articleLoad-btn').html(
                    "<button  class='btn btn-secondary' style='width: 100%; margin-bottom: 30px'>" +
                    " 到底啦!!!" +
                    "</button>"
                );
            }
        });
    }

    window.onload = function () {
        var docWidth;
        var docHeight;
        var classifyDiv = document.getElementById("classify-list"),
            blogHotDiv = document.getElementById("blogHot-list"),
            H1 = 450,
            H2 = 1050,
            Y = blogHotDiv,
            E = classifyDiv
        while (E) {
            H1 += E.offsetTop;
            E = E.offsetParent;
        }
        while (Y) {
            H2 += Y.offsetTop;
            Y = Y.offsetParent;
        }
        // 监听浏览器宽度的改变
        window.onresize = function () {
            docWidth = document.body.clientWidth;
            if (docWidth <= 1200) {
                blogHotDiv.style = "";
                classifyDiv.style = "";
            }
        }
        // 监听浏览器高度的改变
        window.onscroll = function () {
            if (docWidth == null) {
                docWidth = document.body.clientWidth;
            }
            docHeight = document.body.scrollTop || document.documentElement.scrollTop;
            if (docWidth >= 1200) {
                if (docHeight > H2) {
                    blogHotDiv.style = "position:fixed; top:0; width:255px; max-width: 265px";
                } else {
                    blogHotDiv.style = "";
                }
                if (docHeight > H1) {
                    classifyDiv.style = "position:fixed; top:0; width:160px; max-width: 165px";
                } else {
                    classifyDiv.style = "";
                }
            }
        }
    }

    /*indexInitData(0);*/
</script>
</html>