package com.skilldistillery.fuel4less.services;

import java.util.List;

import com.skilldistillery.fuel4less.entities.GasStationReview;

public interface GasStationReviewService {
	GasStationReview findById(int id);
	List<GasStationReview> findAll();
	GasStationReview createGasStationReview(GasStationReview newGasStationReview);
	GasStationReview updateGasStationReview(int id, GasStationReview updateReview);
	boolean deleteGasStationReviewById(int id);

}
