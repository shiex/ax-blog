<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>留言页面</title>
    <link rel="stylesheet" type="text/css" href="/frontend/css/leave.css">
    <link rel="stylesheet" type="text/css" href="/frontend/css/icofont.css">
    <link rel="stylesheet" href="/frontend/bootstrap/css/bootstrap.min.css">

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

        .leave-img {
            background: #eeeeee;
            margin-top: 5px;
        }

        .leave {
            box-shadow: 0 -1px 6px 0px rgba(0, 0, 0, 0.14);
            padding: 30px 0px;
            background-color: #fff;
        }
        .carousel-inner img{
            width: 100%;
        }
        .media {
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 1px solid #eeeeee;
        }
        .media img{
            width: 50px;
            height: 50px;
        }
        .media .media-body{
            margin-left: 10px;
        }
        #vcomments{
            padding: 15px;
        }
        .vwrap{
            box-shadow: 0 1px 6px 0px rgba(0, 0, 0, 0.14);
            background-color: #fff;
        }
        .vcard{
            border-bottom: 1px solid #eeeeee;
        }
        .vh{
            margin-bottom: 15px;
        }
        .vquote{
            background-color: #eeeeee;
        }
        .vat{
            margin-right: 25px;
        }
        .info {
            display: none;
        }
    </style>
</head>
<body>
<#setting datetime_format='yyyy-MM-dd hh:mm:ss'>
<nav class="navbar navbar-expand-lg navbar-light border-bottom">
    <div class="container">
        <a class="navbar-brand" href="/">首页</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent" style="z-index: 1000;">
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
            <ul class="navbar-nav justify-content-end" style="margin-left: 15px">
                <li class="nav-item">
                    <a class="nav-link alert-link" href="/admin/classify.html">后台管理<span
                                class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link alert-link" href="/article/issue.html">发布博客<span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link alert-link" href="/notice/index">公告</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link alert-link" href="/leave/index">留言板</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link alert-link" href="#">关于作者</a>
                </li>
                <#if user ??>
                    <li class="nav-item dropdown center">
                        <a class="nav-link dropdown-toggle alert-link" href="#" id="navbarDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            个人中心
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="/user/center">进入中心</a>
                            <a class="dropdown-item" href="/user/index/0">个人主页</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="/article/manage">博客管理</a>
                            <a class="dropdown-item" href="/user/center/account">账号设置</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="/collect/index">我的收藏</a>
                            <a class="dropdown-item" href="/attention/list/0">我的关注</a>
                            <a class="dropdown-item" href="/label/index">标签分类</a>
                            <a class="dropdown-item" href="/user/center/footprint">我的足迹</a>
                        </div>
                    </li>
                    <li class="nav-item logined">
                        <a class="nav-link alert-link" href="/user/index/0"
                           style="position: absolute; top: -2px; display: inline-block">
                            <img src="${user.headPortrait}" width="30px;" height="30px">
                        </a>
                        <a class="nav-link alert-link" href="/user/index/0" style="display: inline-block; margin-left: 37px">${user.username}</a>
                        <a class="nav-link alert-link" href="/logout" style="display: inline-block;">退出</a>
                    </li>
                <#else>
                    <li class="nav-item">
                        <a class="nav-link alert-link" href="/login.html">登录</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link alert-link" href="/register.html">注册</a>
                    </li>
                </#if>
            </ul>
        </div>
    </div>
