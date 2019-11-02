<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>发布博客</title>
    <link rel="stylesheet" href="/frontend/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/frontend/layui/css/layui.css">
    <link rel="stylesheet" href="/frontend/wangEditor/release/wangEditor.min.css">
    <style>
        body {
            margin: 0px;
            padding: 0px;
        }

        .navbar {
            background-color: #fff;
            height: 70px;
            box-shadow: 0 1px 6px 0px rgba(0, 0, 0, 0.14);
        }

        .article-add {
        }

        .article-add .article-con {
            margin: auto;
        }

        .layui-form-item {
            width: 90%;
            margin: auto;
        }

        .layui-input-block {
            margin: 15px 0px;
        }

        #editor img {
            max-width: 500px;
            max-height: 500px;
        }

        #article-dialog {
            display: none;
            padding: 40px;
        }
    </style>
</head>

<body>
<#include "static_top.ftl">
<div class="article-add" style="margin: 20px 0px">
    <div class="container">
        <div class="row">
            <div class="layui-form" lay-filter="issue-blog" action="" style="width: 100%">
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <#if article ??>
                            <input type="text" name="id" class="layui-input" value="${article.id?c}">
                            <input type="text" name="title" required lay-verify="required" lay-reqtext="标题不得为空"
                                   style="padding: 6px; height: 45px; font-size: 22px"
                                   placeholder="请输入标题，限100字" autocomplete="off" class="layui-input"
                                   value="${article.title}">
                        <#else >
                            <input type="text" name="title" required lay-verify="required" lay-reqtext="标题不得为空"
                                   style="padding: 6px; height: 45px; font-size: 22px"
                                   placeholder="请输入标题，限100字" autocomplete="off" class="layui-input">
                        </#if>

                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <div class="layui-input-block">
                        <div class="container" style="padding: 0px">
                            <div class="row" style="padding: 0px">
                                <div id="editor" class="col-md-12">
                                    <#if article ??>
                                        <p>${article.content}</p>
                                    </#if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block" id="classify-list" style="width: 200px; display: inline-block">
                        <select name="classifyId" lay-verify="required" lay-reqtext="请先选择分类">
                            <option value="">选择分类</option>
                            <#list classifyList as classify>
                                <#if classify.id == classifyId>
                                    <option value="${classify.id?c}" selected>${classify.name}</option>
                                <#else>
                                    <option value="${classify.id?c}">${classify.name}</option>
                                </#if>
                            </#list>
                        </select>
                    </div>
                    <#if labelList?? >
                        <div class="layui-input-block" id="label-list"
                             style="width: 200px; display: inline-block; margin-left: 20px">
                            <select name="labelId">
                                <option value="">选择标签</option>
                                <#list labelList as label>
                                    <#if label.id == labelId>
                                        <option value="${label.id?c}" selected>${label.labelName}</option>
                                    <#else>
                                        <option value="${label.id?c}">${label.labelName}</option>
                                    </#if>
                                </#list>
                            </select>
                        </div>
                    </#if>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <#if article ??>
                            <button class="layui-btn" lay-submit lay-filter="saveArticle">保存修改</button>
                        <#else>
                            <button class="layui-btn" lay-submit lay-filter="saveArticle">发布博客</button>
                        </#if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="article-dialog">
    <div class="container">
        <div class="list-group">
            <a href="#" class="list-group-item list-group-item-action article-look" style="color: #ca984e">查看博客</a>
            <a href="/article/issue.html" class="list-group-item list-group-item-action" style="color: #748fcc">继续发布</a>
            <a href="/aricle/manage" class="list-group-item list-group-item-action" style="color: #dc6565">管理博客</a>
        </div>
    </div>
</div>
</body>

<script type="text/javascript" src="/frontend/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="/frontend/js/axquery.js"></script>
<script type="text/javascript" src="/frontend/js/template-web.js"></script>
<script type="text/javascript" src="/frontend/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/frontend/layui/layui.all.js"></script>
<script type="text/javascript" src="/frontend/wangEditor/release/wangEditor.js"></script>
<script type="text/javascript" src="/frontend/js/static-top.js"></script>

<script>
    var E = window.wangEditor;
    var editor = new E('#editor');
    // 自定义菜单配置
    editor.customConfig.menus = [
        'head',  // 标题
        'bold',  // 粗体
        'fontSize',  // 字号
        'fontName',  // 字体
        'italic',  // 斜体
        'underline',  // 下划线
        'strikeThrough',  // 删除线
        'foreColor',  // 文字颜色
        'backColor',  // 背景颜色
        'link',  // 插入链接
        'list',  // 列表
        'justify',  // 对齐方式
        'quote',  // 引用
        'image',  // 插入图片
        'table',  // 表格
        'code',  // 插入代码
        'undo',  // 撤销
        'redo'  // 重复
    ]

    editor.customConfig.zIndex = 0;
    editor.customConfig.showLinkImg = false;
    editor.customConfig.pasteFilterStyle = false;

    editor.customConfig.uploadImgMaxSize = 10 * 1024 * 1024;
    editor.customConfig.uploadFileName = 'file';
    editor.customConfig.uploadImgServer = '/upload/file/article';
    editor.customConfig.uploadImgHooks = {
        before: function (xhr, editor, files) {
            // 图片上传之前触发
            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，files 是选择的图片文件

            // 如果返回的结果是 {prevent: true, msg: 'xxxx'} 则表示用户放弃上传
            // return {
            //     prevent: true,
            //     msg: '放弃上传'
            // }
        },
        success: function (xhr, editor, result) {
            layer.msg('图片上传成功');
        },
        fail: function (xhr, editor, result) {
            // 图片上传并返回结果，但图片插入错误时触发
            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，result 是服务器端返回的结果
        },
        error: function (xhr, editor) {
            // 图片上传出错时触发
            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象
        },
        timeout: function (xhr, editor) {
            // 图片上传超时时触发
            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象
        },
        // 如果服务器端返回的不是 {errno:0, data: [...]} 这种格式，可使用该配置
        // （但是，服务器端返回的必须是一个 JSON 格式字符串！！！否则会报错）
        customInsert: function (insertImg, result, editor) {
            // 图片上传成功回调事件
            insertImg(result.imgUrl);

            // result 必须是一个 JSON 格式字符串！！！否则报错
        }
    }

    editor.create();

    layui.use('form', function () {
        var form = layui.form,
            layer = layui.layer;

        form.render('select');

        //监听提交
        form.on('submit(saveArticle)', function (data) {
            var editorText = editor.txt.text();
            if (editorText.length <= 0 && editorText == '') {
                layer.msg('请先输入内容');
                return true;
            } else {
                var num = Math.floor(Math.random() * 100 + 100);
                var req = {
                    title : data.field.title,
                    classifyId : data.field.classifyId,
                    content : editor.txt.html(),
                    synopsis : editorText.substring(0, num) + "...",
                    label : {
                        id : data.field.labelId
                    }
                }
                Ax.rest("/article/save", req, function (data) {
                    layer.msg('发布成功!');
                    layer.open({
                        type: 1,
                        title: false,
                        area: '385px',
                        content: $('#article-dialog'), // 这里content是一个DOM
                        success: function (layero, index) {
                            $('.article-look', layero).attr('href', data);
                        },
                        cancel: function (index, layero) {
                            location.reload();
                            return false;
                        }
                    });
                });
            }
            return false;
        });

    });
</script>

</html>