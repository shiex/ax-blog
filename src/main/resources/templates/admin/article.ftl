<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>博客管理</title>
    <link rel="stylesheet" type="text/css" href="/frontend/css/icofont.css">
    <link rel="stylesheet" href="/frontend/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">阿薛个人博客后台</div>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    贤心
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="/logout">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="javascript:;">管理选项</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/admin/classify.html">分类管理</a></dd>
                        <dd class="layui-this"><a href="javascript:;">博客管理</a></dd>
                        <dd><a href="/admin/user.html">用户管理</a></dd>
                        <dd><a href="/admin/leave.html">留言管理</a></dd>
                        <dd><a href="/admin/img.html">首页图片管理</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="/admin/admin.html">管理员管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="/admin/authorization.html">角色权限管理</a>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <div style="padding: 15px;">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>博客管理</legend>
            </fieldset>
            <table class="layui-hide" id="article" lay-filter="article-table"></table>
        </div>
    </div>

    <div class="layui-footer">
        © 136290357qq.com --- 阿薛制作
    </div>
</div>
</body>

<script type="text/javascript" src="/frontend/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="/frontend/js/axquery.js"></script>
<script type="text/javascript" src="/frontend/js/template-web.js"></script>
<script type="text/javascript" src="/frontend/layui/layui.all.js"></script>

<script type="text/html" id="topDemo">
    <button type="button" class="layui-btn layui-btn-primary layui-btn-sm" lay-event="delete">
        <i class="layui-icon">&#xe640;</i>
    </button>
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script>
    //JavaScript代码区域
    layui.use(['table'], function () {
        var table = layui.table;

        table.render({
            elem: '#article',
            url: '/admin/article/select',
            toolbar: '#topDemo',
            title: '博客数据表',
            cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'id', title: 'ID', width: 70, sort: true, fixed: 'left'}
                , {field: 'title', title: '标题', width: 500}
                , {field: 'appluadCount', title: '点赞量', width: 110, sort: true}
                , {field: 'readCount', title: '阅读量', width: 110, sort: true}
                , {field: 'original', title: '是否原创', width: 100}
                , {field: 'issueTime', title: '发布时间', width: 150}
                , {fixed: 'right', width: 165, align: 'center', toolbar: '#barDemo'}
            ]],
            page: true,
            limit: 10,
            limits: [10, 20, 30, 40, 50]
        });

        //监听头工具栏事件
        table.on('toolbar(article-table)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id)
                , data = checkStatus.data; //获取选中的数据
            switch (obj.event) {
                case 'delete':
                    if (data.length === 0) {
                        layer.msg('请选择一行');
                    } else {
                        layer.msg('删除');
                    }
                    break;
            }
            ;
        });

        //监听行工具事件
        table.on('tool(article-table)', function (obj) {
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var data = obj.data;
            if (layEvent === 'del') {
                layer.confirm('确定删除此篇博客？', function (index) {
                    obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                    layer.close(index);
                    Ax.rest('/admin/article/delete', data.id, function (data) {
                        layer.msg('删除成功');
                    })
                });
            } else if (layEvent === 'edit') {

            } else if (layEvent === 'detail') {
                location.href = "/article/read/" + data.id;
            }
        });
    });

</script>