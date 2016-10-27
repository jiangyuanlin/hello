<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@include file="commtags.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div id="sn-bd">
  <div class="sn-container"> 
    <font id="login-info" class="sn-login-info">
    </font>
    <ul class="sn-quick-menu">
      <li class="sn-mytaobao menu-item j_MyTaobao">
        <div class="sn-menu">
        	<a aria-haspopup="menu-2" tabindex="0" class="menu-hd" href="user.php" target="_top" rel="nofollow">我的信息<b></b></a>
          	<div id="menu-2" class="menu-bd">
            	<div class="menu-bd-panel" id="myTaobaoPanel">
                	<a href="user.php?act=order_list" target="_top" rel="nofollow">已买到的宝贝</a> 
                    <a href="user.php?act=address_list" target="_top" rel="nofollow">我的地址管理</a> 
               </div>
          </div>
        </div>
      </li>
      <li class="sn-mybrand">
      	<a target="_top" id="J_SnMyBrand" class="sn-mybrand-link mui-global-iconfont" href="user.php?act=follow_shop">我关注的店铺</a> 
      </li>
      <li class="sn-cart mini-cart menu">
      	<a id="mc-menu-hd" class="sn-cart-link mui-global-iconfont" href="flow.php" target="_top" rel="nofollow">购物车</a>
      </li>
      <li class="sn-favorite menu-item">
        <div class="sn-menu"> 
        	<a aria-haspopup="menu-4" tabindex="0" class="menu-hd" href="user.php?act=collection_list" target="_top" rel="nofollow">收藏夹<b></b></a>
          	<div id="menu-4" class="menu-bd">
            	<div class="menu-bd-panel"> 
                	<a href="user.php?act=collection_list" target="_top" rel="nofollow">收藏的宝贝</a> 
                    <a href="user.php?act=follow_shop" target="_top" rel="nofollow">收藏的店铺</a> 
                </div>
          </div>
        </div>
      </li>
      <li class="sn-separator"></li>
      <script type="text/javascript">
		function show_qcord(){
			var qs=document.getElementById('sn-qrcode');
			qs.style.display="block";
		}
		function hide_qcord(){
			var qs=document.getElementById('sn-qrcode');
			qs.style.display="none";
		}
	  </script>
      <li class="sn-seller menu-item">
        <div class="sn-menu J_DirectPromo">
        <a aria-haspopup="menu-6" tabindex="0" class="menu-hd" href="" target="_top">商家支持<b></b></a>
        <div class="menu-bd" id="menu-6">
          <ul>
            <li>
              <h3>商家：</h3>
              <c:forEach var=nav items=${nav_top_list} varStatus="status" >
              <a href="${nav.url}"  >
              <c:if test=${status.index}==1} > 
             	 target="_blank"
              </c:if>
               {$nav.name}
               </a> 
              </c:forEach>
            </li>
            <li>
              <h3>帮助：</h3>
              <a href="help.php" target="_top" title="帮助中心">帮助中心</a> 
            </li>
          </ul>
        </div>
      </li>
     
    </ul>
  </div>
</div>
</div>
<script>
	header_login();
	function header_login()
	{	
		Ajax.call('login_act_ajax.php', '', loginactResponse, 'GET', 'JSON', '1', '1');
	}
	function loginactResponse(result)
	{
		var MEMBERZONE =document.getElementById('login-info');
		MEMBERZONE.innerHTML= result.memberinfo;
	}
</script>
</body>
</html>