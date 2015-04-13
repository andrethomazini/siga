<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page isErrorPage="true"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="req" value="${pageContext.request}" />
<c:set var="url">${req.requestURL}</c:set>
<c:set var="uri" value="${req.requestURI}" />
<c:set var="baseURL" value="${fn:substring(url, 0, fn:length(url) - fn:length(uri))}" />


<c:set var="titulo" scope="request">Acesso n�o autorizado</c:set>
<c:import url="${baseURL}/siga/paginas/cabecalho.jsp" />

<center>
<table width="729" border="1" cellspacing="0" cellpadding="0"
	bordercolor="#FFFFFF" bgcolor="#FFFFFF">
	<tr align="left">
		<td>Ocorreu o erro interno do servidor. Tente novamente.</td>
	</tr>
	<tr align="left">
		<td width="100%"><%= request.getRequestURL() %>&nbsp; <br>
<%-- 
<a href="${pageContext.request.contextPath}">Voltar...</a>  
--%>
	</tr>

</table>
</center>
<c:import url="${baseURL}/siga/paginas/rodape.jsp" />
