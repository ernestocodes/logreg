package com.ernesto.logreg.controllers;

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

import com.ernesto.logreg.models.Book;
import com.ernesto.logreg.services.MainService;

@Controller
public class HomeController {
	@Autowired
	private MainService mainServ;

	@GetMapping("/home")
	public String home(Model model, HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		model.addAttribute("books", mainServ.allBooks());
		return "index.jsp";
	}

	@GetMapping("/books/new")
	public String newBookForm(@ModelAttribute("book") Book book) {
		return "newBookForm.jsp";
	}

	@PostMapping("/books/new")
	public String processBookForm(@Valid @ModelAttribute("book") Book book, BindingResult result) {
		if (result.hasErrors()) {
			return "newBookForm.jsp";
		} else {
			mainServ.createBook(book);
			return "redirect:/home";
		}
	}

	@GetMapping("/books/{id}/edit")
	public String editBookForm(Model model, @PathVariable("id") Long id) {
		model.addAttribute("book", mainServ.findOneBook(id));
		return "editBookForm.jsp";
	}

	@PutMapping("/books/{id}/edit")
	public String processEditBook(@Valid @ModelAttribute("book") Book book, BindingResult result) {
		if (result.hasErrors()) {
			return "editBookForm.jsp";
		} else {
			mainServ.updateBook(book);
			return "redirect:/home";
		}
	}

	@DeleteMapping("/books/{id}/delete")
	public String deleteBook(@PathVariable("id") Long id) {
		mainServ.deleteBook(id);
		return "redirect:/home";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@GetMapping("/books/{id}")
	public String showOneBook(@PathVariable("id") Long id, Model model) {
		model.addAttribute("book", mainServ.findOneBook(id));
		return "showOneBook.jsp";
	}
}
