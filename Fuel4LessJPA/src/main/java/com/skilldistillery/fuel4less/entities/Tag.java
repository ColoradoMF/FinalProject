package com.skilldistillery.fuel4less.entities;

import java.util.List;
import java.util.Objects;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;

@Entity
public class Tag {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	private String description;
	
	@Column(name="image_url")
	private String imgageUrl;
	
	@JsonIgnore
	@ManyToMany
	@JoinTable(name = "gas_station_has_tag",
	joinColumns=@JoinColumn(name = "tag_id"),
	inverseJoinColumns=@JoinColumn(name = "gas_station_id"))
	private List<GasStation> gasStations;

	public Tag() {
		super();
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImgageUrl() {
		return imgageUrl;
	}

	public void setImgageUrl(String imgageUrl) {
		this.imgageUrl = imgageUrl;
	}

	public List<GasStation> getGasStations() {
		return gasStations;
	}

	public void setGasStations(List<GasStation> gasStations) {
		this.gasStations = gasStations;
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
		Tag other = (Tag) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Tag [id=").append(id).append(", name=").append(name).append(", description=")
				.append(description).append(", imgageUrl=").append(imgageUrl).append("]");
		return builder.toString();
	}
	
}
