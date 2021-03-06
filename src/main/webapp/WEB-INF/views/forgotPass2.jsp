<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
  <title>HTML Tutorial</title>
  <meta charset="utf8" />
  <meta name="keywords" content="content" />
  <meta name="description" content="description" />
  <meta name="author" content="author" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link href="<c:url value="/resources/css/swiper-bundle.min.css" />"
	rel="stylesheet">
  <link
    rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
    crossorigin="anonymous"
  />
  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
    integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
    crossorigin="anonymous"
    referrerpolicy="no-referrer"
  />
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
 
  <style>
    .pass_show {
      position: relative;
    }

    .pass_show .ptxt {
      position: absolute;

      top: 50%;

      right: 10px;

      z-index: 1;

      color: #777471;

      margin-top: -10px;

      cursor: pointer;

      transition: 0.3s ease all;
    }

    .pass_show .ptxt:hover {
      color: #333333;
    }
  </style>

  <body>
    <div class="container-fluid">
      <!-- navbar -->
      <div class="row">
        <div class="col-12 col-lg-12 col-xl-12 p-0">
          <nav class="navbar">
            <a
              class="navbar-brand d-flex flex-column align-items-center"
              href="/"
            >
              <span class="d-block text-white">
                <span>T</span>
                <span style="margin-left: -17px">A</span>
              </span>
              <span class="d-block text-white" style="font-size: 10px"
                >Travel Amazing</span
              >
            </a>
            <div class="navbar-icon"></div>
            <ul class="navbar-nav">
              <li><a href="../../index.html"> Kh??ch S???n </a></li>
              <li><a href="./tour.html"> Tour </a></li>
              <li><a href="#"> Th???c ??n </a></li>
              <li><a href="#"> Li??n H??? </a></li>
            </ul>
            <ul class="navbar-nav navbar-login">
              <li><a href="./login.html"> ????ng nh???p </a></li>
              <li><a href="./register.html"> ????ng k?? </a></li>
            </ul>
          </nav>
        </div>
      </div>
      <!-- end navbar -->
      <!-- content -->
      <form class="container">
        <div class="row d-flex justify-content-center">
          <div class="col-sm-4 border my-5 p-4">
            <h4 class="text-center">RESET MY PASSWORD</h4>
            <label style="font-size: 12px">EMAIL</label>
            <div class="form-group">
              <input type="email" class="form-control" />
            </div>
            <label style="font-size: 12px">M???T KH???U M???I</label>
            <div class="form-group pass_show">
              <input type="password" class="form-control" />
            </div>
            <label style="font-size: 12px">NH???P L???I M???T KH???U M???I</label>
            <div class="form-group pass_show">
              <input type="password" class="form-control" />
            </div>
            <a
              href="/"
              class="btn btn-success text-white"
              style="font-size: 12px"
            >
              X??C NH???N
            </a>
          </div>
        </div>
      </form>

      <!-- end content -->
           <!-- footer -->

           <div class="row">
            <div class="col-12 col-md-12 p-0">
              <div class="footer">
                <div class="row">
                  <div class="col-12 d-flex flex-wrap">
                    <ul>
                      <li class="font-weight-bold">V??? ch??ng t??i</li>
                      <li><a class="text-secondary" href="#">Ch??ng t??i</a></li>
                      <li><a class="text-secondary" href="#">PMS - Mi???n ph??</a></li>
                    </ul>
                    <ul>
                      <li class="font-weight-bold">Th??ng Tin C???n Bi???t</li>
                      <li>
                        <a class="text-secondary" href="#"
                          >??i???u ki???n & ??i???u kho???n</a
                        >
                      </li>
                      <li>
                        <a class="text-secondary" href="#">Quy ch??? ho???t ?????ng</a>
                      </li>
                      <li>
                        <a class="text-secondary" href="#">C??u h???i th?????ng g???p</a>
                      </li>
                    </ul>
                    <ul>
                      <li class="font-weight-bold">?????i t??c</li>
                      <li>
                        <a class="text-secondary" href="#"
                          >Quy ch??? b???o hi???m Cathay</a
                        >
                      </li>
                      <li>
                        <a class="text-secondary" href="#"
                          >Y??u c???u b???i th?????ng Cathay</a
                        >
                      </li>
                      <li>
                        <a class="text-secondary" href="#">Quy ch??? tr??? g??p</a>
                      </li>
                    </ul>
                    <ul>
                      <li>
                        <a href="#">
                          <img
                            src="https://cdn1.ivivu.com/bocongthuong.png"
                            alt=""
                          />
                        </a>
                      </li>
                    </ul>
                    <ul>
                      <li>
                        <a href="#">
                          <img
                            src="https://res.ivivu.com/hotel/img/vic.png"
                            alt=""
                          />
                        </a>
                      </li>
                    </ul>
                  </div>
                </div>
                <div class="row">
                  <div class="col-12 col-md-8">
                    <p class="mb-3 mt-5 text-secondary font-weight-bold">
                      &copy 2020 - ?????i l?? Du l???ch Tr???c tuy???n H??ng ?????u Vi???t Nam 2020
                    </p>
                    <p class="text-secondary">
                      DKKD: 0312788481, Ng??y c???p: 21/05/2014, S??? k??? ho???ch ?????u t??
                      th??nh ph??? H??? Ch?? Minh
                    </p>
                    <ul>
                      <li class="text-secondary my-1" style="font-size: 13px;">
                        <i class="fas fa-map-marker-alt text-secondary"></i> HCM: L???u 2, T??a nh??
                        Anh ????ng, 215 Nam K??? Kh???i Ngh??a, Ph?????ng 7, Qu???n 3, Tp. H???
                        Ch?? Minh
                      </li>
                      <li class="text-secondary my-1" style="font-size: 13px;">
                        <i class="fas fa-map-marker-alt text-secondary"></i> HN: T???ng 1, T??a nh??
                        Ladeco, 266 ?????i C???n, Ph?????ng Li???u Giai, Qu???n Ba ????nh, H?? N???i
                      </li>
                      <li class="text-secondary my-1" style="font-size: 13px;">
                        <i class="fas fa-map-marker-alt text-secondary"></i> C???n Th??: T???ng 7 - T??a
                        nh?? STS - 11B ?????i L??? H??a B??nh, P. T??n An, Q. Ninh Ki???u, TP.
                        C???n Th??
                      </li>
                    </ul>
                  </div>
                  <div class="col-12 col-md-4">
                    <ul>
                      <li class="font-weight-bold text-secondary">B???n c???n tr??? gi??p? H??y g???i ngay</li>
                      <li><a href="#" class="text-warning" style="font-size: 20px;"><i class="fas fa-phone-alt"></i> 1900 2045</a></li>
                      <li><a href="#" class="text-secondary">T?? v???n v???i Olivia - chatbot c???a ch??ng t??i</a></li>
                      <li>
                        <p class="font-weight-bold">?????t ph??ng d??? d??ng h??n qua ???ng d???ng c???a ch??ng t??i</p>
                        <img src="https://cdn1.ivivu.com/app-icon/iVIVUcode.png" alt="" width="60">
                        <img class="d-inline-block" src="https://cdn1.ivivu.com/app-icon/tai-appstore.png" alt="">
                        <img class="d-inline-block" src="https://cdn1.ivivu.com/app-icon/tai-google-play.png" alt="">
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
    
          <!-- footer -->
    </div>

   <script src="<c:url value="/resources/js/jquery-3.6.0.js" />"></script>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
      integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
      integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
      crossorigin="anonymous"
    ></script>
  
    
 <script src="<c:url value="/resources/js/swiper-bundle.min.js" />"></script>
    <script src="<c:url value="/resources/js/script.js" />"></script>
    <script>
      $(document).ready(function () {
        $(".pass_show").append(
          '<span class="ptxt" style="font-size: 12px;">Show</span>'
        );
      });

      $(document).on("click", ".pass_show .ptxt", function () {
        $(this).text($(this).text() == "Show" ? "Hide" : "Show");

        $(this)
          .prev()
          .attr("type", function (index, attr) {
            return attr == "password" ? "text" : "password";
          });
      });
    </script>
  </body>
</html>
