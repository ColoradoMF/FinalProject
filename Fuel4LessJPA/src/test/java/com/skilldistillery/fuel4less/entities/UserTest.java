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

class UserTest {
	
	private static EntityManagerFactory emf;
	private static EntityManager em;
	private User user;
	
	
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
		 user = em.find(User.class, 3);
	 }


	 @AfterEach
	 void tearDown() throws Exception {
		 em.close();
		 user = null;
	 }
	 
	@Test
	void test_User_Entity_mapping() {
		user = em.find(User.class, 1);
		assertNotNull(user);
		assertEquals("test", user.getUsername());
		assertEquals("admin", user.getRole());
		assertTrue(user.isEnabled());
	}
	
	@Test
	void test_User_GasStation_ManyToMany_mapping() {
		List<GasStation> favoriteGasStations = user.getFavoriteGasStations();
		assertNotNull(user);
		assertNotNull(favoriteGasStations);
		assertTrue(favoriteGasStations.size() > 0);
	}
	
	@Test
	void test_User_PriceReport_otm_mapping() {
		List<PriceReport> priceReports = user.getPriceReports();
		assertNotNull(priceReports);
		assertTrue(priceReports.size() > 0);
	}
	
	@Test
	void test_User_GasStationReview_otm_mapping() {
		List<GasStationReview> gasStationReviews = user.getGasStationReviews();
		assertNotNull(gasStationReviews);
		assertTrue(gasStationReviews.size() > 0);
	}

}
