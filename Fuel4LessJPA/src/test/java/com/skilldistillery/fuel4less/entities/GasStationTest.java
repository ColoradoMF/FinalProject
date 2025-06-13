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

class GasStationTest {
	
	private static EntityManagerFactory emf;
	private static EntityManager em;
	private GasStation gasStation;
	
	
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
		 gasStation = em.find(GasStation.class, 1);
	 }


	 @AfterEach
	 void tearDown() throws Exception {
		 em.close();
		 gasStation = null;
	 }
	 
	@Test
	void test_GasStation_Entity_mapping() {
		assertNotNull(gasStation);
		assertEquals("Stinker".toLowerCase(), gasStation.getName().toLowerCase());
	}
	
	@Test
	void test_GasStation_Address_OTO_mapping() {
		assertNotNull(gasStation);
		assertEquals("80110", gasStation.getAddress().getZipCode());
	}
	
	@Test
	void test_GasStation_User_ManyToMany_mapping() {
		List<User> users = gasStation.getUsers();
		assertNotNull(gasStation);
		assertNotNull(users);
		assertTrue(users.size() > 0);
	}
	
	@Test
	void test_GasStation_Tag_ManyToMany_mapping() {
		List<Tag> tags = gasStation.getTags();
		assertNotNull(gasStation);
		assertNotNull(tags);
		assertTrue(tags.size() > 0);
	}
	
	@Test
	void test_GasStation_PriceReport_OneToMany_mapping() {
		List<PriceReport> priceReports = gasStation.getPriceReports();
		assertNotNull(gasStation);
		assertNotNull(priceReports);
		assertTrue(priceReports.size() > 0);
	}
	
	@Test
	void test_GasStation_GasStationReview_OneToMany_mapping() {
		List<GasStationReview> gasStationReview = gasStation.getGasStationReview();
		assertNotNull(gasStation);
		assertNotNull(gasStationReview);
		assertTrue(gasStationReview.size() > 0);
	}
	
	@Test
	void test_GasStation_Address_oto_mapping() {
		Address address = gasStation.getAddress();
		assertNotNull(address);
		assertEquals("800 W Hampden Ave", address.getStreet());
		
	}

}
