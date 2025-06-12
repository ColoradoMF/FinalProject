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

class ReportVoteTest {
	
	private static EntityManagerFactory emf;
	private static EntityManager em;
	private ReportVote reportVote;
	
	
	
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
		 ReportVoteId rid = new ReportVoteId();
		 rid.setUserId(3);
		 rid.setPriceReport(1);
		 reportVote = em.find(ReportVote.class, rid);
	 }


	 @AfterEach
	 void tearDown() throws Exception {
		 em.close();
		 reportVote = null;
	 }
	 
	@Test
	void test_ReportVote_Entity_mapping() {
		assertNotNull(reportVote);
//		assertEquals("2025-06-12 00:00:00", reportVote.getCreateDate());
	}

}
