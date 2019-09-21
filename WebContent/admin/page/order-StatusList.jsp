<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>所有订单</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- page style -->
  <style>

  </style>
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="admin/css/bootstrap/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="admin/css/font-awesome/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="admin/css/Ionicons/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="admin/css/datatables.net-bs/dataTables.bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="admin/css/AdminLTE/AdminLTE.min.css">
  <!-- AdminLTE Skin -->
  <link rel="stylesheet" href="admin/css/AdminLTE/skin/skin-blue.min.css">
  <!-- Google Font -->
  <!-- <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic"> -->
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <!-- Main Header -->
  <header class="main-header">

    <!-- Logo -->
    <a href="#" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>书城</b></span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg">学子书城管理系统</span>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">导航切换</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
          <!-- /.messages-menu -->
          <!-- User Account Menu -->
          <li class="dropdown user user-menu">
            <!-- Menu Toggle Button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <!-- The user image in the navbar-->
              <img src="admin/img/setting.png" class="user-image" alt="User Image">
              <!-- hidden-xs hides the username on small devices so only the image appears. -->
              <span class="hidden-xs">刘铁蛋</span>
            </a>
            <ul class="dropdown-menu">
              <!-- The user image in the menu -->
              <li class="user-header">
                <img src="admin/img/word.jpg" class="img-circle" alt="User Image">
                <p>让学习成为一种习惯</p>
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="password-change.html" class="btn btn-default btn-flat">修改密码</a>
                </div>
                <div class="pull-right">
                  <a href="login.html" class="btn btn-default btn-flat">退出</a>
                </div>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar Menu -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">&nbsp;</li>
        <!-- Optionally, you can add icons to the links -->
        <li class="treeview">
          <a href="#"><i class="fa fa-link"></i> <span>订单管理</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="order">所有订单</a></li>
            <li><a href="orderStatus?order_sta=Paid">待处理</a></li>
            <li><a href="orderStatus?order_sta=InHand">处理中</a></li>
            <li><a href="orderStatus?order_sta=Shipped">已发货</a></li>
            <li><a href="orderStatus?order_sta=Received">已交付</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#"><i class="fa fa-link"></i> <span>商品管理</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="book">所有商品</a></li>
            <li><a href="product-add.jsp">添加商品</a></li>
          </ul>
        </li>
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1><small></small></h1>
      <ol class="breadcrumb">
        <li><i class="fa fa-dashboard">&nbsp;订单管理</i></li>
        <li class="active">所有订单</li>
      </ol>
    </section>
    <!-- Main content -->
    <section class="content container-fluid">
                <div class="box box-primary">
                  <div class="box-body">
                    <table id="my_order" class="table table-bordered table-striped">
                      <thead>
                      <tr>
                        <th>订单编号</th>
                        <th>订单状态</th>
                        <th>创建时间</th>
                        <th>订单总额</th>
                        <th>可选操作</th>
                      </tr>
                      </thead>
                      <tbody>
                      <c:forEach var="orderStatus" items="${orderInHandList}">
                      <tr>
                        <td>${orderStatus.orderId}</td>
                        <td><span class="label bg-yellow">
                        <c:choose>
                        	<c:when test="${orderStatus.sta == 'Paid'}">
                           		<c:out value="待处理"></c:out>
                       		</c:when>
                       		<c:when test="${orderStatus.sta == 'InHand'}">
                           		<c:out value="处理中"></c:out>
                       		</c:when>
                       		<c:when test="${orderStatus.sta == 'Shipped'}">
                           		<c:out value="已发货"></c:out>
                       		</c:when>
                       		<c:otherwise>
                       			<c:out value="已交付"></c:out>
                       		</c:otherwise>
                        </c:choose>
                        </span></td>
                        <td>${orderStatus.placed}</td>
                        <td>${orderStatus.payment}</td>
                        <td><a href="OrderDetailServlet?order_id=${orderStatus.orderId}">查看</a>丨<a href="OrderProcessServlet?order_id=${orderStatus.orderId}">处理</a></td>
                      </tr>
                      </c:forEach>
                      </tbody>
                      <tfoot>
                      <tr>
                        <th>订单编号</th>
                        <th>订单状态</th>
                        <th>创建时间</th>
                        <th>订单总额</th>
                        <th>可选操作</th>
                      </tr>
                      </tfoot>
                    </table>
                  </div>
                  <!-- /.box-body -->
                </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Main Footer -->
  <footer class="main-footer">
    <!-- To the right -->
    <div class="pull-right hidden-xs">
      缔造年轻人的中国梦
    </div>
    <!-- Default to the left -->
    <strong>Copyright &copy; 2021 <a href="http://www.tedu.cn">达内教育</a>.</strong> All rights reserved.
  </footer>

  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
  immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="admin/js/jquery/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="admin/js/bootstrap/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="admin/js/datatables.net/jquery.dataTables.min.js"></script>
<script src="admin/js/datatables.net-bs/dataTables.bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="admin/js/AdminLTE/adminlte.min.js"></script><!-- moment -->
<!-- <script src="admin/js/moment/moment.min.js"></script> -->
<!-- page script -->
<script>
 $(function () {
   $('#my_order').DataTable({
     'paging'      : true,
     'lengthChange': false,
     'searching'   : false,
     'ordering'    : false,
     'info'        : true,
     'autoWidth'   : false,
     'pagingType': 'full_numbers'/*,
     'processing': true,
     'serverSide': true,
     'ajax': '../servlet/all-order',
     'columns': [
    	    { 'data': 'orderId' },// 订单编号219
    	    { 'data': 'sta' , 'render': function (data, type, row, meta) { 
    	    	var content = null;
    	    	switch(meta.row%4){
    	    		case 0:content = '<span class="label bg-yellow">'+data+'</span>';break;
    	    		case 1:content = '<span class="label bg-aqua">'+data+'</span>';break;
    	    		case 2:content = '<span class="label bg-green">'+data+'</span>';break;
    	    		case 3:content = '<span class="label bg-red">'+data+'</span>';break;
    	    	}
    	    	return content;
		      }
		    },// 订单状态<span class="label bg-red">已交付</span>
    	    { 'data': 'placed' , 'render': function (data, type, row, meta) { 
	    	    	return moment(data).format('YYYY-MM-DD HH:mm');
		    	}
	    	},// 创建时间2014-11-7 11:31
    	    { 'data': 'payment' , 'render': function (data, type, row, meta) { 
	    	    	return '￥'+data.toFixed(2);
    	    	}
    	    },// 订单总额￥10.70
    	    { 'data': 'sta' , 'render': function (data, type, row, meta) { 
    	    	var content = '<a href="../servlet/order-detail?orderId='+row.orderId+'">查看</a>丨';
    	    	if(data=='已交付'){
    	    		content+='处理';
    	    	}else{
    	    		content+='<a href="../servlet/order-process?orderId='+row.orderId+'">处理</a>';
    	    	}
    	    	return content;
	    	  }
	    	}// 可选操作<a href="#">查看</a>丨处理
    	  ]
	 */
   })
 })
</script>
</body>
</html>
