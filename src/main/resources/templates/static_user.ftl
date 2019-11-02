<div class="col-xl-3" style="padding: 0px">

    <#--    博主信息区域   -->
    <#if user ??>
        <div class="left-top">
            <div class="media" style="border-bottom: 1px solid #c5c4c1">
                <div class="media-left">
                    <a href="#">
                        <img class="media-object" src="${user.headPortrait}"
                             style="width: 50px; height: 50px; border-radius: 50%">
                    </a>
                </div>
                <div class="media-body" style="margin-left: 10px">
                    <h6 class="media-heading">
                        <a href="#" style="color: #444">${user.username}</a>
                    </h6>
                    <#if user.attention ??>
                        <a class="attn" attentionId="${user.attention.id?c}"
                           onclick="isAttention(${user.id?c}, this)"
                           style="color: #007bff">取消关注</a>
                    <#else >
                        <a class="attn" attentionId="0" onclick="isAttention(${user.id?c}, this)"
                           style="color: #007bff">关注</a>
                    </#if>
                </div>
            </div>
            <div class="ajn">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link text-dark">博客数量：${user.articleCount?c}</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark">关注：${user.followCount?c}</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark fans-count">粉丝：${user.fansCount?c}</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark">人气值：${user.popularityCount?c}</a>
                    </li>
                </ul>
            </div>
        </div>
    </#if>

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
                            <a class="nav-link text-primary"
                               href="/article/read/${articleHot.id?c}">${articleHot.title}<#t><span class="badge badge-secondary" style="margin-left: 10px">阅读数：${articleHot.readCount?c}</span>
                            </a>
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
                                    <a class="nav-link text-primary" href="/article/read/${articleRecommend.id?c}">${articleRecommend.title}<#t/></a>
                                </li>
                            </#list>
                        </ul>
                    </div>
                </div>
            </#if>
        </#if>
    </div>
</div>