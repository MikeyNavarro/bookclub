package com.mnav.bookclub.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.mnav.bookclub.models.LoginUser;
import com.mnav.bookclub.models.User;
import com.mnav.bookclub.repositories.UserRepository;

@Service
public class UserService {

	@Autowired UserRepository userRepository;

	// ---------------------------------Register
	// Method----------------------------------

	public User register(User user, BindingResult result) {

		Optional<User> potentialUser = userRepository.findByEmail(user.getEmail());

		if (potentialUser.isPresent()) {
			result.rejectValue("email", "emailExists", "Email already exists");
		}
		if (!user.getPassword().equals(user.getConfirm())) {
			result.rejectValue("confirm", "noMatch", "passwords must match");
		}
		if (result.hasErrors())
			return null;

		else {
			String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
			user.setPassword(hashed);
			return userRepository.save(user);
		}
	}
	// ---------------------------------Login
	// Method----------------------------------

	public User login(LoginUser loginuser, BindingResult result) {

		Optional<User> potentialUser = userRepository.findByEmail(loginuser.getEmail());

		if (potentialUser.isEmpty()) {
			result.rejectValue("email", "noEmail", "User not found please register");
			return null;
		}
		User user = potentialUser.get();
		if (!BCrypt.checkpw(loginuser.getPassword(), user.getPassword())) {
			result.rejectValue("password", "noMatch", "Incorrect password.");
		}
		if (result.hasErrors())
			return null;
		else
			return user;
	}

	// -----------------------------Find One User Method-------------------------------------

	// We want to be able to find one user, they may not exisit so we create a list
	// variable called optional user equal to my userRepository find by id method

	public User findById(Long id) {
		Optional<User> optionalUser = userRepository.findById(id);
		if (optionalUser.isEmpty())
			return null;
		else
			return optionalUser.get();
	}

}
