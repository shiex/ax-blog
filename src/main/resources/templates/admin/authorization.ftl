<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>管理员界面</title>
    <link rel="stylesheet" type="text/css" href="/frontend/css/icofont.css">
    <link rel="stylesheet" href="/frontend/layui/css/layui.css">

    <style>
        .form2 {
            display: none;
            margin-top: 20px;
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
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="javascript:;">管理选项</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/admin/classify.html">分类管理</a></dd>
                        <dd><a href="/admin/article.html">博客管理</a></dd>
                        <dd><a href="/admin/user.html">用户管理</a></dd>
                        <dd><a href="/admin/leave.html">留言管理</a></dd>
                        <dd><a href="/admin/img.html">首页图片管理</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="/admin/admin.html">管理员管理</a>
                </li>
                <li class="layui-nav-item layui-this">
                    <a href="javascript:;">角色权限管理</a>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <div style="padding: 15px;">

            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>授权管理</legend>
            </fieldset>
            <div style="padding: 20px; background-color: #F2F2F2;">
                <div class="layui-row layui-col-space15">
                    <div class="layui-col-md12">
                        <div class="site-demo-button" id="role-btn" style="margin-bottom: 0; display: inline-block">
                            <button data-method="offset" data-type="auto" class="layui-btn layui-btn-primary">
                                添加角色
                            </button>
                        </div>
                        <div class="site-demo-button" id="permission-btn"
                             style="margin-bottom: 0; display: inline-block">
                            <button data-method="offset" data-type="auto" class="layui-btn layui-btn-primary">
                                添加权限
                            </button>
                        </div>
                        <div class="site-demo-button" id="rolePermission-btn"
                             style="margin-bottom: 0; display: inline-block">
                            <button data-method="offset" data-type="auto" class="layui-btn layui-btn-primary">
                                角色设置权限
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>角色列表</legend>
            </fieldset>
            <div style="padding: 20px; margin-top: 20px; background-color: #F2F2F2;">
                <div class="layui-row layui-col-space15" id="role-list">

                </div>
            </div>

            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>权限列表</legend>
            </fieldset>
            <div style="padding: 20px; margin-top: 20px; background-color: #F2F2F2;">
                <div class="layui-row layui-col-space15" id="permission-list">

                </div>
            </div>

        </div>
    </div>

    <div class="layui-footer">
        © 136290357qq.com --- 阿薛制作
    </div>
</div>

<div class="layui-form form2" id="role-form" action="" style="text-align: right">
    <div class="layui-form-item">
        <div class="layui-input-block" style="width: 80%; margin-left: 50px;">
            <input type="text" name="roleName" required lay-verify="required" placeholder="请输入"
                   autocomplete="off" class="layui-input">
            <button class="layui-btn layui-layer-btn0" lay-submit lay-filter="role-add" style="margin-top: 10px">
                确定
            </button>
        </div>
    </div>
</div>
<div class="layui-form form2" id="permission-form" action="" style="text-align: right">
    <div class="layui-form-item">
        <div class="layui-input-block" style="width: 80%; margin-left: 50px;">
            <input type="text" name="permissionName" required lay-verify="required" placeholder="输入权限名称"
                   autocomplete="off" class="layui-input">
            <input type="text" name="permissionUri" required lay-verify="required|url" placeholder="输入拦截路径"
                   autocomplete="off" class="layui-input" style="margin-top: 10px">
            <button class="layui-btn layui-layer-btn0" lay-submit lay-filter="permission-add" style="margin-top: 10px">
                确定
            </button>
        </div>
    </div>
</div>
<div class="layui-form form2" id="rolePermission-form" action="">
</div>
<div class="layui-form" id="role-dialog" lay-filter="role" action="" style="padding:10px; display: none">
    <div class="layui-form-item" style="display: none">
        <label class="layui-form-label">角色ID及下标</label>
        <div class="layui-input-inline">
            <input type="text" name="index" class="layui-input">
            <input type="text" name="id" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">角色名称</label>
        <div class="layui-input-inline">
            <input type="text" name="roleName" lay-verify="required" lay-reqtext="角色名称是必填项，岂能为空？"
                   placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="role-save">保存</button>
        </div>
    </div>
</div>
<div class="layui-form" id="permission-dialog" lay-filter="permission" action="" style="padding:10px; display: none">
    <div class="layui-form-item" style="display: none">
        <label class="layui-form-label">权限ID及下标</label>
        <div class="layui-input-inline">
            <input type="text" name="index" class="layui-input">
            <input type="text" name="id" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">权限名称</label>
        <div class="layui-input-block">
            <input type="text" name="permissionName" lay-verify="required" lay-reqtext="角色名称是必填项，岂能为空？"
                   placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">拦截路径</label>
        <div class="layui-input-block">
            <input type="text" name="permissionUri" lay-verify="required" lay-reqtext="角色名称是必填项，岂能为空？"
                   placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="permission-save">保存</button>
        </div>
    </div>
</div>

</body>

<script type="text/javascript" src="/frontend/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="/frontend/js/axquery.js"></script>
<script type="text/javascript" src="/frontend/js/template-web.js"></script>
<script type="text/javascript" src="/frontend/layui/layui.all.js"></script>

<script type="text/html" id="role-tmp">
    {{each roleList as role}}
    <div class="layui-col-md3" index="{{$index}}" id="{{role.id}}" roleName="{{role.roleName}}">
        <div class="layui-card">
            <div class="layui-card-header">{{role.roleName}}</div>
            <div class="layui-card-body" style="text-align: right">
                <div class="layui-form" action="">
                    {{if role.id == 1}}
                    <button class="layui-btn layui-btn-disabled layui-btn-sm">
                        <i class="layui-icon">&#xe642;</i>
                    </button>
                    <button class="layui-btn layui-btn-disabled layui-btn-sm">
                        <i class="layui-icon">&#xe640;</i>
                    </button>
                    {{else}}
                    <button class="layui-btn layui-btn-normal layui-btn-sm" lay-submit lay-filter="role-dialog">
                        <i class="layui-icon">&#xe642;</i>
                    </button>
                    <button class="layui-btn layui-btn-normal layui-btn-sm" lay-submit lay-filter="classify-delete">
                        <i class="layui-icon"></i>
                    </button>
                    {{/if}}
                </div>
            </div>
        </div>
    </div>
    {{/each}}
</script>
<script type="text/html" id="permission-tmp">
    {{each permissionList as permission}}
    <div class="layui-col-md4" index="{{$index}}" id="{{permission.id}}"
         permissionName="{{permission.permissionName}}" permissionUri="{{permission.permissionUri}}">
        <div class="layui-card">
            <div class="layui-card-header">权限 ---> [{{permission.permissionName}}]</div>
            <div class="layui-card-header" style="overflow-y:auto">拦截路径：{{permission.permissionUri}}</div>
            <div class="layui-card-body" style="text-align: right">
                <div class="layui-form" action="">
                    {{if permission.id == 1}}
                    <button class="layui-btn layui-btn-disabled layui-btn-sm">
                        <i class="layui-icon">&#xe642;</i>
                    </button>
                    <button class="layui-btn layui-btn-disabled layui-btn-sm">
                        <i class="layui-icon">&#xe640;</i>
                    </button>
                    {{else}}
                    <button class="layui-btn layui-btn-normal layui-btn-sm" lay-submit lay-filter="permission-dialog">
                        <i class="layui-icon">&#xe642;</i>
                    </button>
                    <button class="layui-btn layui-btn-normal layui-btn-sm" lay-submit lay-filter="permission-delete">
                        <i class="layui-icon"></i>
                    </button>
                    {{/if}}
                </div>
            </div>
        </div>
    </div>
    {{/each}}
</script>
<script type="text/html" id="rolePermission-tmp">
    <div class="layui-form-item">
        <label class="layui-form-label">选择权限</label>
        <div class="layui-input-block" style="width: 80%">
            {{each permissionList as permission}}
            <input type="checkbox" name="permission[{{permission.id}}]" value="{{permission.id}}"
                   title="{{permission.permissionName}}">
            {{/each}}
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">选择角色</label>
        <div class="layui-input-block" style="width: 40%">
            <select name="roleId" lay-verify="required">
                <option value=""></option>
                {{each roleList as role}}
                {{if role.id != 1}}
                <option value="{{role.id}}">{{role.roleName}}</option>
                {{/if}}
                {{/each}}
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="rolePermission-add">提交</button>
        </div>
    </div>
</script>

<script>

    layui.use(['form', 'layer'], function () {
        var $ = layui.jquery,
            layer = layui.layer,
            form = layui.form;

        form.render();

        //触发事件
        var role = {
            offset: function (othis) {
                var type = othis.data('type'),
                    text = othis.text();
                layer.open({
                    type: 1,
                    offset: 'auto',
                    id: 'role-btn' + type,
                    title: '输入角色名称',
                    content: $('#role-form'),
                    shade: 0,
                    area: ['500px', '170px'], cancel: function () {
                        $('.layui-input').val('');
                    }
                });
            }
        };

        var permission = {
            offset: function (othis) {
                var type = othis.data('type'),
                    text = othis.text();
                layer.open({
                    type: 1,
                    offset: 'auto',
                    id: 'permission-btn' + type,
                    title: '输入权限名称',
                    content: $('#permission-form'),
                    shade: 0,
                    area: ['500px', '230px'], cancel: function () {
                        $('.layui-input').val('');
                    }
                });
            }
        };

        var rolePermission = {
            offset: function (othis) {
                var type = othis.data('type'),
                    text = othis.text();
                layer.open({
                    type: 1,
                    offset: 'auto',
                    id: 'authorization-btn' + type,
                    title: '角色设置对应权限 --- [若角色已存在则会进行覆盖]',
                    content: $('#rolePermission-form'),
                    shade: 0,
                    area: ['600px', '270px'], cancel: function () {

                    },
                    success: function (layero, index) {
                        loadRolePermissionHtml();
                        form.render();
                    }
                });
            }
        };

        $('#role-btn .layui-btn').on('click', function () {
            var othis = $(this), method = othis.data('method');
            role[method] ? role[method].call(this, othis) : '';
        });

        $('#permission-btn .layui-btn').on('click', function () {
            var othis = $(this), method = othis.data('method');
            permission[method] ? permission[method].call(this, othis) : '';
        });

        $('#rolePermission-btn .layui-btn').on('click', function () {
            var othis = $(this), method = othis.data('method');
            rolePermission[method] ? rolePermission[method].call(this, othis) : '';
        });

        form.on('submit(role-add)', function (formData) {
            $('.role').val('');
            var role = formData.field;
            Ax.rest('/governor/role/add', role, function (data) {
                layer.msg('添加角色成功!');
                var roleListData = {
                    roleList: new Array(data)
                };
                var roleHtml = template('role-tmp', roleListData);
                $('#role-list').append(roleHtml);
            })
            return true;
        });

        form.on('submit(role-dialog)', function () {
            var roleEl = $(this).parent().parent().parent().parent();
            var role = {};
            role.index = $(roleEl).attr('index');
            role.id = $(roleEl).attr('id');
            role.roleName = $(roleEl).attr('roleName');
            form.val('role', role);
            layer.open({
                type: 1,
                area: '385px',
                title: '角色编辑',
                content: $('#role-dialog')
            });
            return true;
        });

        form.on('submit(role-save)', function (formData) {
            layer.closeAll();
            var role = {};
            role.id = formData.field.id;
            role.roleName = formData.field.roleName;
            Ax.rest('/governor/role/save', role, function (data) {
                layer.msg('保存成功!');
                authorizationData.roleList[formData.field.index] = data;
                loadRoleHtml();
            })
            return true;
        });

        form.on('submit(role-delete)', function (formData) {
            var roleEl = $(this).parent().parent().parent();
            var index = $(roleEl).attr('index');
            var roleId = $(roleEl).attr('id');
            Ax.rest('/governor/role/delete', roleId, function (data) {
                layer.msg('删除成功');
                $(roleEl).remove();
                authorizationData.roleList.splice(index, 1);
            })
            return true;
        });

        form.on('submit(permission-add)', function (formData) {
            $('.permission').val('');
            var permission = formData.field;
            Ax.rest('/governor/permission/add', permission, function (data) {
                layer.msg('添加权限成功!');
                var permissionListData = {
                    permissionList: new Array(data)
                };
                var permissionHtml = template('permission-tmp', permissionListData);
                $('#permission-list').append(permissionHtml);
            })
            return true;
        });

        form.on('submit(permission-dialog)', function () {
            var permissionEl = $(this).parent().parent().parent().parent();
            var permission = {};
            permission.index = $(permissionEl).attr('index');
            permission.id = $(permissionEl).attr('id');
            permission.permissionName = $(permissionEl).attr('permissionName');
            permission.permissionUri = $(permissionEl).attr('permissionUri');
            form.val('permission', permission);
            layer.open({
                type: 1,
                area: '545px',
                title: '权限编辑',
                content: $('#permission-dialog')
            });
            return true;
        });

        form.on('submit(permission-save)', function (formData) {
            layer.closeAll();
            var permission = {};
            permission.id = formData.field.id;
            permission.permissionUri = formData.field.permissionUri;
            permission.permissionName = formData.field.permissionName;
            Ax.rest('/governor/permission/save', classify, function (data) {
                layer.msg('保存成功!');
                authorizationData.permissionList[formData.field.index] = data;
                loadPermissionHtml();
            })
            return true;
        });

        form.on('submit(rolePermission-add)', function (formData) {
            var rolePermissions = {};
            var rolePermissionData = formData.field;
            for (var key in rolePermissionData) {
                if (key.indexOf(']') > 0) {
                    var rolePermission = {};
                    rolePermission.roleId = rolePermissionData.roleId;
                    rolePermission.permissionId = rolePermissionData[key];
                    rolePermissions.push(rolePermission);
                }
            }
            Ax.rest('/governor/authorization/save', rolePermissions, function (data) {
                layer.msg('保存成功!');
            });
            return true;
        });
    });

    var authorizationData = {};

    function initAuthorizationData() {
        Ax.rest('/governor/authorization/select', null, function (data) {
            authorizationData.roleList = data.roleList;
            authorizationData.permissionList = data.permissionList;
            loadRoleHtml();
            loadPermissionHtml();
        });
    }

    function loadRoleHtml() {
        var roleHtml = template('role-tmp', authorizationData);
        $('#role-list').empty();
        $('#role-list').append(roleHtml);
    }

    function loadPermissionHtml() {
        var permissionHtml = template('permission-tmp', authorizationData);
        $('#permission-list').empty();
        $('#permission-list').append(permissionHtml);
    }

    function loadRolePermissionHtml() {
        var rolePermissionHtml = template('rolePermission-tmp', authorizationData);
        $('#rolePermission-form').empty();
        $('#rolePermission-form').append(rolePermissionHtml);
    }

    function deletePermission(e) {
        var permissionEl = $(e).parent().parent().parent();
        var index = $(permissionEl).attr('index');
        var permissionId = $(permissionEl).attr('id');
        Ax.rest('/governor/permission/delete', permissionId, function (data) {
            layer.msg('删除成功');
            $(permissionEl).remove();
            authorizationData.permissionList.push(index, 1);
        })
    }

    initAuthorizationData();

    //# sourceURL=authorization.js
</script>