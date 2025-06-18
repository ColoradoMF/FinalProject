package com.skilldistillery.fuel4less.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.fuel4less.entities.GasStation;
import com.skilldistillery.fuel4less.entities.User;
import com.skilldistillery.fuel4less.repositories.GasStationRepository;
import com.skilldistillery.fuel4less.repositories.UserRepository;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserRepository userRepo;
	
	@Autowired
	private GasStationRepository gasStationRepo;

	@Override
	public User getUserById(int id) {
		return userRepo.findById(id).orElse(null);
	}

	@Override
	public User createUser(User user) {
		return userRepo.save(user);
	}

	@Override
	public User updateUser(String username, User updatedUser) {
		User existUser = userRepo.findByUsername(username);
		if(existUser != null) {
//			if(updatedUser.getUsername() != "" && updatedUser.getUsername() != null) {
//				existUser.setUsername(updatedUser.getUsername());				
//			}
//			if(updatedUser.getPassword() != "" && updatedUser.getPassword() != null) {
//				existUser.setPassword(updatedUser.getPassword());				
//			}
			existUser.setBiography(updatedUser.getBiography());
			existUser.setEmail(updatedUser.getEmail());
			existUser.setFirstName(updatedUser.getFirstName());
			existUser.setLastName(updatedUser.getLastName());
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

	@Override
	public void addFavoriteGasStation(String username, int gasStationId) {
		User user = userRepo.findByUsername(username);
		GasStation gasStation = gasStationRepo.findById(gasStationId).orElse(null);
		if (user != null && gasStation != null) {
			user.addFavoriteGasStation(gasStation);
			userRepo.saveAndFlush(user);
		}
	}

	@Override
	public void removeFavoriteGasStation(String username, int gasStationId) {
		User user = userRepo.findByUsername(username);
		GasStation gasStation = gasStationRepo.findById(gasStationId).orElse(null);
		if (user != null && gasStation != null) {
			user.removeFavoriteGasStation(gasStation);
			userRepo.saveAndFlush(user);
		}
		
	}

 

}
