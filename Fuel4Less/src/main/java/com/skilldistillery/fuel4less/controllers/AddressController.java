package com.skilldistillery.fuel4less.controllers;


import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.fuel4less.entities.Address;
import com.skilldistillery.fuel4less.services.AddressService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@RestController
@CrossOrigin({"*", "http://localhost/"})
public class AddressController {
	
	@Autowired
	private AddressService addressService;
	
	
	@PostMapping("gasStations/{gasStationId}")
    public Address create(Principal principal, HttpServletRequest req, HttpServletResponse res,@RequestBody Address address, @RequestBody int addressId) {
		address  = addressService.createAddress(principal.getName(), address);
		try {
			if (address != null) {
				res.setHeader("Location", req.getRequestURL().append("/").append(address.getId()).toString());
				res.setStatus(HttpServletResponse.SC_CREATED);
			} else {
				res.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			}
		} catch (Exception e) {
			res.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			e.printStackTrace();
		}
        return address;
    }
	
	
}
