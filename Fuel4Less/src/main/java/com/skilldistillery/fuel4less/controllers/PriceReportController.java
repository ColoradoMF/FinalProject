package com.skilldistillery.fuel4less.controllers;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	@GetMapping("gasStations/{gasStationId}/mostRecentReports")
	public List<PriceReport> getMostRecentReports(Principal principal,
			HttpServletRequest req,
			HttpServletResponse res,
			@PathVariable("gasStationId") int gasStationId){
		List<PriceReport> priceReports = priceReportService.getMostRecent(gasStationId);
		return priceReports;
	}	
	
	//TODO
	@PostMapping("gasStations/{gasStationId}/priceReports")
	public PriceReport createPriceReport(Principal principal,
			HttpServletRequest req,
			HttpServletResponse res,
			@PathVariable("gasStationId") int gasStationId,
			@RequestBody PriceReport priceReport) {
		PriceReport createdReport = null;
		try {
			createdReport = priceReportService.createPriceReport(gasStationId, priceReport, principal.getName());
				if(createdReport != null) {
					res.setHeader("location", req.getRequestURL().toString());
					res.setStatus(HttpServletResponse.SC_CREATED);
				} else {
					res.setStatus(HttpServletResponse.SC_BAD_REQUEST);
				}
		} catch (Exception e) {
			res.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			createdReport = null;
			e.printStackTrace();
		}
		return createdReport;
	}

}
