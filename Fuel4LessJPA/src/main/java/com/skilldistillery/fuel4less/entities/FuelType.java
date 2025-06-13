package com.skilldistillery.fuel4less.entities;

import java.util.List;
import java.util.Objects;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="fuel_type")
public class FuelType {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	@Column(name="image_url")
	private String imageUrl;
	
	@JsonIgnore
	@OneToMany(mappedBy="fuelType")
	private List<PriceReport> priceReports;
	
	
	public FuelType() {
		super();
	}


	@Override
	public int hashCode() {
		return Objects.hash(id);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		FuelType other = (FuelType) obj;
		return id == other.id;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getImageUrl() {
		return imageUrl;
	}


	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}


	public List<PriceReport> getPriceReports() {
		return priceReports;
	}


	public void setPriceReports(List<PriceReport> priceReports) {
		this.priceReports = priceReports;
	}


	@Override
	public String toString() {
		return "FuelType [id=" + id + ", name=" + name + ", imageUrl=" + imageUrl + "]";
	}
	
	

}
