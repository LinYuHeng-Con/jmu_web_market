<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ page import="jmu_web.market.book.entity.*"%>
<%@ page import="jmu_web.market.book.dao.*"%>
<%@ page import="jmu_web.market.book.dao.impl.*"%>
<%@ page import="jmu_web.market.address.dao.impl.*"%>
<%@ page import="jmu_web.market.address.dao.*"%>
<%@ page import="jmu_web.market.address.*"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>确认订单</title>
    <link href="../css/order.confirm.css" rel="stylesheet"/>
    <link href="../css/header.css" rel="stylesheet"/>
    <link href="../css/footer.css" rel="stylesheet"/>
    <%
    	String product = request.getParameter("product");
   		String count = request.getParameter("count");
   		String sid = (String)session.getAttribute("sessionId");
    	BookDAO dao = new BookDAOImpl();
    	List<Book> bookList = dao.getBookByIsbn1(product);
    	AddressDAO dao1 = new AddressDAOImpl();
    	List<Address> addressList = dao1.getAddress(sid);
    	out.print(addressList);
    	
    %>
</head>
<body>
<!-- 页面顶部-->
<header id="top">
    <div id="logo" class="lf">
        <img class="animated jello" src="../img/header/logo.png" alt="logo"/>
    </div>
    <div id="top_input" class="lf">
        <input id="input" type="text" placeholder="请输入您要搜索的内容"/>

        <a href="" class="rt"><img id="search" src="../img/header/search.png" alt="搜索"/></a>
    </div>
    <div class="rt">
        <ul class="lf">
            <li><a href="index.jsp" >首页</a><b>|</b></li>
            <li><a href="collect.jsp" >收藏</a><b>|</b></li>
            <li><a href="order.jsp" >订单</a><b>|</b></li>
            <li><a href="cart.jsp" >购物车</a><b>|</b></li>
            <li><a href="password-change.html">设置</a><b>|</b></li>
            <li><a href="login.jsp">退出</a><b>|</b></li>
            <li><a href="lookforward.html">帮助</a></li>
        </ul>
    </div>
</header>
<div id="navlist">
    <ul>
        <li class="navlist_blue_left"></li>
        <li class="navlist_blue">确认订单信息</li>
        <li class="navlist_blue_arro"><canvas id="canvas_blue" width="20" height="38"></canvas>
        </li>
        <li class="navlist_gray">支付订单<b></b></li>
        <li class="navlist_gray_arro"><canvas id="canvas_gray" width="20" height="38"></canvas>
        </li>
        <li class="navlist_gray">支付完成<b></b></li>
        <li class="navlist_gray_right"></li>
    </ul>
</div>
<!--订单确认-->
<div id="container" class="clear">
    <!--收货地址-->
    <div class="adress_choice">
    <input type="hidden" id="count" value=<%=count %>>
    <input type="hidden" id="product" value=<%=product %>>
        <p>选择收货地址</p>
	<%for(Address a:addressList){ %>
        <div id="addresId1">
        <% if(a.getRid().equals("1")) {%>
			<i class="user_choice">
                <input type="radio" name="address" value=<%=a.getRid() %> checked />
            </i>
            <%}else{ %>
            <i class="user_choice">
                <input type="radio" name="address" value=<%=a.getRid() %>  />
            </i>
            <%} %>
            <i class="address_name">
                <%=a.getReceiver() %> 
            </i>
            <i class="user_address">
                <%=a.getAddress() %> <%=a.getReceiverPhone() %>
            </i>
        </div>
        <%} %>
        <a href="set.html">
            更多地址 &gt;&gt;
        </a>
    </div>
    <!-- 商品信息-->

    <form name="" method="post" action="#">
       <%for(Book b:bookList){ %>
        <div class="product_confirm">
            <p>确认商品信息</p>
            <ul class="item_title">
                <li class="p_info">商品信息</li>
                <li class="p_price">单价(元)</li>
                <li class="p_count">数量</li>
                <li class="p_tPrice">金额</li>
            </ul>

            <ul class="item_detail">
               <li class="p_info">
                   <b><img src="../img/goods/<%=product %>/detail1.jpg"/></b>

                   <b class="product_name lf">
                      <%=b.getTitle() %>
                   </b>
                   <br/>
               <span class="product_color ">
                     <%=b.getPress() %>
               </span>
               </li>
               <li class="p_price">
                   <i>达内专属价</i>
                   <br/>
                   <span class="pro_price">￥<span class="ppp_price"><%=b.getPrice() %></span></span>
               </li>
               <li class="p_count">X<span><%=count %></span></li>
               <li class="p_tPrice">￥<span></span></li>
           </ul>
        </div>
            <%} %>
    </form>

    <!-- 结算条-->
    <div id="count_bar">
        <span class="go_cart"><a href="cart.jsp" >&lt;&lt;返回购物车</a></span>
        <span class="count_bar_info">已选<b  id="count"> <%=count %> </b>件商品&nbsp;&nbsp;合计(不含运费):<b class="zj"></b> <input type="hidden" name="Payment" value=""/>元</span>
        <span class="go_pay">确认并付款</span>
    </div>
