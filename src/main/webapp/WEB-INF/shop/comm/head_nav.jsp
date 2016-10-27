<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="commtags.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<ul class="allMenu Left">
  <li><a class="index nav" href="/" title="首页">首页</a></li>
   <c:forEach varStatus="status" items=${navigator_list.middle} =nav > 
  	<li><a href="{$nav.url}"  class="nav <c:if test ="${nav.active==1}"> current  </c:if>" 
  	 title="{$nav.name}" <c:if test ="${nav.opennew==1}" > target="_blank" </c:if>${nav.name} >
  	 </a>
  	</li>  
   </c:forEach>
  </ul>
</body>
</html>