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
		GasStation gasStation = em.find(GasStation.class, 1);
		List<User> users = gasStation.getUsers();
		assertNotNull(gasStation);
		assertNotNull(users);
		assertTrue(users.size() > 0);
	}

}
