package com.skilldistillery.fuel4less.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.fuel4less.entities.User;
import com.skilldistillery.fuel4less.repositories.UserRepository;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserRepository userRepo;

	@Override
	public User getUserById(int id) {
		return userRepo.findById(id).orElse(null);
	}

	@Override
	public User createUser(User user) {
		return userRepo.save(user);
	}

	@Override
	public User updateUser(int id, User updatedUser) {
		User existUser = userRepo.findById(id).orElse(null);
		if(existUser != null) {
			existUser.setUsername(updatedUser.getUsername());
			existUser.setPassword(updatedUser.getPassword());
			return userRepo.saveAndFlush(existUser);
		}
		return null;
	}

	@Override
	public boolean deleteUser(int id) {
		if(userRepo.existsById(id)) {
			userRepo.deleteById(id);
			return true;
		}
		return false;
	}

	@Override
	public List<User> findAll() {
		return userRepo.findAll();
	}

	@Override
	public User findById(int userId) {
		return userRepo.findById(userId).orElse(null);
	}

 

}
