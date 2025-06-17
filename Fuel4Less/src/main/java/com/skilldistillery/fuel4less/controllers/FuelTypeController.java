package com.skilldistillery.fuel4less.controllers;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.fuel4less.entities.FuelType;
import com.skilldistillery.fuel4less.services.FuelTypeService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@CrossOrigin({"*", "http://localhost/"})
@RestController
@RequestMapping("api")
public class FuelTypeController {
	
	@Autowired
	FuelTypeService fuelTypeService;
	
	@GetMapping("fuelTypes/{fuelTypeId}")
	public FuelType getRecentPriceReport(Principal principal,
			HttpServletRequest req,
			HttpServletResponse res,
			@PathVariable("fuelTypeId") int fuelTypeId){
		FuelType fuelType = fuelTypeService.findById(fuelTypeId);
			if(fuelType == null) {
				res.setStatus(HttpServletResponse.SC_NOT_FOUND);
			}
		return fuelType;
	}
	
	@GetMapping({"fuelTypes", "fuelTypes/"})
	public List<FuelType> findAllFuelTypes(Principal principal,
			HttpServletRequest req,
			HttpServletResponse res) {
		List<FuelType> fuelTypes = fuelTypeService.findAll();
		if (fuelTypes.size() == 0) {
			res.setStatus(HttpServletResponse.SC_NOT_FOUND);
		}
		return fuelTypes;
	}

}
