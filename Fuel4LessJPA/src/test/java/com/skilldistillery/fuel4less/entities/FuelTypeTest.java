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

class FuelTypeTest {
	
	private static EntityManagerFactory emf;
	private static EntityManager em;
	private FuelType fuelType;
	
	
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
		 fuelType = em.find(FuelType.class, 1);
	 }


	 @AfterEach
	 void tearDown() throws Exception {
		 em.close();
		 fuelType = null;
	 }
	 
	@Test
	void test_FuelType_Entity_mapping() {
		assertNotNull(fuelType);
		assertEquals("Unleaded", fuelType.getName());
	}
	
	@Test
	void test_FuelType_PriceReport_otm_mapping() {
		List<PriceReport> priceReports = fuelType.getPriceReports();
		assertNotNull(priceReports);
		assertTrue(priceReports.size() > 0);
	}

}
