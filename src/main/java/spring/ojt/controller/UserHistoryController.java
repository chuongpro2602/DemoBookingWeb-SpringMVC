package spring.ojt.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.ojt.entity.BookingRoomEntity;
import spring.ojt.entity.RoleEntity;
import spring.ojt.entity.UserEntity;
import spring.ojt.repository.BookingRoomRepository;
import spring.ojt.service.BookingRoomService;
import spring.ojt.service.UserService;

@Controller
@RequestMapping("/user")
public class UserHistoryController {

	@Autowired
	BookingRoomRepository bookingRoomRepository;

	@Autowired
	BookingRoomService bookingRoomService;

	@Autowired
	UserService userService;

	@GetMapping({ "/history", "/" })
	public String doShowHistory(Model model, HttpSession session) {

		String email = (String) session.getAttribute("email");
		List<BookingRoomEntity> bookingRoomEntityList = bookingRoomService.findAllByMail(email);

		model.addAttribute("bookingRoomEntityList", bookingRoomEntityList);
		return "table-bookinguser";
	}

	@GetMapping({ "/accountUser" })
	public String accountUser(Model model, HttpSession session) {

		String email = (String) session.getAttribute("email");
		Optional<UserEntity> user = Optional.of(userService.findByEmail(email));

		model.addAttribute("user", user.get());

		return "updateUserInformation";
	}

	@PostMapping(value = "/doUpdateAccountUser")
	public String doUpdateAccountUser(Model model, @ModelAttribute(name = "user") @Valid UserEntity user,
			BindingResult result, @RequestParam("email") String email, @RequestParam("username") String username) {
//		List<UserEntity> list = userService.findAllUser();
//		for (UserEntity userEntity : list) {
//			if (result.hasErrors() || user.getPassword().equals(user.getConfirmPassword()) == false) {
//				model.addAttribute("user", user);
//				model.addAttribute("message", "Passwords don't match");
//				return "updateUser";
//
//			} else if (result.hasErrors() || userEntity.getEmail().equalsIgnoreCase(email)) {
//				model.addAttribute("message2", " Email " + email + " is exist");
//				return "updateUser";
//			} else if (result.hasErrors() || userEntity.getUsername().equalsIgnoreCase(username)) {
//				model.addAttribute("message1", " Username " + username + " is exist");
//				return "updateUser";
//
//			}
//		}
		if (result.hasErrors() || user.getPassword().equals(user.getConfirmPassword()) == false) {
			model.addAttribute("user", user);
			model.addAttribute("message", "Passwords don't match");
			return "updateUserInformation";
		}
//			hotel1.getAddressEntity().setId(hotel1.getId());
		// tour1.setUrlImage1(saveFile(photo));
		userService.saveUser1(user);
		List<BookingRoomEntity> bookingRoomEntityList = bookingRoomService.findAllByMail(email);

		model.addAttribute("bookingRoomEntityList", bookingRoomEntityList);
		return "table-bookinguser";
	}

//	@GetMapping("/doSearch6")
//	public String doSearch6(Model model, @RequestParam(name = "keyword") String keyword) {
//		List<BookingRoomEntity> bookingRoomEntityList = bookingRoomService.findByKeyword(keyword);
//		model.addAttribute("bookingRoomEntityList", bookingRoomEntityList);
//		return "table-bookinguser";
//	}
//	private static int FIRST_PAGE = 1;
//	
//	@GetMapping({"/history", "/" } )
//	public String getProducts(Model model, HttpSession session) {
//		String email = (String) session.getAttribute("email");
//		List<BookingRoomEntity> bookingRoomEntityList = bookingRoomService.findAllByMail(email);
//		
//
//		model.addAttribute("currentPage", FIRST_PAGE);
//		model.addAttribute("totalPage", bookingRoomService.getProductsPaging(FIRST_PAGE).getTotalPages());
//		model.addAttribute("totalItems", bookingRoomService.getProductsPaging(FIRST_PAGE).getTotalElements());
//		model.addAttribute("bookingRoomEntityList", bookingRoomService.getProductsPaging(FIRST_PAGE).getContent());
//		// Cai nay la setting path cua cai @GetMapping("/product")
//		model.addAttribute("path", "user/history");
//		return "table-bookinguser";
//	}
//
//	@GetMapping("/history/{page}")
//	public String getProductsPaging(Model model, @PathVariable(name = "page") int pageNum, HttpSession session) {
//		
//		String email = (String) session.getAttribute("email");
//		List<BookingRoomEntity> bookingRoomEntityList = bookingRoomService.findAllByMail(email);
//		
//
//		model.addAttribute("currentPage", pageNum);
//		model.addAttribute("totalPage", bookingRoomService.getProductsPaging(pageNum).getTotalPages());
//		model.addAttribute("totalItems", bookingRoomService.getProductsPaging(pageNum).getTotalElements());
//		model.addAttribute("bookingRoomEntityList", bookingRoomService.getProductsPaging(pageNum).getContent());
//		// Cai nay la setting path cua cai @GetMapping("/product")
//		model.addAttribute("path", "user/history");
//		return "table-bookinguser";
//	}
}
