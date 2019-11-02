<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>个人中心</title>
    <link rel="stylesheet" href="/frontend/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/frontend/css/icofont.css">

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

        .center {
        }

        .center .center-left {
        }

        .center .center-right {
            position: relative;
            background-color: #fff;
            padding-bottom: 10px;
        }

        .center-right .btn-secondary {
            padding: 2px 4px;
        }

        .center-right .form-control {
            width: 60%;
            position: absolute;
            top: 0px;
            height: 30px;
            right: 80px;
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

        .card-body a {
            color: #fff;
        }

    </style>
</head>
<body>
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
                        <a href="/article/manage" class="list-group-item">博客管理</a>
                        <a href="/label/index" class="list-group-item active disabled">标签分类</a>
                        <a href="#" class="list-group-item">浏览足迹</a>
                    </div>
                </div>
            </div>
            <div class="col-xl-10" style="padding: 10px">
                <div class="center-right">
                    <div class="container">
                        <div class="row" style="padding: 10px;margin: 0px 10px; border-bottom: 1px solid #adb5bd">
                            <div class="col-sm-5" style="margin: 5px 0px">
                                <h5 style="margin: 0px;">- 标签分类 -</h5>
                            </div>
                            <div class="col-sm-7" style="text-align: right; position: relative;margin: 5px 0px">
                                <div class="layui-form">
                                    <input type="text" name="labelName" lay-verify="required"
                                           lay-reqtext="请先输入标签名称"
                                           placeholder="输入标签名称" class="form-control layui-input add-label">
                                    <button type="button" class="btn btn-primary" style="padding: 2px 8px"
                                            lay-submit lay-filter="label-add">
                                        添加
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="row" id="label-list" style="margin-top: 15px; padding: 10px 30px;">
                            <#list labelList as label >
                                <div class="card bg-dark text-white col-sm-12" style="margin-bottom: 10px">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-sm-8">
                                                <a href="/label/list?labelId=${label.id?c}&labelName=${label.labelName}" target="_blank" class="labelName">${label.labelName}</a>
                                            </div>
                                            <div class="col-sm-4" style="text-align: right">
                                                <div class="layui-form" action="" style="display: inline-block">
                                                    <button class="btn btn-secondary"
                                                            lay-submit lay-filter="label-dialog"
                                                            labelId="${label.id?c}" labelName="${label.labelName}">
                                                        编辑
                                                    </button>
                                                </div>
                                                <button type="button" class="btn btn-secondary"
                                                        onclick="deleteLabel(${label.id?c}, this)">
                                                    删除
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </#list>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="layui-form" id="label-dialog" lay-filter="label" action="" style="padding:10px; display: none">
    <div class="layui-form-item" style="display: none">
        <label class="layui-form-label">标签ID</label>
        <div class="layui-input-inline">
            <input type="text" name="id" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" style="padding: 10px">
        <label class="layui-form-label">标签名称</label>
        <div class="layui-input-inline">
            <input type="text" name="labelName" lay-verify="required" lay-reqtext="标签名称是必填项，不能为空哦"
                   placeholder="请输入" autocomplete="off" class="form-control layui-input">
        </div>
    </div>
    <div class="layui-form-item" style="padding: 10px; text-align: right">
        <div class="layui-input-block">
            <button class="btn btn-secondary" style="padding: 2px 4px" lay-submit lay-filter="label-save">
                保存
            </button>
        </div>
    </div>
</div>
</body>

<script type="text/html" id="label-tmp">
    <div class="card bg-dark text-white col-sm-12" style="margin-bottom: 10px">
        <div class="card-body">
            <div class="row">
                <div class="col-sm-8">
                    <a href="/label/list?labelId={{id}}&labelName={{labelName}}" target="_blank">{{labelName}}</a>
                </div>
                <div class="col-sm-4" style="text-align: right">
                    <div class="layui-form" action="" style="display: inline-block">
                        <button class="btn btn-secondary"
                                lay-submit lay-filter="label-dialog"
                                labelId="{{id}}" labelName="{{labelName}}">
                            编辑
                        </button>
                    </div>
                    <button type="button" class="btn btn-secondary"
                            onclick="deleteLabel({{id}}, this)">
                        删除
                    </button>
                </div>
            </div>
        </div>
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
        var labelEl;

        // 添加标签
        form.on('submit(label-add)', function (data) {
            var label = data.field;
            Ax.rest('/label/save', label, function (data) {
                var labelHtml = template('label-tmp', data);
                $('#label-list').append(labelHtml);
                $('.add-label').val('');
                layer.msg('添加成功');
                return false;
            });
        });

        // 弹出编辑框
        form.on('submit(label-dialog)', function () {
            var label = {};
            label.id = $(this).attr('labelId');
            label.labelName = $(this).attr('labelName');
            form.val('label', label);
            layer.open({
                type: 1,
                area: '545px',
                title: '标签编辑',
                content: $('#label-dialog')
            });
            labelEl = $(this);
            return true;
        });

        // 保存编辑
        form.on('submit(label-save)', function (formData) {
            var label = {};
            label.id = formData.field.id;
            label.labelName = formData.field.labelName;
            Ax.rest('/label/save', label, function (data) {
                var labelElRoot = $(labelEl).parent().parent().parent();
                $('.labelName', labelElRoot).text(data.labelName);
                $(labelEl).attr('labelName', data.labelName);
                layer.closeAll();
            })
            return true;
        });

    });

    function deleteLabel(labelId, e) {
        var label = {};
        label.id = labelId;
        Ax.rest('/label/delete', label, function (data) {
            $(e).parent().parent().parent().parent().remove();
            layer('删除成功');
        });
    }
</script>
</html>