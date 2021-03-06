package spring.ojt.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.ojt.entity.BookingDetailEntity;
import spring.ojt.entity.BookingRoomEntity;
import spring.ojt.entity.BookingStatusEntity;
import spring.ojt.entity.CustomersEntity;
import spring.ojt.entity.PaymentEntity;
import spring.ojt.entity.RoomEntity;
import spring.ojt.entity.ServiceEntity;
import spring.ojt.model.EmailDTO;
import spring.ojt.repository.BookingDetailsRepository;
import spring.ojt.repository.BookingStatusRepository;
import spring.ojt.repository.CustomerRepository;
import spring.ojt.repository.RoomRepository;
import spring.ojt.repository.ServiceRepository;
import spring.ojt.service.BookingDetailsService;
import spring.ojt.service.BookingRoomService;
import spring.ojt.service.CreditService;
import spring.ojt.service.HotelService;
import spring.ojt.service.PaymentService;
import spring.ojt.service.RoomService;
import spring.ojt.service.SendMailService;
import spring.ojt.service.ServiceService;
import spring.ojt.service.TourService;

@Controller
public class PaymentHotelController {
	@Autowired
	public HotelService hotelService;

	@Autowired
	public TourService tourService;

	@Autowired
	RoomService roomService;

	@Autowired
	CreditService creditService;

	@Autowired
	RoomRepository roomRepository;

	@Autowired
	BookingDetailsService bookingDetailsService;

	@Autowired
	BookingRoomService bookingRoomService;

	@Autowired
	CustomerRepository customerRepository;

	@Autowired
	ServiceRepository serviceRepository;

	@Autowired
	ServiceService serviceService;

	@Autowired
	PaymentService paymentService;

	@Autowired
	public SendMailService sendMailService;

	@Autowired
	BookingStatusRepository bookingStatusRepository;

	@Autowired
	BookingDetailsRepository bookingDetailsRepository;

	BookingStatusEntity bookingStatusEntity = new BookingStatusEntity();
	BookingRoomEntity bookingRoomEntity = new BookingRoomEntity();

	@GetMapping("/paymentHotel")
	public String bookingDetail(Model model, @RequestParam(name = "id") int id, HttpSession session) {

		Optional<RoomEntity> room1 = roomRepository.findById(id);
		model.addAttribute("room1", room1.get());
		CustomersEntity customersEntity = new CustomersEntity();
//		BookingRoomEntity bookingRoomEntity = new BookingRoomEntity();
		BookingDetailEntity bookingDetailEntity = new BookingDetailEntity();

//		BookingStatusEntity bookingStatusEntity = new BookingStatusEntity();
		bookingStatusEntity.setId(2);
		String email = (String) session.getAttribute("email");

//		String email = (String) session.getAttribute("email");
		customersEntity.setMail((String) session.getAttribute("email"));

//		LocalDate localDate = LocalDate.now();
//		
//        
//       bookingRoomEntity.setStartDate(localDate.plusDays(1));
//       bookingRoomEntity.setEndDate(localDate.plusDays(2));

		LocalDate startDate = (LocalDate) session.getAttribute("startDate");
		LocalDate endDate = (LocalDate) session.getAttribute("endDate");

		bookingRoomEntity.setStartDate(startDate);
		bookingRoomEntity.setEndDate(endDate);

		bookingRoomEntity.setBookingStatusEntity(bookingStatusEntity);

		bookingRoomEntity.setCustomersEntity(customersEntity);
		bookingDetailEntity.setBookingRoomEntity(bookingRoomEntity);

		// bookingDetailEntity.setRoomEntity(room1.get());
		model.addAttribute("bookingDetail", bookingDetailEntity);

		List<ServiceEntity> serviceEntity = serviceService.findAllService();
		model.addAttribute("serviceEntity", serviceEntity);

		session.removeAttribute("startDate");
		session.removeAttribute("endDate");
		return "paymentHotel";

	}

	@Transactional
	@PostMapping("/paymentHotel2")
	public String addDoBooking(Model model,
			@ModelAttribute(name = "bookingDetail") @Valid BookingDetailEntity bookingDetail, BindingResult result,
			@RequestParam(name = "id") int id, HttpSession session) {

		Optional<RoomEntity> room1 = roomRepository.findById(id);
		List<ServiceEntity> serviceEntity = serviceService.findAllService();
		bookingDetail.setRoomEntity(room1.get());
		bookingDetail.setId(0);
		if (result.hasErrors()) {

			model.addAttribute("room1", room1.get());

			model.addAttribute("serviceEntity", serviceEntity);
			
			return "paymentHotel";
		} else if (bookingDetail.getBookingRoomEntity().getStartDate()
				.isAfter(bookingDetail.getBookingRoomEntity().getEndDate())
				|| bookingDetail.getBookingRoomEntity().getStartDate()
						.isEqual(bookingDetail.getBookingRoomEntity().getEndDate())) {
			model.addAttribute("message", "Start Date is less than End Date ");

			model.addAttribute("room1", room1.get());
			model.addAttribute("serviceEntity", serviceEntity);
			return "paymentHotel";

		}else if (((bookingDetail.getBookingRoomEntity().getNumOfAdults() + bookingDetail.getBookingRoomEntity().getNumOfChild()))  > (bookingDetail.getBookingRoomEntity().getQuantity()*3) ) {
			model.addAttribute("message1", "The Quantity is not valid, Please check again");

			model.addAttribute("room1", room1.get());
			model.addAttribute("serviceEntity", serviceEntity);
			return "paymentHotel";
		}
	//System.out.println(((bookingDetail.getBookingRoomEntity().getNumOfAdults() + bookingDetail.getBookingRoomEntity().getNumOfChild()))  > (bookingDetail.getBookingRoomEntity().getQuantity()*3));

		customerRepository.save(bookingDetail.getBookingRoomEntity().getCustomersEntity());
		bookingRoomService.saveBooking(bookingDetail.getBookingRoomEntity());
		bookingDetailsService.saveBookingDetail(bookingDetail);

		session.setAttribute("quantity", bookingDetail.getBookingRoomEntity().getQuantity());
		session.setAttribute("adult", bookingDetail.getBookingRoomEntity().getNumOfAdults());
		session.setAttribute("child", bookingDetail.getBookingRoomEntity().getNumOfChild());
		session.setAttribute("nameroom", bookingDetail.getRoomEntity().getName());
		session.setAttribute("booking", bookingDetail.getBookingRoomEntity());
		session.setAttribute("customer", bookingDetail.getBookingRoomEntity().getCustomersEntity());
		session.setAttribute("service", bookingDetail.getBookingRoomEntity().getServiceEntity());
		session.setAttribute("bookingDetail", bookingDetail);
		session.setAttribute("totalPrice", bookingDetail.getBookingRoomEntity().getTotalPrice());
		session.setAttribute("status", bookingDetail.getBookingRoomEntity().getBookingStatusEntity().getId());
		session.setAttribute("startDate", bookingDetail.getBookingRoomEntity().getStartDate());
		session.setAttribute("endDate", bookingDetail.getBookingRoomEntity().getEndDate());
		session.setAttribute("nameHotel", bookingDetail.getRoomEntity().getHotelEntity().getTen());
		session.setAttribute("address", bookingDetail.getRoomEntity().getHotelEntity().getDiaChi());
		model.addAttribute("creditCard", new PaymentEntity());
		return "creaditCard";
	}

