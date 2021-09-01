package spring.ojt.controller;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.ojt.common.DownloadFileUlti;
import spring.ojt.entity.BookingDetailEntity;
import spring.ojt.entity.BookingRoomEntity;
import spring.ojt.entity.BookingStatusEntity;
import spring.ojt.entity.ServiceEntity;
import spring.ojt.repository.BookingDetailsRepository;
import spring.ojt.repository.BookingRoomRepository;
import spring.ojt.repository.BookingStatusRepository;
import spring.ojt.repository.CustomerRepository;
import spring.ojt.service.BookingDetailsService;
import spring.ojt.service.BookingRoomService;
import spring.ojt.service.RoomService;
import spring.ojt.service.ServiceService;

@Controller
@RequestMapping("/staff")
public class BookingManagementController {

	@Autowired
	BookingDetailsService bookingDetailsService;

	@Autowired
	BookingDetailsRepository bookingDetailsRepository;

	@Autowired
	ServiceService serviceService;
	
	@Autowired
	BookingStatusRepository bookingStatusRepository;
	
	@Autowired
	BookingRoomRepository bookingRoomRepository;
	
	
	@Autowired
	BookingRoomService bookingRoomService;

	@Autowired
	CustomerRepository customerRepository;
	
	@Autowired
	RoomService roomService;
	private static int FIRST_PAGE = 1;

	@GetMapping({ "/bookingAdmin" })
	public String getProducts(Model model) {
//		List<BookingDetailEntity> bookingDetailEntity = bookingDetailsService.findAllBookingDetail();
//		model.addAttribute("bookingDetailEntity", bookingDetailEntity);
		model.addAttribute("currentPage", FIRST_PAGE);
		model.addAttribute("totalPage", bookingDetailsService.getProductsPaging(FIRST_PAGE).getTotalPages());
		model.addAttribute("totalItems", bookingDetailsService.getProductsPaging(FIRST_PAGE).getTotalElements());
		model.addAttribute("bookingDetailEntity", bookingDetailsService.getProductsPaging(FIRST_PAGE).getContent());
		// Cai nay la setting path cua cai @GetMapping("/product")
		model.addAttribute("path", "staff/bookingAdmin");
		return "table-booking";
	}

	@GetMapping("/bookingAdmin/{page}")
	public String getProductsPaging(Model model, @PathVariable(name = "page") int pageNum) {
//		List<BookingDetailEntity> bookingDetailEntity = bookingDetailsService.findAllBookingDetail();
//		model.addAttribute("bookingDetailEntity", bookingDetailEntity);
		model.addAttribute("currentPage", pageNum);
		model.addAttribute("totalPage", bookingDetailsService.getProductsPaging(pageNum).getTotalPages());
		model.addAttribute("totalItems", bookingDetailsService.getProductsPaging(pageNum).getTotalElements());
		model.addAttribute("bookingDetailEntity", bookingDetailsService.getProductsPaging(pageNum).getContent());
		// Cai nay la setting path cua cai @GetMapping("/product")
		model.addAttribute("path", "staff/bookingAdmin");
		return "table-booking";
	}
	
	@GetMapping({ "/bookingAdmin1" })
	public String doShowAdress(Model model) {

		model.addAttribute("currentPage", FIRST_PAGE);
		model.addAttribute("totalPage", bookingRoomService.getProductsPaging(FIRST_PAGE).getTotalPages());
		model.addAttribute("totalItems", bookingRoomService.getProductsPaging(FIRST_PAGE).getTotalElements());
		model.addAttribute("bookingEntity", bookingRoomService.getProductsPaging(FIRST_PAGE).getContent());
		// Cai nay la setting path cua cai @GetMapping("/product")
		model.addAttribute("path", "staff/bookingAdmin1");
		return "table-booking1";
	}
	
