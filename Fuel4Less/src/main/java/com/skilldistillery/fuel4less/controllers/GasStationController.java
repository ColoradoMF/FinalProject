package com.skilldistillery.fuel4less.controllers;

import java.security.Principal;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.fuel4less.entities.GasStation;
import com.skilldistillery.fuel4less.repositories.GasStationRepository;
import com.skilldistillery.fuel4less.services.GasStationService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@CrossOrigin({"*", "http://localhost/"})
@RequestMapping("api")
@RestController
public class GasStationController {
	
	@Autowired
	private GasStationService gasStationService;
	
	@Autowired
	private GasStationRepository gasStationRepo;
	
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
	
	@GetMapping("gasStations/{gasStationId}")
	public GasStation show(
			Principal principal,
			HttpServletRequest req,
			HttpServletResponse res,
			@PathVariable("gasStationId") int gasStationId) {
		GasStation gasStation = gasStationService.findById(gasStationId);
		if(gasStation == null) {
			res.setStatus(HttpServletResponse.SC_NOT_FOUND);
		}
		
		return gasStation;
		
	}
	@PostMapping
    public ResponseEntity<GasStation> createGasStation(@RequestBody GasStation gasStation) {
        gasStation.setCreatedDate(LocalDateTime.now());
        gasStation.setUpdateDate(LocalDateTime.now());


        GasStation saved = gasStationRepo.save(gasStation);
        return new ResponseEntity<>(saved, HttpStatus.CREATED);
    }
}
