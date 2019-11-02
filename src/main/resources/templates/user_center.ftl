<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>个人中心</title>
    <link rel="stylesheet" href="/frontend/layui/css/layui.css">
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
            padding: 20px;
            padding-top: 0px;
        }

        dd {
            margin-left: 15px;
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
                        <a href="/user/center" class="list-group-item active disabled">个人资料</a>
                        <a href="/collect/index" class="list-group-item">我的收藏</a>
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
                    <div class="container" style="padding: 0px;">
                        <div class="row" style="padding: 10px;margin: 0px 10px; border-bottom: 1px solid #adb5bd">
                            <div class="col-sm-5" style="margin: 5px 0px">
                                <h5 style="margin: 0px;">- 个人资料 -</h5>
                            </div>
                        </div>
                        <div class="row" style="margin-top: 10px">
                            <div class="col-xl-2" style="text-align: center">
                                <img src="${user.headPortrait}" class="rounded" alt="Cinque Terre" width="100"
                                     height="100"><br>
                                <button type="button" class="layui-btn" id="uploadFile" style="background-color: #686a6b; margin-top: 10px">
                                    <i class="layui-icon">&#xe67c;</i>修改头像
                                </button>
                            </div>
                            <div class="col-xl-10">
                                <div class="user-data">
                                    <a href="/user/index/${user.id?c}" class="text-success" style="position: absolute; right: 45px">个人主页>></a>
                                    <dl>
                                        <dt>名称</dt>
                                        <dd class="username">${user.username}</dd>
                                        <dt>性别</dt>
                                        <#if user.sex>
                                            <dd class="sex">女</dd>
                                        <#else>
                                            <dd class="sex">男</dd>
                                        </#if>
                                        <dt>联系方式</dt>
                                        <dd class="cellphone">${user.cellphone!''}</dd>
                                        <dt>邮箱</dt>
                                        <dd class="emali">${user.email!''}</dd>
                                        <dt>关注数量</dt>
                                        <dd>${user.followCount}</dd>
                                        <dt>粉丝数量</dt>
                                        <dd>${user.fansCount}</dd>
                                        <dt>博客数量</dt>
                                        <dd>${user.articleCount}</dd>
                                        <dt>个人简介</dt>
                                        <dd class="intro">${user.intro!'无'}</dd>
                                        <dt>注册时间</dt>
                                        <dd>${user.registerTime?date}</dd>
                                    </dl>
                                </div>
                                <div style="height: 30px">
                                    <button type="button" class="btn btn-primary" lay-submit lay-filter="userEdit"
                                            style="position: absolute; right: 45px; bottom: 0px;">编辑资料
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="layui-form" id="user-dialog" action="" lay-filter="user"
     style="background-color: #fff; padding: 10px 0px 10px 30px; display: none">
    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-inline">
            <input type="text" name="username" lay-verify="required" lay-reqtext="用户名不能为空哦"
                   placeholder="请输入用户名" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">手机号</label>
            <div class="layui-input-inline">
                <input type="tel" name="cellphone" lay-verify="phone" autocomplete="off" placeholder="请输入手机号"
                       class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">邮箱</label>
            <div class="layui-input-inline">
                <input type="text" name="email" lay-verify="required|email" autocomplete="off" placeholder="请输入邮箱"
                       class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-inline">
            <input type="radio" name="sex" value="男" title="男">
            <input type="radio" name="sex" value="女" title="女">
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">简介</label>
        <div class="layui-input-inline">
            <textarea name="intro" placeholder="请输入内容" class="layui-textarea" style="width: 410px"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-inline" style="margin-left: 80px">
            <button class="layui-btn" lay-submit lay-filter="save">保存</button>
        </div>
    </div>
</div>
</body>

<script type="text/javascript" src="/frontend/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="/frontend/js/axquery.js"></script>
<script type="text/javascript" src="/frontend/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/frontend/layui/layui.js"></script>

<script>
    layui.use(['upload','form'], function(){
        var upload = layui.upload,
            form = layui.form;

        form.render('radio');

        // 头像上传
        var uploadInst = upload.render({
            elem: '#uploadFile' //绑定元素
            ,url: '/upload/file/user' //上传接口
            ,accept: 'images'
            ,acceptMime: 'image/*'
            ,size: 10 * 1024 * 1024
            ,done: function(res){
                //上传完毕回调
                if (res.errno == 0) {
                    $('.rounded').attr('src', res.imgUrl);
                    $('.top-img').attr('src', res.imgUrl);
                }
            }
            ,error: function(){
                layer.msg('上传图片时发生未知错误');
            }
        });

        form.on('submit(userEdit)', function(data){
            layer.open({
                type: 1,
                area: '585px',
                title: '编辑中',
                content: $('#user-dialog'),
                success: function(layero, index){
                    Ax.rest('/user/edit/data', null, function (data) {
                        data.sex = data.sex == 0?'男':'女';
                        form.val('user', data);
                    })
                }
            });
        });

        form.on('submit(save)', function(data){
            var user = data.field;
            user.sex = data.field.sex == '男'?'0':'1';
            Ax.rest('/user/edit/save', user, function (data) {
                $('.username').text(data.username);
                $('.email').text(data.email);
                $('.cellphone').text(data.cellphone);
                $('.intro').text(data.intro);
                $('.sex').text(data.sex == 0?'男':'女');
                layer.closeAll();
                layer.msg('编辑成功');
            })
        });
    });
</script>
</html>