	@GetMapping({ "/bookingAdmin1/{page}" })
	public String doShowAdress1(Model model,@PathVariable(name = "page") int pageNum) {

		// hien thi list hotel da luu trong database
//		List<BookingRoomEntity> bookingEntity = bookingRoomService.findAllBooking();
//		model.addAttribute("bookingEntity", bookingEntity);
		model.addAttribute("currentPage", pageNum);
		model.addAttribute("totalPage", bookingRoomService.getProductsPaging(pageNum).getTotalPages());
		model.addAttribute("totalItems", bookingRoomService.getProductsPaging(pageNum).getTotalElements());
		model.addAttribute("bookingEntity", bookingRoomService.getProductsPaging(pageNum).getContent());
		// Cai nay la setting path cua cai @GetMapping("/product")
		model.addAttribute("path", "staff/bookingAdmin1");

		return "table-booking1";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	@GetMapping("/updateBooking")
	public String updateBooking(Model model, @RequestParam(name = "id") int id) {
		// load du lieu theo id can dc update
		Optional<BookingRoomEntity> bookingEntity = bookingRoomRepository.findById(id);
		model.addAttribute("bookingEntity", bookingEntity.get());
		// hien thi list adress da luu trong database
		List<ServiceEntity> serviceEntity = serviceService.findAllService();
		model.addAttribute("serviceEntity", serviceEntity);
		List<BookingStatusEntity> status = bookingStatusRepository.findAll();
		model.addAttribute("status", status);
		return "updateBooking1";
	}
	@PostMapping("/doUpdateBooking")
	public String doUpdateBooking(Model model,
			@ModelAttribute(name = "bookingEntity") @Valid BookingRoomEntity bookingEntity,
			BindingResult result) {
		if (result.hasErrors()) {
			List<ServiceEntity> serviceEntity = serviceService.findAllService();
			model.addAttribute("serviceEntity", serviceEntity);
			
			List<BookingStatusEntity> status = bookingStatusRepository.findAll();
			model.addAttribute("status", status);
			return "updateBooking1";
		}	
		customerRepository.save(bookingEntity.getCustomersEntity());
		bookingRoomService.saveBooking(bookingEntity);
	
		return "redirect:/staff/bookingAdmin";

	}
//	@GetMapping("/updateBooking")
//	public String updateBooking(Model model, @RequestParam(name = "id") int id) {
//		// load du lieu theo id can dc update
//		Optional<BookingDetailEntity> bookingDetailEntity = bookingDetailsRepository.findById(id);
//		model.addAttribute("bookingDetailEntity", bookingDetailEntity.get());
//		// hien thi list adress da luu trong database
//		return "updateBooking";
//	}
//
//	@PostMapping("/doUpdateBooking")
//	public String doUpdateBooking(Model model,
//			@ModelAttribute(name = "bookingDetailEntity") @Valid BookingDetailEntity bookingDetailEntity,
//			BindingResult result) {
//		if (result.hasErrors()) {		
//			return "updateBooking";
//		}	
//		
//		bookingDetailsService.saveBookingDetail(bookingDetailEntity);
//	
//		return "redirect:/staff/bookingAdmin";
//
//	}
	@GetMapping("/doSearch5")
	public String doSearch5(Model model, @RequestParam(name = "keyword") String keyword) {
		List<BookingDetailEntity> bookingDetailEntity = bookingDetailsService.findByKeyword(keyword);
		model.addAttribute("bookingDetailEntity", bookingDetailEntity);
		return "table-booking";
	}
	
	@GetMapping("/bookingAdmin/download")
	public void downloadBooking(Model model, HttpServletResponse response, @RequestParam(name ="page") int pageNum) throws IOException{
		try {
			List<BookingDetailEntity> list = bookingDetailsService.getProductsPaging(pageNum).getContent();
			DownloadFileUlti.exportToExcel(list, response,"product");
		}catch (IOException e) {
			e.printStackTrace();
		}
	}
//	public void downloadBooking(Model model, HttpServletResponse response) throws IOException{
//		try {
//		List<BookingDetailEntity> list = bookingDetailsService.findAllBookingDetail();
//			DownloadFileUlti.exportToExcel(list, response,"product");
//		}catch (IOException e) {
//			e.printStackTrace();
//		}
//	}
}