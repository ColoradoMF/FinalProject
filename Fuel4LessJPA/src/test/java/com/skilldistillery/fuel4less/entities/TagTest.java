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

class TagTest {
	
	private static EntityManagerFactory emf;
	private static EntityManager em;
	private Tag tag;
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
		 tag = em.find(Tag.class, 1);
	 }


	 @AfterEach
	 void tearDown() throws Exception {
		 em.close();
		 tag = null;
	 }
	 
	@Test
	void test_Tag_Entity_mapping() {
		assertNotNull(tag);
		assertEquals("EV Charger", tag.getName());
	}

	@Test
	void test_Tag_GasStation_ManyToMany_mapping() {
		Tag tag = em.find(Tag.class, 1);
		List<GasStation> gasStations = tag.getGasStations();
		assertNotNull(gasStations);
		assertTrue(gasStations.size() > 0);
	}

}
