<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>管理员界面</title>
    <link rel="stylesheet" type="text/css" href="../frontend/css/icofont.css">
    <link rel="stylesheet" href="../frontend/layui/css/layui.css">

    <style>
        .form2 {
            display: none;
            margin-top: 20px;
            text-align: right
        }
    </style>
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
                        <dd class="layui-this"><a href="javascript:;">分类管理</a></dd>
                        <dd><a href="/admin/article.html">博客管理</a></dd>
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
                <legend>分类管理</legend>
            </fieldset>

            <div style="padding: 20px; background-color: #F2F2F2;">
                <div class="layui-row layui-col-space15">
                    <div class="layui-col-md12">
                        <div class="site-demo-button" id="classify-btn" style="margin-bottom: 0;">
                            <button data-method="offset" data-type="auto" class="layui-btn layui-btn-primary">添加
                            </button>
                        </div>
                    </div>
                </div>
                <div class="layui-row layui-col-space15" id="classify-list">

                </div>
            </div>
        </div>
    </div>

    <div class="layui-footer">
        © 136290357qq.com --- 阿薛制作
    </div>
</div>

<div class="layui-form form2" id="classify-form" action="">
    <div class="layui-form-item">
        <div class="layui-input-block" style="width: 80%; margin-left: 50px;">
            <input type="text" name="name" required lay-verify="required"
                   placeholder="请输入" autocomplete="off" class="layui-input">
            <button class="layui-btn layui-layer-btn0" lay-submit lay-filter="classify-add" style="margin-top: 10px">
                确定
            </button>
        </div>
    </div>
</div>

<div class="layui-form" id="classify-dialog" lay-filter="classify" action="" style="padding:10px; display: none">
    <div class="layui-form-item" style="display: none">
        <label class="layui-form-label">分类ID及下标</label>
        <div class="layui-input-inline">
            <input type="text" name="index" class="layui-input">
            <input type="text" name="id" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">分类名称</label>
        <div class="layui-input-inline">
            <input type="text" name="name" lay-verify="required" lay-reqtext="分类名称是必填项，岂能为空？"
                   placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="classify-save">保存</button>
        </div>
    </div>
</div>
</body>

<script type="text/javascript" src="../frontend/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="../frontend/js/axquery.js"></script>
<script type="text/javascript" src="../frontend/js/template-web.js"></script>
<script type="text/javascript" src="../frontend/layui/layui.all.js"></script>

<script type="text/html" id="classify-tmp">
    {{each classifyList as classify}}
    <div class="layui-col-md3" index="{{$index}}" id="{{classify.id}}" name="{{classify.name}}">
        <div class="layui-card">
            <div class="layui-card-header">{{classify.name}}</div>
            <div class="layui-card-body" style="text-align: right">
                <div class="layui-form" action="">
                    <button class="layui-btn layui-btn-primary layui-btn-sm" lay-submit lay-filter="classify-dialog">
                        <i class="layui-icon">&#xe642;</i>
                    </button>
                    <button class="layui-btn layui-btn-primary layui-btn-sm" lay-submit lay-filter="classify-delete">
                        <i class="layui-icon"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>
    {{/each}}
</script>

<script>
    var classifyData = {};

    function initClassifyData() {
        Ax.rest('/admin/classify/select', null, function (data) {
            classifyData.classifyList = data;
            loadClassifyHtml();
        });
    }

    function loadClassifyHtml() {
        var classifyHtml = template('classify-tmp', classifyData);
        $('#classify-list').empty();
        $('#classify-list').append(classifyHtml);
    }

    initClassifyData();

    layui.use(['form', 'layer'], function () {
        var $ = layui.jquery,
            layer = layui.layer,
            form = layui.form;

        //触发事件
        var active = {
            offset: function (othis) {
                var type = othis.data('type')
                    , text = othis.text();
                layer.open({
                    type: 1
                    , offset: 'auto'
                    , id: 'classify-btn' + type
                    , title: '输入分类名称'
                    , content: $('#classify-form')
                    , shade: 0
                    , area: ['500px', '170px']
                    , cancel: function () {
                        $('.layui-input').val('');
                    }
                });
            }
        };

        $('#classify-btn .layui-btn').on('click', function () {
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });

        form.on('submit(classify-add)', function (formData) {
            $('.layui-input').val('');
            layer.closeAll();
            var req = formData.field;
            Ax.rest('/admin/classify/add', req, function (data) {
                layer.msg('添加成功!');
                var classifyListData = {
                    classifyList: new Array(data)
                };
                var classifyHtml = template('classify-tmp', classifyListData);
                $('#classify-list').append(classifyHtml);
                classifyData.classifyList.push(data);
            })
            return true;
        });

        form.on('submit(classify-dialog)', function () {
            var classifyEl = $(this).parent().parent().parent().parent();
            var classify = {};
            classify.index = $(classifyEl).attr('index');
            classify.id = $(classifyEl).attr('id');
            classify.name = $(classifyEl).attr('name');
            form.val('classify', classify);
            layer.open({
                type: 1,
                area: '385px',
                title: '分类编辑',
                content: $('#classify-dialog') //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
            });
            return true;
        });

        form.on('submit(classify-save)', function (formData) {
            layer.closeAll();
            var classify = {};
            classify.id = formData.field.id;
            classify.name = formData.field.name;
            Ax.rest('/admin/classify/save', classify, function (data) {
                layer.msg('保存成功!');
                classifyData.classifyList[formData.field.index] = data;
                loadClassifyHtml();
            })
            return true;
        });

        form.on('submit(classify-delete)', function () {
            var classifyEl = $(this).parent().parent().parent().parent();
            var index = $(classifyEl).attr('index');
            var classifyId = $(classifyEl).attr('id');
            Ax.rest('/admin/classify/delete', classifyId, function (data) {
                layer.msg('删除成功');
                $(classifyEl).remove();
                classifyData.classifyList.splice(index, 1);
            })
            return true;
        });

    });

</script>
</html>