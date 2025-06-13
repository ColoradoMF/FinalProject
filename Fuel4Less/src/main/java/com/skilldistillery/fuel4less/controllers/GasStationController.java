package com.skilldistillery.fuel4less.controllers;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.fuel4less.entities.GasStation;
import com.skilldistillery.fuel4less.services.GasStationService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@CrossOrigin({"*", "http://localhost/"})
@RequestMapping("api")
@RestController
public class GasStationController {
	
	@Autowired
	private GasStationService gasStationService;
	
	@GetMapping("gasStations/search/{zipCode}")
	public List<GasStation> index(
				Principal principal, 
				HttpServletRequest req, 
				HttpServletResponse res,
				@PathVariable("zipCode") String zipCode) {
		List<GasStation> gasStations = gasStationService.searchByZipCode(zipCode);
		if(gasStations.size() == 0) {
			res.setStatus(HttpServletResponse.SC_NOT_FOUND);
		}
		return gasStations;

	}
}
