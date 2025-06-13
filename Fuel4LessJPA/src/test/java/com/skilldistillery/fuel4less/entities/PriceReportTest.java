package com.skilldistillery.fuel4less.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class PriceReportTest {
	
	private static EntityManagerFactory emf;
	private static EntityManager em;
	private PriceReport priceReport;
	
	
	@BeforeAll
	 static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("Fuel4LessJPA");
	 }


	 @AfterAll
	 static void tearDownAfterClass() throws Exception {
		 emf.close();
	 }


	 @BeforeEach
	 void setUp() throws Exception {
		 em = emf.createEntityManager();
		 priceReport = em.find(PriceReport.class, 1);
	 }


	 @AfterEach
	 void tearDown() throws Exception {
		 em.close();
		 priceReport = null;
	 }
	 
	@Test
	void test_PriceReport_Entity_mapping() {
		assertNotNull(priceReport);
		assertEquals("these prices stink", priceReport.getRemarks());
	}
	
	@Test
	void test_PriceReport_User_mto_mapping() {
		User user = priceReport.getUser();
		assertNotNull(user);
		assertEquals("miles".toLowerCase(), user.getFirstName().toLowerCase());
	}
	
	@Test
	void test_PriceReport_GasStation_mto_mapping() {
		GasStation gasStation = priceReport.getGasStation();
		assertNotNull(gasStation);
		assertEquals("stinker".toLowerCase(), gasStation.getName().toLowerCase());
	}
	
	@Test
	void test_PriceReport_FuelType_mto_mapping() {
		FuelType fuelType = priceReport.getFuelType();
		assertNotNull(fuelType);
		assertEquals("unleaded".toLowerCase(), fuelType.getName().toLowerCase());
	}
	
	@Test
	void test_PriceReport_ReportVote_otm_mapping() {
		List<ReportVote> reportVotes = priceReport.getReportVotes();
		assertNotNull(reportVotes);
		assertTrue(reportVotes.size() > 0);
	}

}
