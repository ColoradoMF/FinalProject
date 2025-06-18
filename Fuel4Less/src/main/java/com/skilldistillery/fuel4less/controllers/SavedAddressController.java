package com.skilldistillery.fuel4less.controllers;


import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.fuel4less.entities.SavedAddress;
import com.skilldistillery.fuel4less.entities.SavedAddressId;
import com.skilldistillery.fuel4less.services.SavedAddressService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@RestController
@RequestMapping("api")
@CrossOrigin({"*", "http://localhost/"})
public class SavedAddressController {
	
	@Autowired
	private SavedAddressService savedAddressService;
	
	
	@PostMapping("savedAddresses")
    public SavedAddress create(Principal principal, HttpServletRequest req, HttpServletResponse res,@RequestBody SavedAddress savedAddress) {
		savedAddress  = savedAddressService.createSavedAddress(principal.getName(), savedAddress);
		try {
			if (savedAddress != null) {
				res.setHeader("Location", req.getRequestURL().append("/").append(savedAddress.getId()).toString());
				res.setStatus(HttpServletResponse.SC_CREATED);
			} else {
				res.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			}
		} catch (Exception e) {
			res.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			e.printStackTrace();
		}
        return savedAddress;
    }
	
	@DeleteMapping("savedAddresses/{addressId}")
	public void destroy(Principal principal, HttpServletResponse res, @PathVariable("addressId") int addressId) {
		boolean result = savedAddressService.deleteSavedAddress(principal.getName(), addressId);
        if (result) {
        	res.setStatus(HttpServletResponse.SC_NO_CONTENT); //204
        
        } else {
        	res.setStatus(HttpServletResponse.SC_NOT_FOUND); //404
     
        }
	}
	
	
	
}
