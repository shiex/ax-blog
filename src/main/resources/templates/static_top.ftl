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
                <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
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
                           style="position: absolute; top: 12px; display: inline-block">
                            <img src="${user.headPortrait}" class="top-img" width="30px;" height="30px">
                        </a>
                        <a class="nav-link alert-link" href="/user/index/0" style="display: inline-block; margin-left: 37px">${user.username}</a>
                    </li>
                    <li class="nav-item logined">
                        <a class="nav-link alert-link" href="/logout">退出</a>
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
