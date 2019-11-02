<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>公告页面</title>
    <link rel="stylesheet" href="/frontend/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/frontend/css/icofont.css">

    <style>
        body {
            margin: 0px;
            padding: 0px;
        }

        .navbar-expand-lg {
            background-color: #fff;
            height: 70px;
            box-shadow: 0 1px 6px 0px rgba(0, 0, 0, 0.14);
        }

        .notice {
            padding: 2em 0;
            background: #fff;
        }

        a:hover, a:focus {
            text-decoration: none;
            outline: none;
        }

        #accordion:before {
            content: "";
            width: 1px;
            height: 80%;
            background: #550527;
            position: absolute;
            top: 20px;
            left: -26px;
            bottom: 20px;
        }

        #accordion .panel {
            border: none;
            border-radius: 0;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.15);
            margin-bottom: 12px;
            position: relative;
        }

        #accordion .panel:before {
            content: "";
            width: 2px;
            height: 100%;
            background: linear-gradient(to bottom, #688e26 0%, #ff816a 100%);
            position: absolute;
            top: 0;
            left: -2px;
        }

        #accordion .panel-heading {
            padding: 0;
            background: #fff;
            position: relative;
        }

        #accordion .panel-heading:before {
            content: "";
            width: 15px;
            height: 15px;
            border-radius: 50px;
            background: #fff;
            border: 1px solid #550527;
            position: absolute;
            top: 50%;
            left: -48px;
            transform: translateY(-50%);
        }

        #accordion .panel-title a {
            display: block;
            padding: 15px 55px 15px 30px;
            font-size: 20px;
            font-weight: 600;
            color: #550527;
            border: none;
            margin: 0;
            position: relative;
        }

        /*#accordion .panel-title a:before,
        #accordion .panel-title a.collapsed:before {
            content: "\f068";
            font-family: fontawesome;
            width: 25px;
            height: 25px;
            line-height: 25px;
            border-radius: 50%;
            font-size: 15px;
            font-weight: normal;
            color: #688e26;
            text-align: center;
            border: 1px solid #688e26;
            position: absolute;
            top: 50%;
            right: 25px;
            transform: translateY(-50%);
            transition: all 0.5s ease 0s;
        }
*/
       /* #accordion .panel-title a.collapsed:before {
            content: "\f067";
        }*/

        #accordion .panel-body {
            padding: 0 30px 15px;
            border: none;
            font-size: 14px;
            color: #305275;
            line-height: 28px;
        }
    </style>
</head>
<body>
<#setting datetime_format='yyyy-MM-dd hh:mm:ss'>
<#include "static_top.ftl">
    <div class="notice">
        <div class="container">
            <div class="row">
                <div class="col-md-offset-3 col-md-11" style="margin: auto">
                    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                        <div class="panel panel-default" style="cursor: cell">
                            <div class="panel-heading" role="tab" id="headingOne" style="background-color: #444444">
                                <h4 class="panel-title">
                                    <a role="button" aria-expanded="true" aria-controls="collapseOne" style="color: #fff">
                                        <i class="icofont icofont-license" style="color: #ced23f; margin-right: 10px"></i>
                                        公告区 --- 期待您的关注
                                    </a>
                                </h4>
                            </div>
                        </div>

                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingOne">
                                <h4 class="panel-title">
                                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne"
                                       aria-expanded="true" aria-controls="collapseOne">
                                        <i class="icofont icofont-license" style="color: #ced23f; margin-right: 10px"></i>
                                        Section 1
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel"
                                 aria-labelledby="headingOne">
                                <div class="panel-body">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent nisl lorem,
                                        dictum id pellentesque at, vestibulum ut arcu. Curabitur erat libero, egestas eu
                                        tincidunt ac, rutrum ac justo. Vivamus condimentum laoreet lectus, blandit
                                        posuere tortor aliquam vitae. Curabitur molestie eros. </p>
                                </div>
                            </div>
                        </div>

                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingTwo">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                                       href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                        <i class="icofont icofont-license" style="color: #ced23f; margin-right: 10px"></i>
                                        Section 2
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel"
                                 aria-labelledby="headingTwo">
                                <div class="panel-body">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent nisl lorem,
                                        dictum id pellentesque at, vestibulum ut arcu. Curabitur erat libero, egestas eu
                                        tincidunt ac, rutrum ac justo. Vivamus condimentum laoreet lectus, blandit
                                        posuere tortor aliquam vitae. Curabitur molestie eros. </p>
                                </div>
                            </div>
                        </div>

                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingThree">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                                       href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                        <i class="icofont icofont-license" style="color: #ced23f; margin-right: 10px"></i>
                                        Section 3
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseThree" class="panel-collapse collapse" role="tabpanel"
                                 aria-labelledby="headingThree">
                                <div class="panel-body">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent nisl lorem,
                                        dictum id pellentesque at, vestibulum ut arcu. Curabitur erat libero, egestas eu
                                        tincidunt ac, rutrum ac justo. Vivamus condimentum laoreet lectus, blandit
                                        posuere tortor aliquam vitae. Curabitur molestie eros. </p>
                                </div>
                            </div>
                        </div>

                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingThree">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                                       href="#collapse4" aria-expanded="false" aria-controls="collapse4">
                                        <i class="icofont icofont-license" style="color: #ced23f; margin-right: 10px"></i>
                                        Section 3
                                    </a>
                                </h4>
                            </div>
                            <div id="collapse4" class="panel-collapse collapse" role="tabpanel"
                                 aria-labelledby="collapse4">
                                <div class="panel-body">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent nisl lorem,
                                        dictum id pellentesque at, vestibulum ut arcu. Curabitur erat libero, egestas eu
                                        tincidunt ac, rutrum ac justo. Vivamus condimentum laoreet lectus, blandit
                                        posuere tortor aliquam vitae. Curabitur molestie eros. </p>
                                </div>
                            </div>
                        </div>

                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingThree">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                                       href="#collapse5" aria-expanded="false" aria-controls="collapse5">
                                        <i class="icofont icofont-license" style="color: #ced23f; margin-right: 10px"></i>
                                        Section 3
                                    </a>
                                </h4>
                            </div>
                            <div id="collapse5" class="panel-collapse collapse" role="tabpanel"
                                 aria-labelledby="collapse5">
                                <div class="panel-body">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent nisl lorem,
                                        dictum id pellentesque at, vestibulum ut arcu. Curabitur erat libero, egestas eu
                                        tincidunt ac, rutrum ac justo. Vivamus condimentum laoreet lectus, blandit
                                        posuere tortor aliquam vitae. Curabitur molestie eros. </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>


<script type="text/javascript" src="/frontend/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="/frontend/js/axquery.js"></script>
<script type="text/javascript" src="/frontend/js/template-web.js"></script>
<script type="text/javascript" src="/frontend/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/frontend/js/static-top.js"></script>

<script>

</script>
</html>