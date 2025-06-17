package com.skilldistillery.fuel4less.controllers;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.fuel4less.entities.User;
import com.skilldistillery.fuel4less.services.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@RestController
@CrossOrigin({"*", "http://localhost/"})
@RequestMapping("api")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("users/{userId}")
	public User show(
			Principal principal,
			HttpServletRequest req,
			HttpServletResponse res,
			@PathVariable("userId") int userId) {
		User user = userService.findById(userId);
		if(user == null) {
			res.setStatus(HttpServletResponse.SC_NOT_FOUND);
		}
		
		return user;
		
	}
	

}
