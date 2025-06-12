package com.skilldistillery.fuel4less.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class GasStationReviewTest {
	
	private static EntityManagerFactory emf;
	private static EntityManager em;
	private GasStationReview review;
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
		 review = em.find(GasStationReview.class, 1);
	 }


	 @AfterEach
	 void tearDown() throws Exception {
		 em.close();
		 review = null;
	 }
	 
	@Test
	void test_GasStationReview_Entity_mapping() {
		assertNotNull(review);
		assertEquals("this place stinks", review.getComment());
	}
	
	@Test
	void test_GasStationReview_User_mto_mapping() {
		User user = review.getUser();
		assertNotNull(user);
		assertEquals("miles".toLowerCase(), user.getFirstName());
	}

}
