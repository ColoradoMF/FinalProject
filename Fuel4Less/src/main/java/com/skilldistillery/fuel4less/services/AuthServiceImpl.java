package com.skilldistillery.fuel4less.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.skilldistillery.fuel4less.entities.User;
import com.skilldistillery.fuel4less.repositories.UserRepository;

@Service
public class AuthServiceImpl implements AuthService {
	
	@Autowired
	private UserRepository userRepo;
	
	@Autowired
	private PasswordEncoder encoder;
	
	@Override
	public User register(User user) {
//		user.setEnabled(true);
//		user.setRole("standard");
//		String encrypted = encoder.encode(user.getPassword());
//		user.setPassword(encrypted);
		return userRepo.saveAndFlush(user);
	}

	@Override
	public User getUserByUsername(String username) {
		return userRepo.findByUsername(username);
	}

}
