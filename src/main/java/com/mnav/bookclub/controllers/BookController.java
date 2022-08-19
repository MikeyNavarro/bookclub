package com.mnav.bookclub.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.mnav.bookclub.models.Book;
import com.mnav.bookclub.models.User;
import com.mnav.bookclub.services.BookService;
import com.mnav.bookclub.services.UserService;

@Controller
public class BookController {

	@Autowired
	UserService userService;

	@Autowired
	BookService bookService;

	@GetMapping("/dashboard")
	public String dashboard(Model model, HttpSession session) {
		User user = userService.findById((Long) session.getAttribute("userId"));
		model.addAttribute("user", user);
		model.addAttribute("allBooks", bookService.fetchAllBooks());
		return "dashboard.jsp";
	}

//	When passing an empty form I use model attribute

	@GetMapping("/book/create")
	public String createBook(Model model, HttpSession session, @ModelAttribute("book") Book book) {
		model.addAttribute("userId", session.getAttribute("userId"));
		return "book.jsp";
	}

	@PostMapping("/book/insert")
	public String insertBook(@Valid @ModelAttribute("book") Book book, BindingResult result, Model model) {

		if (result.hasErrors()) {
			model.addAttribute("allBooks", bookService.fetchAllBooks());
			return "book.jsp";
		}
		bookService.saveBook(book);
		return "redirect:/dashboard";
	}

	@GetMapping("/book/{id}/show")
	public String showOneBook(Model model, @PathVariable("id") Long id) {
		model.addAttribute("book", bookService.getOneBook(id));
		return "oneBook.jsp";
	}

	@GetMapping("/book/{id}/edit")

	public String editBook(@PathVariable("id") Long id, Model model, @ModelAttribute("book") Book book) {
		model.addAttribute("book", bookService.getOneBook(id));
		return "editBook.jsp";
	}

	@PutMapping("/book/{id}/update")
	public String updateBook(@Valid @ModelAttribute("book") Book book, BindingResult result,
	Model model){
		if(result.hasErrors()) return "editBook.jsp";
		bookService.saveBook(book);
		return "redirect:/dashboard";
	}

	@DeleteMapping("/book/{id}/delete")
	public String deleteBook(@PathVariable("id") Long id) {
		Book book = bookService.getOneBook(id);
		bookService.removeBook(book);
		return "redirect:/dashboard";

	}
}
