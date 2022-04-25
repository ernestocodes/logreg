package com.ernesto.logreg.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.ernesto.logreg.models.LoginUser;
import com.ernesto.logreg.models.User;
import com.ernesto.logreg.repositories.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepo;

	public User register(User newUser, BindingResult result) {
		Optional<User> potentialUser = userRepo.findByEmail(newUser.getEmail());
		// 1 if email is present ->reject
		if (potentialUser.isPresent()) {
			result.rejectValue("email", "unique", "Email already exists.");
		}
		// 2 check password !== confirm ->reject
		if (!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("password", "matches", "Password and confirm password do not match.");
		}
		// 3 if result has errors -> leave method w/out saving
		if (result.hasErrors()) {
			return null;
		}
		// 4 if everything is good, hash and set p/w
		String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
		newUser.setPassword(hashed);
		return userRepo.save(newUser);
	}

	public User login(LoginUser newLogin, BindingResult result) {
		// Find user in the DB by email
		Optional<User> potentialUser = userRepo.findByEmail(newLogin.getEmail());
		// Reject if NOT present
		if (!potentialUser.isPresent()) {
			result.rejectValue("email", "unique", "Unrecognized email.");
			return null;
		}
		// Reject if BCrypt password match fails
		// get user from database
		User user = potentialUser.get();
		if (!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
			result.rejectValue("password", "matches", "Invalid Password!");
		}
		// Return null if result has errors
		if (result.hasErrors()) {
			return null;
		}
		// Otherwise, return the user object
		return user;
	}

	public User findOneUser(Long id) {
		Optional<User> optionalUser = userRepo.findById(id);
		if (optionalUser.isPresent()) {
			return optionalUser.get();
		} else {
			return null;
		}
	}
}