</div>
<!-- 品质保障，私人定制等-->
<div id="foot_box">
    <div class="icon1 lf">
        <img src="../img/footer/icon1.png" alt=""/>

        <h3>品质保障</h3>
    </div>
    <div class="icon2 lf">
        <img src="../img/footer/icon2.png" alt=""/>

        <h3>私人定制</h3>
    </div>
    <div class="icon3 lf">
        <img src="../img/footer/icon3.png" alt=""/>

        <h3>学员特供</h3>
    </div>
    <div class="icon4 lf">
        <img src="../img/footer/icon4.png" alt=""/>

        <h3>专属特权</h3>
    </div>
</div>
<!-- 页面底部-->
<div class="foot_bj">
    <div id="foot">
        <div class="lf">
            <p class="footer1"><img src="../img/footer/tedu.png" alt="" class=" footLogo"/></p>
            <p class="footer2"><img src="../img/footer/footerFont.png"alt=""/></p>
            <!-- 页面底部-备案号 #footer -->
            <div class="record">
                2001-2016 版权所有 京ICP证8000853号-56
            </div>
        </div>
        <div class="foot_left lf" >
            <ul>
                <li><a href="#"><h3>买家帮助</h3></a></li>
                <li><a href="#">新手指南</a></li>
                <li><a href="#">服务保障</a></li>
                <li><a href="#">常见问题</a></li>
            </ul>
            <ul>
                <li><a href="#"><h3>商家帮助</h3></a></li>
                <li><a href="#">商家入驻</a></li>
                <li><a href="#">商家后台</a></li>
            </ul>
            <ul>
                <li><a href="#"><h3>关于我们</h3></a></li>
                <li><a href="#">关于达内</a></li>
                <li><a href="#">联系我们</a></li>
                <li>
                    <img src="../img/footer/wechat.png" alt=""/>
                    <img src="../img/footer/sinablog.png" alt=""/>
                </li>
            </ul>
        </div>
        <div class="service">
            <p>达内商城客户端</p>
            <img src="../img/footer/ios.png" class="lf">
            <img src="../img/footer/android.png" alt="" class="lf"/>
        </div>
        <div class="download">
            <img src="../img/footer/erweima.png">
        </div>
    </div>
</div>
<script src="../js/jquery-3.1.1.min.js"></script>
<script src="../js/index.js"></script>
<script>
    var html=0;
    var total=0;
    $(function(){
        $(".item_detail").each(function() {
            html+=1;
            var p=parseFloat($(this).children('.p_price').children('.pro_price').children('.ppp_price').html());
            console.log(p);
            var sl=parseFloat($(this).children('.p_count').children('span').html());
            var xj=parseFloat(p*sl).toFixed(2);
            console.log("xiaoji"+xj);
            $(this).children('.p_tPrice').children('span').html(xj);
            total+=xj-0;
        })
        console.log("zongji"+total);
        $("#count").html(html)-0;
        $('.zj').html(total.toFixed(2))-0;
        var input_zj=parseFloat($('.zj').html()).toFixed(2);
        $('#payment').val(input_zj);
        
        
        
        $(".go_pay").click(function () {
        	var zj = $(".zj").val(); 
        	var count = $("#count").val(); 
        	var product = $("#product").val(); 
        	var rid = $("input[name='address']:checked").val();
            location.href = "payment.jsp?zj="+total+"&rid="+rid+"&count="+count+"&product="+product;
        })
    })
</script>
<script>
	
</script>
<script>
    var canvas=document.getElementById("canvas_gray");
    var cxt=canvas.getContext("2d");
    var gray = cxt.createLinearGradient (10, 0, 10, 38);
    gray.addColorStop(0, '#f5f4f5');
    gray.addColorStop(1, '#e6e6e5');
    cxt.beginPath();
    cxt.fillStyle = gray;
    cxt.moveTo(20,19);
    cxt.lineTo(0,38);
    cxt.lineTo(0,0);
    cxt.fill();
    cxt.closePath();
</script>
<script>
    var canvas=document.getElementById("canvas_blue");
    var cxt=canvas.getContext("2d");
    var blue = cxt.createLinearGradient (10, 0, 10, 38);
    blue.addColorStop(0, '#27b0f6');
    blue.addColorStop(1, '#0aa1ed');
    cxt.beginPath();
    cxt.fillStyle = blue;
    cxt.moveTo(20,19);
    cxt.lineTo(0,38);
    cxt.lineTo(0,0);
    cxt.fill();
    cxt.closePath();
</script>
</body>
</html>
