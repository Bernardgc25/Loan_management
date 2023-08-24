<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@page isELIgnored="false"%>

<c:url var="addUrl" value="/ctl/assignLoanVerification" />

<c:url var="addSearch" value="/ctl/assignLoanVerification/search" />

<c:url var="editUrl" value="/ctl/assignLoanVerification?id=" />

<c:url var="statusUrl" value="/ctl/assignLoanVerification/status?id=" />

<c:url var="loanSearchUrl" value="/ctl/applyLoan/search?lid=" />

<c:url var="updateUrl" value="/ctl/updateLoanVerification?aId=" />

<br>
<div class="container"> 
<nav aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item linkSize"><i class="fas fa-tachometer-alt"></i> <a class="link-dark" href="<c:url value="/home"/>">Home</a></li>
    <li class="breadcrumb-item linkSize active" aria-current="page"> <i class="fa fa-arrow-right" aria-hidden="true"></i>Assign For Loan Verification Report</li>
  </ol>
</nav>
</div>
<hr>
	<sf:form method="post"
		action="${pageContext.request.contextPath}/ctl/assignLoanVerification/search"
		modelAttribute="form">
		<div class="card">
			<h5 class="card-header bgcolor"
				style="color: white;">Assign For Loan Verification Report</h5>
			<div class="card-body">
				<div class="row g-3">
					
					<s:bind path="loanRequestId">
						<div class="col">
							<sf:input path="${status.expression}" class="form-control form-control-sm"
								placeholder="Search By Loan Id" />
						</div>
					</s:bind>
					<c:if test="${sessionScope.user.roleId == 1}">
					<s:bind path="loanOfficerName">
						<div class="col">
							<sf:input path="${status.expression}" class="form-control form-control-sm"
								placeholder="Search By Loan Officer Name" />
						</div>
					</s:bind>
					</c:if>
					
					
					<div class="col">
						<input type="submit" class="btn btn-sm btn-outline-primary"
							name="operation" value="Search"></input> or <input type="submit"
							class="btn btn-sm btn-outline-secondary" name="operation"
							value="Reset">
					</div>
				</div>
				<b><%@ include file="businessMessage.jsp"%></b>
				<br>
				<sf:input type="hidden" path="pageNo" />
				<sf:input type="hidden" path="pageSize" />

				<sf:input type="hidden" path="listsize" />
				<sf:input type="hidden" path="total" />
				<sf:input type="hidden" path="pagenosize" />
		<div class="table-responsive">
				<table class="table table-bordered border-primary">
					<thead>
						<tr>
						<c:if test="${sessionScope.user.roleId == 1}">
						<th scope="col"><input type="checkbox" id="selectall">Select
								All</th>
								</c:if>
							<th scope="col">#</th>
							<th scope="col">Loan Id</th>
							<th scope="col">User Name</th>
							<c:if test="${sessionScope.user.roleId == 1}">
							<th scope="col">Loan Officer Name</th>
							<th scope="col">Action</th>
							</c:if>
							<c:if test="${sessionScope.user.roleId == 3}">
							<th scope="col">Update Detail</th>
							</c:if>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="us" varStatus="assignLoanVerification">
							<tr>
							<c:if test="${sessionScope.user.roleId == 1}">
							<td ><input type="checkbox" class="case"
									name="ids" value="${us.id}"></td>
									</c:if>
								<td scope="row">${assignLoanVerification.index+1}</td>
								<td scope="row"><a href="${loanSearchUrl}${us.loan.id}">${us.loanRequestId}</a></td>
								<td scope="row">${us.loan.name}</td>
								<c:if test="${sessionScope.user.roleId == 1}">
								<td scope="row">${us.loanOfficerName}</td>
								<td scope="row"><a href="${editUrl} ${us.id}"
									class="btn btn-primary btn btn-info"><i class="fas fa-edit"></i></a></td>
								</c:if>
								<c:if test="${sessionScope.user.roleId == 3}">
								<td scope="row"><a href="${updateUrl} ${us.id}"
									class="btn btn-primary btn btn-info">Update Detail</a></td>
								</c:if>
								</tr>
						</c:forEach>
					</tbody>
				</table>
				</div>
				<div class="clearfix">
				<c:if test="${sessionScope.user.roleId == 1}">
				<input type="submit" name="operation"
								class="btn btn-sm btn-danger float-start" 	<c:if test="${listsize == 0}">disabled="disabled"</c:if>
								value="Delete">
				</c:if>
				
				
			<nav aria-label="Page navigation example float-end">
				<ul class="pagination justify-content-end" style="font-size: 13px">
					<li class="page-item"><input type="submit" name="operation"
								class="page-link" 	<c:if test="${form.pageNo == 1}">disabled="disabled"</c:if>
								value="Previous"></li>
								 <c:forEach var = "i" begin = "1" end = "${(listsize/10)+1}">
								 <c:if test="${i== pageNo}">
								<li class="page-item active"><a class="page-link activate" href="${addSearch}?pageNo=${i}">${i}</a></li>
								</c:if>
								<c:if test="${i != pageNo}">
								<li class="page-item"><a class="page-link" href="${addSearch}?pageNo=${i}">${i}</a></li>
								</c:if>
								</c:forEach>
					<li class="page-item"><input type="submit" name="operation"
								class="page-link" <c:if test="${total == pagenosize  || listsize < pageSize   }">disabled="disabled"</c:if>
								value="Next"></li>
				</ul>
			</nav>
			</div>
			</div>
		</div>
	</sf:form>