	@PostMapping("/doCredit")
	public String doCredit(Model model, @ModelAttribute(name = "creditCard") @Valid PaymentEntity creaditCard,
			BindingResult result, HttpSession session) {

		BookingRoomEntity booking = (BookingRoomEntity) session.getAttribute("booking");
		BookingDetailEntity bookingDetail = (BookingDetailEntity) session.getAttribute("bookingDetail");
		Long totalPrice = (Long) session.getAttribute("totalPrice");

		session.getAttribute("nameroom");
		session.getAttribute("quantity");
		session.getAttribute("adult");
		session.getAttribute("child");
		session.getAttribute("startDate");
		session.getAttribute("endDate");
		session.getAttribute("nameHotel");
		session.getAttribute("service");
		session.getAttribute("status");
		session.getAttribute("address");
		if (result.hasErrors()) {

			return "creaditCard";
		} else if (result.hasErrors() || totalPrice > creaditCard.getCreditCardEntity().getBalance()) {
			model.addAttribute("message", "S??? d?? c???a b???n kh??ng ????? ????? thanh to??n, vui l??ng ki???m tra l???i t??i kho???n");

			return "creaditCard";
		}
		{
			Long newBlance = creaditCard.getCreditCardEntity().getBalance() - totalPrice;
			creaditCard.getCreditCardEntity().setBalance(newBlance);
		}

		session.setAttribute("status", 1);
		paymentService.savePayment(creaditCard);

		bookingStatusEntity.setId(1);
		booking.setBookingStatusEntity(bookingStatusEntity);

		bookingDetailsService.saveBookingDetail(bookingDetail);

		EmailDTO emaildto = new EmailDTO();
		emaildto.setSubject("C???m ??n " + bookingDetail.getBookingRoomEntity().getCustomersEntity().getFullName()
				+ " ! ?????t ph??ng c???a b???n ??? " + bookingDetail.getRoomEntity().getHotelEntity().getTen()
				+ " ???? ???????c x??c nh???n");
		emaildto.setTo(bookingDetail.getBookingRoomEntity().getCustomersEntity().getMail());
		emaildto.setText("Chi ti???t ?????t ph??ng : \n" + "T??n ph??ng : " + bookingDetail.getRoomEntity().getName() + "\n"
				+ "Nh???n ph??ng : " + bookingDetail.getBookingRoomEntity().getStartDate() + " (14:00 - 00:00)" + "\n"
				+ "Tr??? ph??ng : " + bookingDetail.getBookingRoomEntity().getEndDate() + " (00:00 - 12:00)" + "\n"
				+ "B???n ???? ?????t cho : " + bookingDetail.getBookingRoomEntity().getNumOfAdults() + " ng?????i l???n, "
				+ bookingDetail.getBookingRoomEntity().getNumOfChild() + " tr??? em " + "\n" + "?????a ??i???m : "
				+ bookingDetail.getRoomEntity().getHotelEntity().getDiaChi() + "\n"
				+ "Ch??nh s??ch H???y ?????t ph??ng : Li??n h??? v???i ch??ng t??i theo s??? ??i???n tho???i : 0979797979. B???n c?? th??? h???y ?????t ph??ng mi???n ph?? ?????n 14:00 ng??y nh???n ph??ng. B???n s??? ph???i tr??? to??n b??? ti???n ph??ng n???u b???n h???y sau 14:00 ng??y nh???n ph??ng."
				+ "\n" + "Ph?? hu??? ph??ng : ?????n " + bookingDetail.getBookingRoomEntity().getStartDate()
				+ " 14:00 . ?????t ph??ng n??y kh??ng ho??n ti???n. B???n kh??ng th??? ?????i ng??y cho k??? ngh??? c???a m??nh." + "\n"
				+ "T???ng gi?? ph??ng : " + bookingDetail.getBookingRoomEntity().getTotalPrice() + " VND.");

		sendMailService.sendSimpleMessage(emaildto);

//		session.removeAttribute("bookingDetail");
		session.invalidate();
		return "successPayment";
	}

}
