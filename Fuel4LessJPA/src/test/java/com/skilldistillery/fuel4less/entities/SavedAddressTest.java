package com.skilldistillery.fuel4less.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class SavedAddressTest {
	
	private static EntityManagerFactory emf;
	private static EntityManager em;
	private SavedAddress savedAddress;
	
	
	
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
		 SavedAddressId sid = new SavedAddressId();
		 sid.setUserId(2);
		 sid.setAddressId(3);
		 savedAddress = em.find(SavedAddress.class, sid);
	 }


	 @AfterEach
	 void tearDown() throws Exception {
		 em.close();
		 savedAddress = null;
	 }
	 
	@Test
	void test_SavedAddress_Entity_mapping() {
	assertNotNull(savedAddress);
	assertEquals("home", savedAddress.getName());
	}

}
