package com.ernesto.logreg.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.ernesto.logreg.models.LoginUser;
import com.ernesto.logreg.models.User;
import com.ernesto.logreg.services.UserService;

@Controller
public class HomeController {

	@Autowired
	private UserService userServ;

	@GetMapping("/")
	public String index(Model model) {
		// empty newuser and empty login for the forms
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "logreg.jsp";
	}

	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model,
			HttpSession session) {
		// to do some extra validations and create a new user!
		userServ.register(newUser, result);
		if (result.hasErrors()) {
			// check validations
			model.addAttribute("newLogin", new LoginUser());
			return "logreg.jsp";
		}
		// No errors!
		// TO-DO Later: Store their ID from the DB in session,
		// in other words, log them in.
		session.setAttribute("userId", newUser.getId());
		return "redirect:/home";
	}

	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model,
			HttpSession session) {

		// Add once service is implemented:
		User user = userServ.login(newLogin, result);

		if (result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "logreg.jsp";
		}

		// No errors!
		// TO-DO Later: Store their ID from the DB in session,
		// in other words, log them in.
		session.setAttribute("userId", user.getId());
		return "redirect:/home";
	}

	@GetMapping("/home")
	public String showHome(Model model, HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/";
		}
		User user = userServ.findOneUser((Long) session.getAttribute("userId"));
		model.addAttribute("user", user);
		return "index.jsp";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

}