</nav>
    <div class="leave-img">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="demo-wrapper">
                        <ul class="portfolio-items">
                            <li class="item">
                                <figure>
                                    <div class="view"> <img src="/frontend/img/a1.png" /> </div>
                                    <figcaption>
                                        <p><span> <a href="#">TheTwo and The Bubbles</a></span></p>
                                        <p><span>By Vlad Gerasimov</span></p>
                                    </figcaption>
                                </figure>
                                <div class="date"> 2005</div>
                            </li>
                            <li class="item">
                                <figure>
                                    <div class="view"> <img src="/frontend/img/a2.png" /> </div>
                                    <figcaption>
                                        <p><span> <a href="#"> Christmas Ice Skating</a></span></p>
                                        <p><span>By Vlad Gerasimov</span></p>
                                    </figcaption>
                                </figure>
                                <div class="date"> 2008</div>
                            </li>
                            <li class="item">
                                <figure>
                                    <div class="view"> <img src="/frontend/img/a3.png" /> </div>
                                    <figcaption>
                                        <p><span> <a href="#"> Love Knows No Boundaries</a></span></p>
                                        <p><span>By Vlad Gerasimov</span></p>
                                    </figcaption>
                                </figure>
                                <div class="date"> 2008</div>
                            </li>
                            <li class="item">
                                <figure>
                                    <div class="view"> <img src="/frontend/img/a4.png" /> </div>
                                    <figcaption>
                                        <p><span><a href="#">Sandal</a></span></p>
                                        <p><span>By Vlad Gerasimov </span></p>
                                    </figcaption>
                                </figure>
                                <div class="date"> 2009</div>
                            </li>
                            <li class="item">
                                <figure>
                                    <div class="view"> <img src="/frontend/img/a5.png" /> </div>
                                    <figcaption>
                                        <p><span><a href="#">Skiing</a></span></p>
                                        <p><span>By Vlad Gerasimov</span></p>
                                    </figcaption>
                                </figure>
                                <div class="date"> 2004</div>
                            </li>
                            <li class="item">
                                <figure>
                                    <div class="view"> <img src="/frontend/img/a6.png" /> </div>
                                    <figcaption>
                                        <p><span><a href="#">TheKnight and The Lady</a></span></p>
                                        <p><span>By Vlad Gerasimov</span></p>
                                    </figcaption>
                                </figure>
                                <div class="date"> 2009</div>
                            </li>
                            <li class="item">
                                <figure>
                                    <div class="view"> <img src="/frontend/img/a7.png" /> </div>
                                    <figcaption>
                                        <p><span><a href="#">Friends</a></span></p>
                                        <p><span>By Vlad Gerasimov</span></p>
                                    </figcaption>
                                </figure>
                                <div class="date"> 2008</div>
                            </li>
                            <li class="item">
                                <figure>
                                    <div class="view"> <img src="/frontend/img/a8.png" /> </div>
                                    <figcaption>
                                        <p><span><a href="#">Coiffure</a></span></p>
                                        <p><span>By Vlad Gerasimov</span></p>
                                    </figcaption>
                                </figure>
                                <div class="date"> 2004</div>
                            </li>
                            <li class="item">
                                <figure>
                                    <div class="view"> <img src="/frontend/img/a1.png" /> </div>
                                    <figcaption>
                                        <p><span><a href="#">Get a Mac</a></span></p>
                                        <p><span>By Vlad Gerasimov</span></p>
                                    </figcaption>
                                </figure>
                                <div class="date"> 2007</div>
                            </li>
                            <li class="item">
                                <figure>
                                    <div class="view"> <img src="/frontend/img/a2.png" /> </div>
                                    <figcaption>
                                        <p><span><a href="#">Connection</a></span></p>
                                        <p><span>By Vlad Gerasimov </span></p>
                                    </figcaption>
                                </figure>
                                <div class="date"> 2006</div>
                            </li>
                            <li class="item">
                                <figure>
                                    <div class="view"> <img src="/frontend/img/a3.png" /> </div>
                                    <figcaption>
                                        <p><span> <a href="#">Alice,Her Dragon, and The Christmas Tree</a></span></p>
                                        <p><span>By Vlad Gerasimov </span></p>
                                    </figcaption>
                                </figure>
                                <div class="date"> 2011</div>
                            </li>
                            <li class="item">
                                <figure>
                                    <div class="view"> <img src="/frontend/img/a4.png" /> </div>
                                    <figcaption>
                                        <p><span><a href="#">Inseparable</a></span></p>
                                        <p><span>By Vlad Gerasimov </span></p>
                                    </figcaption>
                                </figure>
                                <div class="date"> 2009</div>
                            </li>
                            <li class="item">
                                <figure>
                                    <div class="view"> <img src="/frontend/img/a5.png" /> </div>
                                    <figcaption>
                                        <p><span><a href="#">Pregnant</a></span></p>
                                        <p><span>By Vlad Gerasimov </span></p>
                                    </figcaption>
                                </figure>
                                <div class="date"> 2006</div>
                            </li>
                            <li class="item">
                                <figure>
                                    <div class="view"> <img src="/frontend/img/a6.png" /> </div>
                                    <figcaption>
                                        <p><span><a href="#">ChristmasTree</a></span></p>
                                        <p><span>By Vlad Gerasimov </span></p>
                                    </figcaption>
                                </figure>
                                <div class="date"> 2009</div>
                            </li>
                            <li class="item">
                                <figure>
                                    <div class="view"> <img src="/frontend/img/a7.png" /> </div>
                                    <figcaption>
                                        <p><span> <a href="#">TheTwo and The Mouse</a></span></p>
                                        <p><span>By Vlad Gerasimov </span></p>
                                    </figcaption>
                                </figure>
                                <div class="date"> 2005</div>
                            </li>
                            <li class="item">
                                <figure>
                                    <div class="view"> <img src="/frontend/img/a8.png" /> </div>
                                    <figcaption>
                                        <p><span><a href="#">Punctuation</a></span></p>
                                        <p><span>By Vlad Gerasimov </span></p>
                                    </figcaption>
                                </figure>
                                <div class="date"> 2006</div>
                            </li>
                            <li class="item">
                                <figure>
                                    <div class="view"> <img src="/frontend/img/a1.png" /> </div>
                                    <figcaption>
                                        <p><span><a href="#"> Internet Cafe</a></span></p>
                                        <p><span>By Vlad Gerasimov </span></p>
                                    </figcaption>
                                </figure>
                                <div class="date"> 2012</div>
                            </li>
                            <li class="item">
                                <figure>
                                    <div class="view"> <img src="/frontend/img/a2.png" /> </div>
                                    <figcaption>
                                        <p><span> <a href="#"> Raring Ringtail</a></span></p>
                                        <p><span>By Vlad Gerasimov </span></p>
                                    </figcaption>
                                </figure>
                                <div class="date"> 2013</div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="leave">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div id="vcomments"></div>
                </div>
            </div>
        </div>
    </div>
</body>

<script src="//cdn1.lncld.net/static/js/3.0.4/av-min.js"></script>
<script src='//unpkg.com/valine/dist/Valine.min.js'></script>
<script type="text/javascript" src="/frontend/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="/frontend/js/modernizr-1.5.min.js"></script>
<script type="text/javascript" src="/frontend/js/jquery.mousewheel.js"></script>
<script type="text/javascript" src="/frontend/js/scripts.js"></script>
<script type="text/javascript" src="/frontend/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/frontend/js/static-top.js"></script>

<script>
    new Valine({
        av: AV,
        el: '#vcomments',
        appId: 'BqmC3k0WP9U8NVzhF8jfygD5-gzGzoHsz',
        appKey: 'LQ16E9N0IzFpzVJVK8VMmbv9',
        placeholder: 'ヾﾉ≧∀≦)o来啊，快活啊!',
        avatar:'monsterid'
    })
</script>
</html>