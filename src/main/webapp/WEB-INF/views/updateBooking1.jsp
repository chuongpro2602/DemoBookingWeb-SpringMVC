<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--  Bootstrap -->
<link
	href="<c:url value="/resources/vendors/bootstrap/dist/css/bootstrap.min.css" />"
	rel="stylesheet">
<!-- Font Awesome -->
<link
	href="<c:url value="/resources/vendors/font-awesome/css/font-awesome.min.css" />"
	rel="stylesheet">
<!-- NProgress -->
<link
	href="<c:url value="/resources/vendors/nprogress/nprogress.css" />"
	rel="stylesheet">
<!-- iCheck -->
<link
	href="<c:url value="/resources/vendors/iCheck/skins/flat/green.css" />"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="<c:url value="/resources/css1/custom.min.css" />"
	rel="stylesheet">

<style type="text/css">
.error {
	color: red;
}
</style>
<title>Manager Travel</title>
</head>
<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">
					<div class="navbar nav_title" style="border: 0;">
						<a href="../index.html" class="site_title"><i
							class="fa fa-plane"></i> <span>Manager Travel</span></a>
					</div>

					<div class="clearfix"></div>

					<!-- menu profile quick info -->
					<div class="profile clearfix">
						<div class="profile_pic">
							<img
								src="https://scontent.fdad3-1.fna.fbcdn.net/v/t1.6435-9/162166716_477456876720198_322481996919890125_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=0debeb&_nc_ohc=jmquZCKeK68AX-iLtBQ&_nc_ht=scontent.fdad3-1.fna&oh=822c294591f5513e026d9445379be7d7&oe=613DD582"
								alt="..." class="img-circle profile_img">
						</div>
						<div class="profile_info">
							<span>Welcome,</span>
							<h2>Staff</h2>
						</div>
					</div>
					<!-- /menu profile quick info -->

					<br />

					<!-- sidebar menu -->
					<div id="sidebar-menu"
						class="main_menu_side hidden-print main_menu">
						<div class="menu_section">
							<h3>General</h3>
							<ul class="nav side-menu">
								<li><a><i class="fa fa-home"></i> Home <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="../index.html">Dashboard</a></li>

									</ul></li>


								<li><a><i class="fa fa-table"></i> Qu???n l?? <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a
											href="${pageContext.request.contextPath}/staff/tourAdmin">
												Qu???n l?? Tour </a></li>
										<li><a
											href="${pageContext.request.contextPath}/staff/tourPriceAdmin">Qu???n
												l?? gi?? tour </a></li>
										<li><a
											href="${pageContext.request.contextPath}/staff/hotelAdmin">
												Qu???n l?? kh??ch s???n </a></li>
										<li><a
											href="${pageContext.request.contextPath}/staff/roomAdmin">Qu???n
												l?? ph??ng kh??ch s???n </a></li>
										<li><a
											href="${pageContext.request.contextPath}/staff/staffService">Qu???n
												l?? Service </a></li>
										<li><a
											href="${pageContext.request.contextPath}/staff/staffPromotion">Qu???n
												l?? Khuy???n m??i </a></li>
										<li><a
											href="${pageContext.request.contextPath}/staff/adressAdmin">Qu???n
												l?? ?????a ??i???m </a></li>
										<li><a
											href="${pageContext.request.contextPath}/staff/cityAdmin">Qu???n
												l?? th??nh ph??? </a></li>
										<li><a
											href="${pageContext.request.contextPath}/staff/bookingAdmin">Qu???n
												l?? BookingHotel </a></li>
										<li><a
											href="${pageContext.request.contextPath}/staff/addCity">Th??m
												th??nh ph??? </a></li>
										<li><a
											href="${pageContext.request.contextPath}/staff/addAddress">Th??m
												?????a ??i???m </a></li>
										<li><a
											href="${pageContext.request.contextPath}/staff/addTour">Th??m
												tour m???i </a></li>
										<li><a
											href="${pageContext.request.contextPath}/staff/addTourPrice">Th??m
												gi?? tour </a></li>
										<li><a
											href="${pageContext.request.contextPath}/staff/addHotel">Th??m
												kh??ch s???n </a></li>
										<li><a
											href="${pageContext.request.contextPath}/staff/addRoom">Th??m
												ph??ng kh??ch s???n </a></li>
										<li><a
											href="${pageContext.request.contextPath}/staff/addService">Th??m
												Service v?? Khuy???n m??i </a></li>
										<li><a
											href="${pageContext.request.contextPath}/staff/addPromotion">Th??m
												Khuy???n m??i </a></li>
									</ul></li>
								<li><a><i class="fa fa-bar-chart-o"></i> B??o c??o <span
										class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu">
										<li><a href="chartjs.html">Bi???u ?????</a></li>
									</ul></li>

							</ul>
						</div>


					</div>
					<!-- /sidebar menu -->

					<!-- /menu footer buttons -->
					<div class="sidebar-footer hidden-small">
						<a data-toggle="tooltip" data-placement="top" title="Settings">
							<span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
						</a> <a data-toggle="tooltip" data-placement="top" title="FullScreen">
							<span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
						</a> <a data-toggle="tooltip" data-placement="top" title="Lock"> <span
							class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
						</a> <a data-toggle="tooltip" data-placement="top" title="Logout"
							href="login.html"> <span class="glyphicon glyphicon-off"
							aria-hidden="true"></span>
						</a>
					</div>
					<!-- /menu footer buttons -->
				</div>
			</div>

			<!-- top navigation -->
			<div class="top_nav">
				<div class="nav_menu">
					<div class="nav toggle">
						<a id="menu_toggle"><i class="fa fa-bars"></i></a>
					</div>
					<nav class="nav navbar-nav">
						<ul class=" navbar-right">
							<li class="nav-item dropdown open" style="padding-left: 15px;">
								<a href="javascript:;" class="user-profile dropdown-toggle"
								aria-haspopup="true" id="navbarDropdown" data-toggle="dropdown"
								aria-expanded="false"> <img
									src="https://scontent.fdad3-1.fna.fbcdn.net/v/t1.6435-9/162166716_477456876720198_322481996919890125_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=0debeb&_nc_ohc=jmquZCKeK68AX-iLtBQ&_nc_ht=scontent.fdad3-1.fna&oh=822c294591f5513e026d9445379be7d7&oe=613DD582"
									alt="">Staff
							</a>
								<div class="dropdown-menu dropdown-usermenu pull-right"
									aria-labelledby="navbarDropdown">
									<form:form action="${pageContext.request.contextPath}/logout"
										method="post">
										<%-- 	<a class="dropdown-item" href="${pageContext.request.contextPath }/home"><i
										class="fa fa-sign-out pull-right"></i> Log Out</a> --%>
										<input class="dropdown-item" type="submit" value="Logout" />
									</form:form>
								</div>
							</li>

							<li role="presentation" class="nav-item dropdown open">
								<!-- <a href="javascript:;" class="dropdown-toggle info-number" id="navbarDropdown1" data-toggle="dropdown" aria-expanded="false">
                      <i class="fa fa-envelope-o"></i>
                      <span class="badge bg-green">6</span>
                    </a> -->
								<ul class="dropdown-menu list-unstyled msg_list" role="menu"
									aria-labelledby="navbarDropdown1">
									<li class="nav-item"><a class="dropdown-item"> <span
											class="image"><img src="images/img.jpg"
												alt="Profile Image" /></span> <span> <span>John
													Smith</span> <span class="time">3 mins ago</span>
										</span> <span class="message"> Film festivals used to be
												do-or-die moments for movie makers. They were where... </span>
									</a></li>
									<li class="nav-item"><a class="dropdown-item"> <span
											class="image"><img src="images/img.jpg"
												alt="Profile Image" /></span> <span> <span>John
													Smith</span> <span class="time">3 mins ago</span>
										</span> <span class="message"> Film festivals used to be
												do-or-die moments for movie makers. They were where... </span>
									</a></li>
									<li class="nav-item"><a class="dropdown-item"> <span
											class="image"><img src="images/img.jpg"
												alt="Profile Image" /></span> <span> <span>John
													Smith</span> <span class="time">3 mins ago</span>
										</span> <span class="message"> Film festivals used to be
												do-or-die moments for movie makers. They were where... </span>
									</a></li>
									<li class="nav-item"><a class="dropdown-item"> <span
											class="image"><img src="images/img.jpg"
												alt="Profile Image" /></span> <span> <span>John
													Smith</span> <span class="time">3 mins ago</span>
										</span> <span class="message"> Film festivals used to be
												do-or-die moments for movie makers. They were where... </span>
									</a></li>
									<li class="nav-item">
										<div class="text-center">
											<a class="dropdown-item"> <strong>See All Alerts</strong>
												<i class="fa fa-angle-right"></i>
											</a>
										</div>
									</li>
								</ul>
							</li>
						</ul>
					</nav>
				</div>
			</div>
			<!-- /top navigation -->

			<!-- page content -->
			<div class="right_col" role="main">
				<div class="">
					<div class="page-title">
						<div style="padding-bottom: 20px" class="title_left">
							<h3 class="text-capitalize">S???a Booking</h3>


						</div>
					</div>


					<div class="clearfix"></div>

					<form:form method="post" action="doUpdateBooking"
						enctype="multipart/form-data" modelAttribute="bookingEntity">

						<div class="form-group row">
							<label style="font-size: 16px" class="col-sm-1 col-form-label">Ten
								ID</label>
							<div class="col-4 mb-4">

								<form:input path="id" type="text" cssClass="form-control"
									readonly="true" />
							</div>
						</div>
						<div class="form-group row">
							<label style="font-size: 16px" class="col-sm-1 col-form-label">Ng??y
								booking</label>
							<div class="col-4 mb-4">

								<form:input path="bookingDate" type="text"
									cssClass="form-control" readonly="true" />
							</div>
						</div>
						<div class="form-group row">
							<label style="font-size: 16px" class="col-sm-1 col-form-label">Mail</label>
							<div class="col-4 mb-4">

								<form:input path="customersEntity.mail" type="text"
									cssClass="form-control" readonly="true" />
							</div>
						</div>
						<div class="form-group row">
							<label style="font-size: 16px" class="col-sm-1 col-form-label">H???
								v?? T??n</label>
							<div class="col-4 mb-4">

								<form:input path="customersEntity.fullName" type="text"
									cssClass="form-control" readonly="true" />
							</div>
						</div>
						<div class="form-group row">
							<label style="font-size: 16px" class="col-sm-1 col-form-label">Gi???i
								t??nh</label>
							<div class="col-4 mb-4">

								<form:input path="customersEntity.gender" type="text"
									cssClass="form-control" readonly="true" />
							</div>
						</div>

						<div class="form-group row">
							<label style="font-size: 16px" class="col-sm-1 col-form-label">S??t</label>
							<div class="col-4 mb-4">

								<form:input path="customersEntity.phone" type="text"
									cssClass="form-control" readonly="true" />
							</div>
						</div>
						<div class="form-group row">
							<label style="font-size: 16px" class="col-sm-1 col-form-label">DOB</label>
							<div class="col-4 mb-4">

								<form:input path="customersEntity.dob" type="text"
									cssClass="form-control" readonly="true" />
							</div>
						</div>
						<div class="form-group row">
							<label style="font-size: 16px" class="col-sm-1 col-form-label">?????a
								ch???</label>
							<div class="col-4 mb-4">

								<form:input path="customersEntity.address" type="text"
									cssClass="form-control" readonly="true" />
							</div>
						</div>
						<div class="form-group row">
							<label style="font-size: 16px" class="col-sm-1 col-form-label">S???
								ng?????i l???n</label>
							<div class="col-4 mb-4">

								<form:input path="numOfAdults" type="text"
									cssClass="form-control" readonly="true" />
							</div>
						</div>
						<div class="form-group row">
							<label style="font-size: 16px" class="col-sm-1 col-form-label">S???
								tr??? em</label>
							<div class="col-4 mb-4">

								<form:input path="numOfChild" type="text"
									cssClass="form-control" readonly="true" />
							</div>
						</div>
						<div class="form-group row">
							<label style="font-size: 16px" class="col-sm-1 col-form-label">Quantity</label>
							<div class="col-4 mb-4">

								<form:input path="quantity" type="text" cssClass="form-control"
									readonly="true" />
							</div>
						</div>
						<div class="form-group row">
							<label style="font-size: 16px" class="col-sm-1 col-form-label">Ng??y
								b???t ?????u</label>
							<div class="col-4 mb-4">

								<form:input path="startDate" type="text" cssClass="form-control"
									readonly="true" />
									<form:errors path="startDate" />
							</div>
						</div>
						<div class="form-group row">
							<label style="font-size: 16px" class="col-sm-1 col-form-label">Ng??y
								K???t th??c</label>
							<div class="col-4 mb-4">

								<form:input path="endDate" type="text" cssClass="form-control"
									readonly="true" />
									<form:errors path="endDate" />
							</div>
						</div>
						<div class="form-group row">
							<label style="font-size: 16px" class="col-sm-1 col-form-label">T???ng
								gi??</label>
							<div class="col-4 mb-4">

								<form:input path="totalPrice" type="text"
									cssClass="form-control" readonly="true" />
							</div>
						</div>

						<div class="form-group row">
							<label style="font-size: 16px" class="col-sm-1 col-form-label">D???ch
								V???</label>
							<div class="col-4 mb-4">

								<form:select id="SelectService" path="serviceEntity.id"
									cssClass="form-control">
									<form:option value="0">---Select Service---</form:option>
									<c:forEach items="${serviceEntity }" var="item">
										<form:option value="${item.id }">${item.nameService } Price: ${item.price } Percentage: ${item.promotionEntity.percentage } %</form:option>
									</c:forEach>
								</form:select>
							</div>

						</div>
						<div class="form-group row">
							<label style="font-size: 16px" class="col-sm-1 col-form-label">Tr???ng
								th??i</label>
							<div class="col-4 mb-4">

								<form:select id="SelectService" path="bookingStatusEntity.id"
									cssClass="form-control">
									<form:option value="0">---Select Status---</form:option>
									<c:forEach items="${status }" var="item">
										<form:option value="${item.id }">${item.bsStatus }</form:option>
									</c:forEach>
								</form:select>
							</div>

						</div>

						<div class="form-group row">
							<label style="font-size: 16px" class="col-sm-1 col-form-label">Hu???
								????n</label>
							<div class="col-4 mb-4">

								<div class="form-check form-check-inline col-sm-6">
									<form:radiobutton cssClass="form-check-input"
										path="cancel"
										name="inlineCheckbox" id="inlineCheckbox1" value="0" />
									<label class="form-check-label" for="inlineCheckbox1">
										Kh??ng </label>
								</div>
								<div class="form-check form-check-inline col-sm-6">
									<form:radiobutton
										path="cancel"
										cssClass="form-check-input" name="inlineCheckbox"
										id="inlineCheckbox2" value="1" />
									<label class="form-check-label" for="inlineCheckbox2">
										Hu??? </label>

								</div>
							</div>
						</div>
						<div class="form-group row">
							<label style="font-size: 16px" class="col-sm-1 col-form-label">Note</label>
							<div class="col-4 mb-4">

								<form:input path="note" type="text" cssClass="form-control" />
								<form:errors path="note" cssClass="error" />
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-offset-2 col-sm-12">
								<input style="margin-left: 500px; width: 150px;" type="submit"
									value="submit" class="btn btn-primary" />
							</div>
						</div>
					</form:form>
					<a style="font-size: 20px" href="bookingAdmin">Return Qu???n L??
						Booking</a>
				</div>
			</div>
		</div>
		<!-- /page content -->



		<!-- footer content -->
		<!-- <footer>
          <div class="pull-right">
            Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
          </div>
          <div class="clearfix"></div>
        </footer> -->
		<!-- /footer content -->
	</div>



	<!-- jQuery -->
	<script
		src="<c:url value="/resources/vendors/jquery/dist/jquery.min.js" />"></script>
	<!-- Bootstrap -->
	<script
		src="<c:url value="/resources/vendors/bootstrap/dist/js/bootstrap.bundle.min.js" />"></script>
	<!-- FastClick -->
	<script
		src="<c:url value="/resources/vendors/fastclick/lib/fastclick.js" />"></script>
	<!-- NProgress -->
	<script
		src="<c:url value="/resources/vendors/nprogress/nprogress.js" />"></script>
	<!-- iCheck -->
	<script src="<c:url value="/resources/vendors/iCheck/icheck.min.js" />"></script>

	<!-- Custom Theme Scripts -->

	<script src="<c:url value="/resources/js1/custom.min.js" />"></script>


</body>
</html>