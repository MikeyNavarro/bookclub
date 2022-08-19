package com.mnav.bookclub.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.mnav.bookclub.models.LoginUser;
import com.mnav.bookclub.models.User;
import com.mnav.bookclub.services.UserService;

@Controller
public class UserController {

	@Autowired UserService userService;

	// ---------------------Show Register and Login Form
	// Method------------------------------

	@GetMapping("/")
	public String index(Model model) {
		// We are passing an empty user for our register form:form
		model.addAttribute("user", new User());
		// We are passing an empty loginUser for our register form:form
		model.addAttribute("loginUser", new LoginUser());
		return "index.jsp";
	}

	// ---------------------Filled Out Register Form
	// Method------------------------------

//		When dealing with a post form we need to check if their info they gave us is valid, We will use Session to set our userID to the New User Id and ultimetly redirect. We will also be checking for errors so we need Binding result result

	@PostMapping("/users/register")
	public String registerUser(Model model, HttpSession session, @Valid @ModelAttribute("user") User user,
			BindingResult result) {

		// We create a variable newUser that is equal to our service register method

		User newUser = userService.register(user, result);

		if (result.hasErrors()) {
			model.addAttribute("loginUser", new LoginUser());
			return "index.jsp";
		}

		session.setAttribute("userId", newUser.getId());
		return "redirect:/dashboard";
	}
// --------------------------Filled Out Login Form Method-------------------------

	@PostMapping("/users/login")
	public String login(Model model, HttpSession session, @Valid @ModelAttribute("loginUser") LoginUser loginUser,
			BindingResult result) {
		User loggedInUser = userService.login(loginUser, result);
		if (result.hasErrors()) {
			model.addAttribute("user", new User());
			return "index.jsp";
		}
		session.setAttribute("userId", loggedInUser.getId());
		session.setAttribute("firstName", loggedInUser.getFirstName());
		return "redirect:/dashboard";
	}

	// -------------------------------------Logout-------------------------------------------

//		clear session and return them to the home screen 

	@GetMapping("/users/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
}
