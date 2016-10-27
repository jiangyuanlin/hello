<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="table-scrollable">
	<table class="table table-striped table-hover table-success">
		<thead>
			<tr>
				<th>#</th>
				<#list columns as po>
				<#if po.isShowList == 'Y'>
				<th>${po.description}</th>
				</#if>
				</#list>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${'$'}{page.result}" var="${className?uncap_first}" varStatus="vs">
			<tr>
				<td>${'$'}{vs.count + page.offset}</td>
				<#list columns as po>
				<#if po.isShowList == 'Y'>
				<td>${'$'}{${className?uncap_first}.${po.fieldName}}</td>
				</#if>
				</#list>
				<td>
					
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div class="pageination-panel">${'$'}{page}</div>