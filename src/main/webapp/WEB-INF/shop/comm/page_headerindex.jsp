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
<%@include file="user_header.jsp" %>
<div id="header">
  <div class="headerLayout">
    <div class="headerCon ">
      <h1 id="mallLogo" class="mall-logo"> 
     	<a href="/" class="header-logo" title="logo"><img src="../images/header/logo.jpg" /></a>
      </h1>
      <div class="header-extra">
<!--         {include file='library/user_header_right.lbi'}  -->
        <script src="images/page.js" type="text/javascript"></script>  
        <div id="mallSearch" class="mall-search" style="position:relative; z-index:999999999; overflow:visible;">
        <div id="search_tips" style="display:none;"></div>
          <ul class="search-type clearfix">
          	<li <c:if test ="$smarty.request.type ==0">class="cur"</c:if> num="0">宝贝</li>
          	<li <c:if test ="smarty.request.type ==1">class="cur"</c:if> num="1">店铺</li>
          </ul>	 
          <form class="mallSearch-form" method="get" name="searchForm" id="searchForm" action="search.php" onSubmit="return checkSearchForm()">
	   		<input type='hidden' name='type' id="searchtype" value="{$smarty.request.type|default:0}">
            <fieldset>
              <legend>搜索</legend>
              <div class="mallSearch-input clearfix">
                <div id="s-combobox-135" class="s-combobox">
                  <div class="s-combobox-input-wrap">
                    <input aria-haspopup="true" role="combobox" class="s-combobox-input" name="keywords" id="keyword" tabindex="9" accesskey="s" onkeyup="STip(this.value, event);" autocomplete="off"  value="{if $search_keywords}{$search_keywords|escape}{else}请输入关键词{/if}" onFocus="if(this.value=='请输入关键词'){this.value='';}else{this.value=this.value;}" onBlur="if(this.value=='')this.value='请输入关键词'" type="text">
                  </div>
                </div>
                <input type="submit" value="搜索" class="button"  >
              </div>
            </fieldset>
          </form>
          <ul class="hot-query" >
          <c:forEach items=${searchkeywords} var=val varStatus="status"}
          	<li <c:if test=${status.first}> style="border-left: none;"</c:if>
            	<a href="search.php?keywords={$val|escape:url}" title="{$val}">{$val}</a>
            </li>
           </c:forEach>           
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="globa-nav">
  <div class="w">
  	<div class="allGoodsCat Left" > 
    	<a href="catalog.php" class="menuEvent" title="查看全部商品分类"><strong class="catName">全部商品分类</strong><i></i></a>
   </div>
  <%@include file="head_nav.jsp" %>
  </div>
</div>
<script type="text/javascript">function _show_(h,b){if(!h){return;}if(b&&b.source&&b.target){var d=(typeof b.source=="string")?M.$("#"+b.source):b.source;var e=(typeof b.target=="string")?M.$("#"+b.target):b.target;if(d&&e&&!e.isDone){e.innerHTML=d.value;d.parentNode.removeChild(d);if(typeof b.callback=="function"){b.callback();}e.isDone=true;}}M.addClass(h,"hover");if(b&&b.isLazyLoad&&h.isDone){var g=h.find("img");for(var a=0,c=g.length;a<c;a++){var f=g[a].getAttribute("data-src_index_menu");if(f){g[a].setAttribute("src",f);g[a].removeAttribute("data-src_index_menu");}}h.isDone=true;}}function _hide_(a){if(!a){return;}if(a.className.indexOf("hover")>-1){M.removeClass(a,"hover");}}</script>
<div class="w">
	<div class="all_cat" style="background: #ffffff;filter: alpha(Opacity=80);background-color: rgba(255,255,255,.8);">
		{include file='library/header_tan.lbi'}
	</div>
</div>
<script type="text/javascript">
//<![CDATA[
{literal}
function checkSearchForm()
{
    if(document.getElementById('keyword').value)
    {
	var frm  = document.getElementById('searchForm');
	var type = parseInt(document.getElementById('searchtype').value);
	frm.action = type==0 ? 'search.php' : 'stores.php';
        return true;
    }
    else
    {
	alert("请输入关键词！");
        return false;
    }
}

function myValue1()
{
	document.getElementById('keyword').value = "请输入商品名称或编号...";
}

function myValue2()
{
	document.getElementById('keyword').value = "";
}
{/literal}
//]]>
</script>
<div class="blank10"></div>
<script>
/* *
 * 清除购物车购买商品数量
 */
function delet(rec_id)
{
	var formBuy      = document.forms['formCart'];
	var domname='goods_number_'+rec_id;
	var attr = getSelectedAttributes(document.forms['formCart']);
	var qty = parseInt(document.getElementById(domname).innerHTML)==0;
	Ajax.call('flow.php', 'step=price&rec_id=' + rec_id + '&number=' + qty, changecartPriceResponse, 'GET', 'JSON');
}			
/* *
 * 增加购物车购买商品数量
 */
function addcartnum(rec_id)
{
  var attr = getSelectedAttributes(document.forms['formCart']);
  var domname='goods_number_'+rec_id;
  var qty = parseInt(document.getElementById(domname).innerHTML)+1;
  Ajax.call('flow.php', 'step=price&rec_id=' + rec_id + '&number=' + qty, changecartPriceResponse, 'GET', 'JSON');
}
/* *
 * 减少购买商品数量
 */
function lesscartnum(rec_id)
{
    var formBuy      = document.forms['formCart'];
	var domname='goods_number_'+rec_id;
	var attr = getSelectedAttributes(document.forms['formCart']);
	var qty = parseInt(document.getElementById(domname).innerHTML)-1;
	Ajax.call('flow.php', 'step=price&rec_id=' + rec_id + '&number=' + qty, changecartPriceResponse, 'GET', 'JSON');
}
/**
 * 接收返回的信息
 */
function changecartPriceResponse(res)
{
  if (res.err_msg.length > 0 )
  {
    alert(res.err_msg);
  }
  else
  {
	var domnum='goods_number_'+res.rec_id;
	if(res.qty <= 0){
    	document.getElementById('CART_INFO').innerHTML = res.content1;
	}else{
    	document.getElementById(domnum).innerHTML = res.qty;
	}
    document.getElementById('ECS_CARTINFO').innerHTML = res.result;
  }
}


function changallser(allser)
{
	document.getElementById(allser).className='item fore';
}
</script> 
<script>
$('.search-type li').click(function() {
    $(this).addClass('cur').siblings().removeClass('cur');
    $('#searchtype').val($(this).attr('num'));
});
</script>	
</body>
</html>