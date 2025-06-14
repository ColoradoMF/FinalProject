package com.skilldistillery.fuel4less.controllers;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.fuel4less.entities.PriceReport;
import com.skilldistillery.fuel4less.services.PriceReportService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@CrossOrigin({"*", "http://localhost/"})
@RestController
@RequestMapping("api")
public class PriceReportController {
	
	@Autowired
	PriceReportService priceReportService;
	
	@GetMapping("priceReport/{priceReportId}")
	public PriceReport getRecentPriceReport(Principal principal,
			HttpServletRequest req,
			HttpServletResponse res,
			@PathVariable("priceReportId") int priceReportId){
		PriceReport priceReport = priceReportService.findById(priceReportId);
			if(priceReport == null) {
				res.setStatus(HttpServletResponse.SC_NOT_FOUND);
			}
		
		return priceReport;
		
	}

}
